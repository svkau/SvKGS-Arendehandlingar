"""Hittar och laddar scheman för SvKGS Ärendehandlingar utan att behöva nätverk för repots egna filer.

lxml kan inte hämta https-adresser i xs:import, och ERMS-SVK-element.xsd v1 finns inte alltid
på webbservern. Därför mappas schema-URL:er till lokala filer:

- .../ERMS-SVK-ARENDE/vN/ERMS-SVK-ARENDE.xsd  -> repots ERMS-SVK-ARENDE.xsd
- .../ERMS-SVK/v1/ERMS-SVK-element.xsd        -> $ERMS_SVK_ELEMENT eller ../erms-svk/ERMS-SVK-element.xsd
- övriga https-adresser                        -> hämtas och cachas i tools/.cache/
"""
from __future__ import annotations

import hashlib
import os
import urllib.request
import zipfile
from pathlib import Path

from lxml import etree

TOOLS = Path(__file__).resolve().parent
REPO = TOOLS.parent
CACHE = TOOLS / ".cache"

ERMS_NS = "https://DILCIS.eu/XML/ERMS"
ELM_URL_PREFIX = "https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK/"
ARENDE_URL_PREFIX = "https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK-ARENDE/"
ERMS_XSD_URL = "https://citserms.dilcis.eu/schema/ERMS_v3.xsd"
ERMS_SCH_URL = "https://citserms.dilcis.eu/schema/erms_v3.sch"

SCHXSLT_URL = "https://repo1.maven.org/maven2/name/dmaus/schxslt/schxslt/1.10.1/schxslt-1.10.1.jar"
SCHXSLT_SHA1 = "daae9060a2b18b845fd15dfc1f238f9b68784d9b"


def download(url: str, sha1: str | None = None) -> Path:
    """Hämtar url till cachen (en gång) och returnerar sökvägen. Kontrollerar sha1 om den anges."""
    CACHE.mkdir(exist_ok=True)
    target = CACHE / url.split("://", 1)[1].replace("/", "_")
    if not target.exists():
        with urllib.request.urlopen(url, timeout=60) as r:
            data = r.read()
        if sha1 and hashlib.sha1(data).hexdigest() != sha1:
            raise RuntimeError(f"Fel kontrollsumma för {url}")
        target.write_bytes(data)
    return target


def element_xsd() -> Path:
    """Lokal ERMS-SVK-element.xsd (v1): $ERMS_SVK_ELEMENT, annars syskonrepot erms-svk."""
    env = os.environ.get("ERMS_SVK_ELEMENT")
    path = Path(env) if env else REPO.parent / "erms-svk" / "ERMS-SVK-element.xsd"
    if not path.exists():
        raise FileNotFoundError(
            f"Hittar inte ERMS-SVK-element.xsd ({path}). Ange sökvägen med miljövariabeln ERMS_SVK_ELEMENT.")
    return path


def local_path(url: str) -> Path:
    """Returnerar en lokal fil för en schema-URL."""
    if url.startswith(ARENDE_URL_PREFIX) and url.endswith("/ERMS-SVK-ARENDE.xsd"):
        return REPO / "ERMS-SVK-ARENDE.xsd"
    if url.startswith(ELM_URL_PREFIX) and url.endswith("/ERMS-SVK-element.xsd"):
        return element_xsd()
    return download(url)


class _Resolver(etree.Resolver):
    def resolve(self, url, pubid, context):
        if url and url.startswith(("http://", "https://")):
            return self.resolve_filename(str(local_path(url)), context)
        return None


def _parser() -> etree.XMLParser:
    parser = etree.XMLParser()
    parser.resolvers.add(_Resolver())
    return parser


def xml_schema(path: Path) -> etree.XMLSchema:
    """Laddar ett XSD där https-importer löses lokalt."""
    return etree.XMLSchema(etree.parse(str(path), _parser()))


def erms_schema() -> etree.XMLSchema:
    """ERMS_v3.xsd från DILCIS (cachad)."""
    return xml_schema(download(ERMS_XSD_URL))


def arende_schema() -> etree.XMLSchema:
    """Repots ERMS-SVK-ARENDE.xsd."""
    return xml_schema(REPO / "ERMS-SVK-ARENDE.xsd")


def arende_namespace() -> str:
    """targetNamespace i repots ERMS-SVK-ARENDE.xsd (skiljer sig mellan v1 och v2)."""
    return etree.parse(str(REPO / "ERMS-SVK-ARENDE.xsd")).getroot().get("targetNamespace")


def schxslt_pipeline() -> Path:
    """SchXslt:s XSLT 2.0-pipeline som kompilerar Schematron till XSLT (hämtas från Maven Central)."""
    jar = download(SCHXSLT_URL, SCHXSLT_SHA1)
    out = CACHE / "schxslt-1.10.1"
    if not out.exists():
        with zipfile.ZipFile(jar) as z:
            z.extractall(out)
    return out / "xslt" / "2.0" / "pipeline-for-svrl.xsl"
