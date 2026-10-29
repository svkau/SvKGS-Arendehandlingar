"""Validerar XML-dokument enligt SvKGS Ärendehandlingar.

Användning (från repots rot):
    uv run --project tools tools/validate.py [--erms-sch] fil.xml [...]

Steg:
1. Hela dokumentet mot ERMS_v3.xsd.
2. Varje svk:ermsSvkArende mot ERMS-SVK-ARENDE.xsd (additionalXMLData valideras inte strikt av ERMS).
3. Mot ERMS-SVK-ARENDE.sch (XSLT 1.0), om filen finns (v2).
4. Med --erms-sch även mot DILCIS erms_v3.sch.

Avslutas med kod 1 om något fel hittas.
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

from lxml import etree

import schemas


def xsd_errors(doc: etree._ElementTree) -> list[str]:
    """Kör steg 1-2 och returnerar felmeddelanden."""
    errors = []
    erms = schemas.erms_schema()
    if not erms.validate(doc):
        errors += [f"ERMS_v3.xsd rad {e.line}: {e.message}" for e in erms.error_log]
    arende = schemas.arende_schema()
    ns = schemas.arende_namespace()
    found = doc.getroot().iter(f"{{{ns}}}ermsSvkArende")
    count = 0
    for el in found:
        count += 1
        if not arende.validate(etree.ElementTree(el)):
            errors += [f"ERMS-SVK-ARENDE.xsd (element på rad {el.sourceline}): {e.message}"
                       for e in arende.error_log]
    if count == 0:
        errors.append(f"Inget svk:ermsSvkArende i namnrymden {ns} hittades.")
    return errors


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[1])
    ap.add_argument("files", nargs="+", type=Path)
    ap.add_argument("--erms-sch", action="store_true", help="validera även mot DILCIS erms_v3.sch")
    args = ap.parse_args(argv)

    sch_files = []
    if (schemas.REPO / "ERMS-SVK-ARENDE.sch").exists():
        sch_files.append(schemas.REPO / "ERMS-SVK-ARENDE.sch")
    if args.erms_sch:
        sch_files.append(schemas.download(schemas.ERMS_SCH_URL))

    from schematron import Schematron  # importeras bara när det behövs (saxonche är stort)
    compiled = [(p.name, Schematron(p)) for p in sch_files]

    bad = 0
    for f in args.files:
        doc = etree.parse(str(f))
        errors = xsd_errors(doc)
        for name, sch in compiled:
            errors += [f"{name} [{i}]: {msg}\n      vid {loc}" for i, msg, loc in sch.failures(f)]
        print(f"{f}: {'OK' if not errors else f'{len(errors)} fel'}")
        for e in errors:
            print("   ", e)
        bad += bool(errors)
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
