"""Kör Schematron och returnerar fel i ett gemensamt format.

- queryBinding "xslt" (XSLT 1.0): lxml.isoschematron, dvs. ISO-skelettet på libxslt. libxslt är en
  ren XSLT 1.0-processor, så XPath 2.0 i ett sådant schema ger fel i stället för att tyst fungera.
- queryBinding "xslt2": Saxon HE (saxonche) och SchXslt.
"""
from __future__ import annotations

import re
from functools import cache
from pathlib import Path

from lxml import etree, isoschematron

from schemas import schxslt_pipeline

SVRL = {"svrl": "http://purl.oclc.org/dsdl/svrl"}


@cache
def _processor():
    """En gemensam Saxon-processor för hela processen (importeras bara när den behövs)."""
    from saxonche import PySaxonProcessor
    return PySaxonProcessor(license=False)


def _readable_location(location: str) -> str:
    """Tar bort namnrymder ur en SVRL-plats, för läsbarhet."""
    location = re.sub(r"Q\{[^}]*\}", "", location)  # Saxon/SchXslt
    location = re.sub(r"\*\[local-name\(\)='([^']*)' and namespace-uri\(\)='[^']*'\]", r"\1", location)  # ISO-skelettet
    return location


class Schematron:
    """Ett Schematron-schema som har kompilerats till en validerings-XSLT."""

    def __init__(self, sch: Path):
        sch = Path(sch).resolve()
        self.query_binding = etree.parse(str(sch)).getroot().get("queryBinding", "xslt")
        if self.query_binding == "xslt2":
            proc = _processor()
            pipeline = proc.new_xslt30_processor().compile_stylesheet(stylesheet_file=str(schxslt_pipeline()))
            validator = pipeline.transform_to_string(source_file=str(sch))
            self._exe = proc.new_xslt30_processor().compile_stylesheet(stylesheet_text=validator)
        elif self.query_binding == "xslt":
            self._iso = isoschematron.Schematron(etree.parse(str(sch)), store_report=True)
        else:
            raise ValueError(f"{sch.name}: queryBinding {self.query_binding!r} stöds inte")

    def _svrl(self, doc: etree._ElementTree | Path) -> etree._Element:
        if self.query_binding == "xslt":
            if isinstance(doc, Path):
                doc = etree.parse(str(doc))
            self._iso.validate(doc)
            return self._iso.validation_report.getroot()
        if isinstance(doc, Path):
            out = self._exe.transform_to_string(source_file=str(doc.resolve()))
        else:
            node = _processor().parse_xml(xml_text=etree.tostring(doc, encoding="unicode"))
            out = self._exe.transform_to_string(xdm_node=node)
        return etree.fromstring(out.encode())

    def failures(self, doc: etree._ElementTree | Path) -> list[tuple[str, str, str]]:
        """Returnerar (id, meddelande, plats) för varje failed-assert och successful-report."""
        result = []
        for f in self._svrl(doc).xpath("//svrl:failed-assert | //svrl:successful-report", namespaces=SVRL):
            text = " ".join("".join(f.xpath("svrl:text//text()", namespaces=SVRL)).split())
            result.append((f.get("id") or "-", text, _readable_location(f.get("location") or "")))
        return result
