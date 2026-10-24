"""Kör Schematron (queryBinding xslt2) med Saxon HE (saxonche) och SchXslt."""
from __future__ import annotations

import re
from functools import cache
from pathlib import Path

from lxml import etree
from saxonche import PySaxonProcessor

from schemas import schxslt_pipeline

SVRL = {"svrl": "http://purl.oclc.org/dsdl/svrl"}


@cache
def _processor() -> PySaxonProcessor:
    """En gemensam Saxon-processor för hela processen."""
    return PySaxonProcessor(license=False)


class Schematron:
    """Ett Schematron-schema som har kompilerats till en validerings-XSLT."""

    def __init__(self, sch: Path):
        proc = _processor()
        pipeline = proc.new_xslt30_processor().compile_stylesheet(stylesheet_file=str(schxslt_pipeline()))
        validator = pipeline.transform_to_string(source_file=str(Path(sch).resolve()))
        self._exe = proc.new_xslt30_processor().compile_stylesheet(stylesheet_text=validator)

    def failures(self, doc: etree._ElementTree | Path) -> list[tuple[str, str, str]]:
        """Returnerar (id, meddelande, plats) för varje failed-assert och successful-report."""
        if isinstance(doc, Path):
            out = self._exe.transform_to_string(source_file=str(doc.resolve()))
        else:
            node = _processor().parse_xml(xml_text=etree.tostring(doc, encoding="unicode"))
            out = self._exe.transform_to_string(xdm_node=node)
        svrl = etree.fromstring(out.encode())
        result = []
        for f in svrl.xpath("//svrl:failed-assert | //svrl:successful-report", namespaces=SVRL):
            text = " ".join("".join(f.xpath("svrl:text//text()", namespaces=SVRL)).split())
            location = re.sub(r"Q\{[^}]*\}", "", f.get("location") or "")  # utan namnrymder, för läsbarhet
            result.append((f.get("id") or "-", text, location))
        return result
