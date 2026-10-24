"""Kontrollerar att specifikationen stämmer med schemana.

Användning (från repots rot):
    uv run --project tools tools/check_spec.py

1. Exempel: varje ```xml-block i ERMS-SVK-ARENDE.md placeras i en kopia av exempel.xml
   (ERMS-fragment) eller i svk:ermsSvkArende (SvK-fragment) och valideras mot XSD.
2. Länkar: interna markdown-länkar (#ankare och fil.md#ankare) pekar på befintliga rubriker.
3. Värdelistor: listor som motsvarar en uppräkning i XSD stämmer med den. Egna listor ska vara
   exakt lika, ERMS-listor ska vara en delmängd, och värden märkta ERMS-SVK får inte finnas i ERMS.

Avslutas med kod 1 om något fel hittas.
"""
from __future__ import annotations

import copy
import re
import sys
from pathlib import Path
from urllib.parse import unquote

from lxml import etree

import schemas

SPEC = schemas.REPO / "ERMS-SVK-ARENDE.md"
VARDELISTOR = schemas.REPO / "ERMS-SVK-ARENDE-vardelistor.md"
ERMS = schemas.ERMS_NS
ELM = "https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK/v1"
XS = {"xs": "http://www.w3.org/2001/XMLSchema"}


def q(name: str, ns: str = ERMS) -> str:
    return f"{{{ns}}}{name}"


# ------------------------------------------------------------------ 1. Exempel

def _merge(parent, frag_children):
    """Ersätter parent:s barn med samma namn som fragmentets barn, på samma plats."""
    for name in dict.fromkeys(c.tag for c in frag_children):
        old = [c for c in parent if c.tag == name]
        if not old:
            raise ValueError(f"{etree.QName(name).localname} saknas i exempel.xml")
        pos = parent.index(old[0])
        for o in old:
            parent.remove(o)
        for i, c in enumerate([c for c in frag_children if c.tag == name]):
            parent.insert(pos + i, copy.deepcopy(c))


def check_examples() -> int:
    erms_xsd, arende_xsd = schemas.erms_schema(), schemas.arende_schema()
    arende_root = etree.parse(str(schemas.REPO / "ERMS-SVK-ARENDE.xsd")).getroot()
    svk, svk_version = arende_root.get("targetNamespace"), arende_root.get("version")
    base = etree.parse(str(schemas.REPO / "exempel.xml"))

    def place(frag):
        doc = copy.deepcopy(base)
        root = doc.getroot()
        agg = root.find(f"{q('aggregations')}/{q('aggregation')}")
        rec = agg.find(q("record"))
        ctx = {"control": root.find(q("control")), "aggregation": agg, "record": rec}
        tag = etree.QName(frag)
        if tag.namespace in (svk, ELM):
            wrap = etree.Element(q("ermsSvkArende", svk), ermsSvkArendeVersion=svk_version)
            if tag.namespace == ELM:  # elm-element läggs i ermsSvkRecord (svkNotes i ermsSvkAggregation)
                name = "ermsSvkAggregation" if tag.localname == "svkNotes" else "ermsSvkRecord"
                etree.SubElement(wrap, q(name, svk)).append(frag)
            else:
                wrap.append(frag)
            return arende_xsd, etree.ElementTree(wrap)
        if tag.localname in ctx:
            target = ctx[tag.localname]
            for k, v in frag.attrib.items():
                target.set(k, v)
            kids = [c for c in frag if isinstance(c.tag, str)]
            if kids:
                _merge(target, kids)
        else:  # enskilt ERMS-element: placeras i handlingen eller ärendeakten
            _merge(rec if rec.find(frag.tag) is not None else agg, [frag])
        return erms_xsd, doc

    bad, heading = 0, None
    text = SPEC.read_text(encoding="utf-8")
    for m in re.finditer(r"^#### (Exempel [^\n]*)|^```xml\n(.*?)\n```", text, re.M | re.S):
        if m.group(1):
            heading = m.group(1)
            continue
        try:
            frag = etree.fromstring(f'<w xmlns="{ERMS}" xmlns:svk="{svk}" xmlns:elm="{ELM}">{m.group(2)}</w>')
            errors = []
            for el in [e for e in frag if isinstance(e.tag, str)]:
                schema, doc = place(el)
                if not schema.validate(doc):
                    errors += [e.message[:200] for e in schema.error_log]
        except Exception as e:  # ej välformad eller kan inte placeras
            errors = [f"{type(e).__name__}: {e}"]
        if errors:
            bad += 1
            print(f"FEL {heading}")
            for e in dict.fromkeys(errors):
                print("    ", e)
    print(f"Exempel: {'alla validerar' if not bad else f'{bad} fel'}")
    return bad


# ------------------------------------------------------------------ 2. Länkar

def _slug(heading: str) -> str:
    """GitHubs ankare för en rubrik."""
    return re.sub(r"[^\w\- ]", "", heading.strip().lower()).replace(" ", "-")


def _anchors(path: Path) -> set[str]:
    out, fence = set(), False
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("```"):
            fence = not fence
        elif not fence and (m := re.match(r"#{1,6} (.*)", line)):
            out.add(_slug(m.group(1)))
    return out


def check_links() -> int:
    bad = 0
    for path in (SPEC, VARDELISTOR):
        text = path.read_text(encoding="utf-8")
        for m in re.finditer(r"\]\(([^)\s]*)\)", text):
            target = m.group(1)
            if target.startswith(("http://", "https://")):
                continue
            f, _, anchor = target.partition("#")
            fp = path.parent / f if f else path
            line = text[:m.start()].count("\n") + 1
            if not fp.exists():
                print(f"FEL {path.name}:{line}: filen saknas: {target}")
                bad += 1
            elif anchor and unquote(anchor) not in _anchors(fp):
                print(f"FEL {path.name}:{line}: ankaret saknas: {target}")
                bad += 1
    print(f"Länkar: {'alla fungerar' if not bad else f'{bad} trasiga'}")
    return bad


# ------------------------------------------------------------------ 3. Värdelistor

def check_value_lists() -> int:
    lists, cur = {}, None
    for line in VARDELISTOR.read_text(encoding="utf-8").splitlines():
        if m := re.match(r"## ERMS-SVK-ARENDE-värdelista (\d+)", line):
            cur = int(m.group(1))
            lists[cur] = {}
        elif cur and (m := re.match(r"\|\s*([^|*\s][^|]*?)\s*\|[^|]*\|\s*([^|]*?)\s*\|", line)):
            if not set(m.group(1)) <= set("-"):
                lists[cur][m.group(1)] = m.group(2)

    erms_xsd = schemas.download(schemas.ERMS_XSD_URL)
    elm_xsd = schemas.element_xsd()

    def enum(xsd: Path, xpath: str) -> set[str]:
        nodes = etree.parse(str(xsd)).xpath(xpath, namespaces=XS)
        if not nodes:
            raise ValueError(f"{xpath} saknas i {xsd.name}")
        return {e.get("value") for e in nodes[0].iter(f"{{{XS['xs']}}}enumeration")}

    first = lambda n: f"(//xs:attribute[@name='{n}'] | //xs:element[@name='{n}'])[1]"
    checks = {  # lista: (schema, xpath, exakt lika? annars delmängd)
        3: (erms_xsd, first("maintenanceStatus"), True),
        5: (erms_xsd, first("eventType"), True),
        6: (erms_xsd, first("agentType"), False),
        7: (erms_xsd, "//xs:simpleType[xs:restriction/xs:enumeration/@value='obliterated']", False),
        9: (elm_xsd, first("initiative"), True),
        10: (elm_xsd, first("typeOfNote"), True),
        14: (erms_xsd, first("recordPhysicalOrDigital"), True),
        15: (erms_xsd, first("directionDefinition"), False),
        16: (elm_xsd, first("typeOfAgreement"), True),
        17: (elm_xsd, first("variant"), True),
        18: (elm_xsd, first("typeOfObject"), True),
        19: (elm_xsd, first("typeOfWorkflow"), True),
        20: (elm_xsd, "//xs:simpleType[@name='workflowStatusType']", True),
        22: (erms_xsd, "(//xs:attribute[@name='dateType'])[1]", False),
    }
    bad = 0
    for n, (xsd, xpath, exact) in checks.items():
        values = lists[n]
        listed = {v for v, src in values.items() if src == "ERMS" or xsd == elm_xsd}
        svk_only = {v for v, src in values.items() if src == "ERMS-SVK" and xsd == erms_xsd}
        allowed = enum(xsd, xpath)
        problems = []
        if listed - allowed:
            problems.append(f"saknas i XSD: {sorted(listed - allowed)}")
        if exact and allowed - listed:
            problems.append(f"finns i XSD men inte i listan: {sorted(allowed - listed)}")
        if svk_only & allowed:
            problems.append(f"märkt ERMS-SVK men finns i ERMS: {sorted(svk_only & allowed)}")
        if problems:
            bad += 1
            print(f"FEL Värdelista {n}: " + "; ".join(problems))
    print(f"Värdelistor: {'stämmer med XSD' if not bad else f'{bad} avviker'}")
    return bad


if __name__ == "__main__":
    sys.exit(1 if (check_examples() + check_links() + check_value_lists()) else 0)
