# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

*SvKGS-Ärendehandlingar* (Svenska kyrkans gemensamma specifikationer – Ärendehandlingar) defines how data from case management and diary systems (*ärendehanterings- och diariesystem*) shall be formatted for delivery to the Swedish Church's common e-archive (*gemensamma e-arkiv*).

This is a **pure specification repository** — there are no build tools, package managers, or test runners. All documentation is in Swedish.

## Versions and branches

| Branch | Version | Content |
|--------|---------|---------|
| `v1` | 1.x (currently 1.1) | Plain ERMS + ERMS-SVK elements. XSD validation only, **no own Schematron**. SvK requirements are written as recommendations ("bör"). |
| `Uppdateringar-inför-v2` → later `main` | 2.x | Rules with "ska" and an own Schematron (`ERMS-SVK-ARENDE.sch`). |

The branch model mirrors the sibling repo `erms-svk` (svkau/ERMS-SVK). Links in v1 documents must not point to GitHub `main`, because `main` will become v2.

## Namespaces and schema URLs

Schemas are served from `https://earkiv.svenskakyrkan.se/schemas/<SCHEMA>/vN/<file>`. The namespace is the same URL without the file name and **without a trailing slash**. File names never change. Minor versions (1.1, 1.2 …) keep the namespace.

| Schema | Namespace | Version |
|--------|-----------|---------|
| `ERMS-SVK-ARENDE.xsd` (this repo, v1) | `https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK-ARENDE/v1` | 1.1 |
| `ERMS-SVK-ARENDE.xsd` (this repo, v2) | `https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK-ARENDE/v2` | 2.0 |
| `ERMS-SVK-element.xsd` (repo erms-svk) | `https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK/v1` — imported by both ARENDE v1 and v2 | 1.1 |
| `ERMS_v3.xsd` (DILCIS) | `https://DILCIS.eu/XML/ERMS`, from `https://citserms.dilcis.eu/schema/ERMS_v3.xsd` (unversioned URL, currently 3.0.2) | 3.0.2 |
| `erms_v3.sch` (DILCIS) | – recommended, not required | 3.0.0 |

The old namespaces `https://xml.svenskakyrkan.se/ERMS-SVK-ARENDE` and `https://xml.svenskakyrkan.se/ERMS-SVK-element` (version 1.0) are no longer used.

In XML instances the conventional prefixes are `svk` for ERMS-SVK-ARENDE and `elm` for ERMS-SVK.

## Key Files

| File | Role |
|------|------|
| `ERMS-SVK-ARENDE.md` | Main specification: all data elements (ERMS-SVK:n), recommendations and examples |
| `ERMS-SVK-ARENDE-vardelistor.md` | Controlled vocabularies / value lists used by the spec |
| `ERMS-SVK-ARENDE.xsd` | XML Schema — defines the root element `ermsSvkArende` placed in `additionalXMLData` |
| `exempel.xml` | Complete XML instance; must validate against the XSDs |
| `README.md` / `readme.html` | Overview with versions and schema links; keep the two in sync |

Files use CRLF line endings (`.xsd`, `.xml`); preserve them when editing.

## XML Schema Architecture

The root element `ermsSvkArende` (required attribute `ermsSvkArendeVersion`, decimal, e.g. `1.1`) contains a **choice** between:

- **`ermsSvkAggregation`** — case file (*ärende*); may contain:
  `initiative`, `relatedObjects`, `svkNotes`, `auditLogEvents`

- **`ermsSvkRecord`** — record (*handling*); may contain:
  `relatedObjects`, `svkNotes`, `contractInfo`, `workflows`, `boardMeetingInformation`, `svkAppendix` (0..*), `auditLogEvents`

All child elements come from the ERMS-SVK namespace.

## Validation

Validate `exempel.xml` (and any changed instance) before considering XML work done:
1. The whole document against `ERMS_v3.xsd`.
2. Each `svk:ermsSvkArende` element against `ERMS-SVK-ARENDE.xsd` (`additionalXMLData` is not strictly validated by ERMS_v3.xsd).
3. Optionally against DILCIS `erms_v3.sch`.

libxml2/lxml cannot fetch `https` schemaLocations, so make local copies with rewritten `schemaLocation` in a scratch directory. Run lxml through `uv run --no-project --with lxml` and do not add it to the repo without asking.

## Standards Basis

- **CITS ERMS** (DILCIS Board) — the international base standard this specification adapts
- **FGS Ärendehantering 2.0** (Riksarkivet) — Swedish national archival specification; this spec is compatible with it
- **FGS Paketstruktur** — packaging structure standard
