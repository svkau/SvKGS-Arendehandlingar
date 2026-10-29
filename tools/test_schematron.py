"""Mutationstester för ERMS-SVK-ARENDE.sch (XSLT 1.0) och ERMS-SVK-ARENDE-xslt2.sch (v2).

Varje fall ändrar exempel.xml på ett ställe och kontrollerar att exakt de förväntade
assert-id:na slår till. Testet kontrollerar också att varje assert i schemat har minst ett fall,
att exempel.xml är giltigt, att schemana är giltig ISO Schematron och att de två filerna
har samma assert-id:n. Samma fall körs mot båda filerna, så att de ger samma resultat.

Användning (från repots rot):
    uv run --project tools tools/test_schematron.py
"""
from __future__ import annotations

import copy
import re
import sys
from pathlib import Path

from lxml import etree, isoschematron

import schemas
from schematron import Schematron

E = "https://DILCIS.eu/XML/ERMS"
NS = {"e": E, "svk": schemas.arende_namespace(),
      "elm": "https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK/v1"}
AGG = "/e:erms/e:aggregations/e:aggregation"
REC = AGG + "/e:record[1]"
SVKR = REC + "/e:additionalInformation/e:additionalXMLData/svk:ermsSvkArende/svk:ermsSvkRecord"

def one(t, xp): r = t.xpath(xp, namespaces=NS); assert len(r) == 1, (xp, len(r)); return r[0]
def setattr_(xp, a, v): return lambda t: one(t, xp).set(a, v)
def delattr_(xp, a): return lambda t: one(t, xp).attrib.pop(a)
def settext(xp, v): return lambda t: setattr(one(t, xp), "text", v)
def remove(xp): return lambda t: [n.getparent().remove(n) for n in t.xpath(xp, namespaces=NS)]
def dup(xp): return lambda t: one(t, xp).addnext(copy.deepcopy(one(t, xp)))
def seq(*fs): return lambda t: [f(t) for f in fs]
def append(xp, frag):
    """Lägger till ett XML-fragment (ERMS som standardnamnrymd) sist i elementet xp."""
    decl = f'xmlns="{E}" xmlns:elm="{NS["elm"]}" xmlns:svk="{NS["svk"]}"'
    def f(t):
        wrap = etree.fromstring(f"<w {decl}>{frag}</w>")
        for c in list(wrap): one(t, xp).append(c)
    return f
SIG = """<elm:signatureInfo><dates><date dateType="created">2020-05-23T00:00:00</date></dates>
  <agent agentType="creator"><name>A</name></agent><elm:signatureStatus>Slutförd</elm:signatureStatus>
  <elm:signatureFileHash algorithm="SHA-256">abc</elm:signatureFileHash>
  <elm:signatories><elm:signatory><agent agentType="main_signatory"><name>B</name></agent>
  <dates><date dateType="main_signature">2020-05-24T00:00:00</date></dates></elm:signatory></elm:signatories>
</elm:signatureInfo>"""
APX = "(//elm:svkAppendix)[1]"
addsig = append(APX, SIG)

CASES = [
    ("arkivbildare saknas", remove("//e:control/e:identification[@identificationType='arkivbildare']"), {"ERMS-SVK-1-arkivbildare"}),
    ("ärendenummer-id dubbelt", dup("//e:control/e:identification[@identificationType='ärendenummer']"), {"ERMS-SVK-1-arendenummer", "ERMS-SVK-1-unik"}),
    ("orgnr och aid saknas", remove("//e:control/e:identification[@identificationType='organisationsnummer']"), {"ERMS-SVK-1-orgnr-aid"}),
    ("okänd identifikationstyp", setattr_("//e:control/e:identification[@identificationType='arkivbildare']", "identificationType", "namn"), {"ERMS-SVK-1-arkivbildare", "ERMS-SVK-2-vl1"}),
    ("orgnr med bindestreck", settext("//e:control/e:identification[@identificationType='organisationsnummer']", "123456-7890"), {"ERMS-SVK-2-orgnr-format"}),
    ("klassificeringsstruktur saknas", remove("//e:control/e:classificationSchema"), {"ERMS-SVK-4-finns"}),
    ("fel klassificeringsstruktur", settext("//e:textualDescriptionOfClassificationSchema/e:p", "Lokal nivå 2018"), {"ERMS-SVK-4-vl2"}),
    ("agencyCode saknas", remove("//e:agencyCode"), {"ERMS-SVK-9-finns"}),
    ("agencyCode fel typ", setattr_("//e:agencyCode", "type", "orgnr"), {"ERMS-SVK-10-vl4"}),
    ("ingen created-händelse", setattr_("//e:maintenanceEvent/e:eventType", "value", "updated"), {"ERMS-SVK-15-created"}),
    ("aktör other utan svk-värde", setattr_(AGG + "/e:agents/e:agent[@agentType='other']", "otherAgentType", "closer"), {"ERMS-SVK-19-other", "ERMS-SVK-65-typer"}),
    ("idNumberType användarnamn", setattr_(AGG + "/e:agents/e:agent[@agentType='creator']/e:idNumber", "idNumberType", "användarnamn"), {"ERMS-SVK-66-vl8"}),
    ("datumtyp utanför VL22", setattr_(AGG + "/e:dates/e:date[@dateType='opened']", "dateType", "first_used"), {"ERMS-SVK-date-vl22", "ERMS-SVK-75-opened"}),
    ("flera kommentarer", dup(AGG + "/e:notes/e:note"), {"ERMS-SVK-26-en"}),
    ("kommentar utan noteType", delattr_(AGG + "/e:notes/e:note", "noteType"), {"ERMS-SVK-26-comment"}),
    ("relatedObject utan typ", delattr_("(//elm:relatedObject)[1]", "typeOfObject"), {"ERMS-SVK-30-typ"}),
    ("svkNote utan typ", delattr_("(//elm:svkNote)[1]", "typeOfNote"), {"ERMS-SVK-36-typ"}),
    ("aggregationType fel", setattr_(AGG, "aggregationType", "file"), {"ERMS-SVK-50-casefile"}),
    ("systemIdentifier inte UUID", setattr_(AGG, "systemIdentifier", "abc"), {"ERMS-SVK-49-uuid"}),
    ("ärendenummer fel format", settext(AGG + "/e:objectId", "F 2020-32"), {"ERMS-SVK-51-format", "ERMS-SVK-89-format"}),
    ("arkivansvarigs id saknas", remove(AGG + "/e:extraId[@extraIdType='organisationsnummer']"), {"ERMS-SVK-52-finns"}),
    ("extraId okänd typ", setattr_(AGG + "/e:extraId[@extraIdType='deliveringSystemId']", "extraIdType", "internt"), {"ERMS-SVK-52-typ"}),
    ("otherTitle publicTitle", setattr_(AGG + "/e:otherTitle", "titleType", "publicTitle"), {"ERMS-SVK-61-public"}),
    ("ärendestatus saknas", remove(AGG + "/e:status"), {"ERMS-SVK-62-finns"}),
    ("ärendestatus open", setattr_(AGG + "/e:status", "value", "open"), {"ERMS-SVK-62-vl7"}),
    ("relation fel typ", setattr_(AGG + "/e:relation", "relationType", "has_version"), {"ERMS-SVK-63-reference"}),
    ("två handläggare", dup(AGG + "/e:agents/e:agent[@agentType='responsible_person']"), {"ERMS-SVK-67-en"}),
    ("closed-datum saknas", remove(AGG + "/e:dates/e:date[@dateType='closed']"), {"ERMS-SVK-76-closed"}),
    ("beslut fel actionType", settext(AGG + "/e:action/e:actionType", "åtgärd"), {"ERMS-SVK-79-beslut"}),
    ("beslutsfattare fel typ", setattr_(AGG + "/e:action/e:agents/e:agent", "agentType", "other"), {"ERMS-SVK-81-beslutsfattare", "ERMS-SVK-19-other"}),
    ("fel version", setattr_(AGG + "/e:additionalInformation/e:additionalXMLData/svk:ermsSvkArende", "ermsSvkArendeVersion", "1.1"), {"ERMS-SVK-83-version"}),
    ("recordType okänd", setattr_(REC, "recordType", "brev"), {"ERMS-SVK-87-vl13"}),
    ("handlingsnummer fel", settext(REC + "/e:objectId", "F 2020-0032:2"), {"ERMS-SVK-89-format"}),
    ("titel saknas", remove(REC + "/e:title"), {"ERMS-SVK-97-titel"}),
    ("löpnummer saknas", remove(REC + "/e:runningNumber"), {"ERMS-SVK-100-lopnummer", "ERMS-SVK-89-format"}),
    ("riktning internal utan other", setattr_(REC + "/e:direction", "directionDefinition", "internal_memo_for_follow-up"), {"ERMS-SVK-102-vl15"}),
    ("utgående utan mottagare", remove(REC + "/e:agents/e:agent[@agentType='receiver']"), {"ERMS-SVK-107-mottagare"}),
    ("inkommen utan avsändare", setattr_(REC + "/e:direction", "directionDefinition", "incoming"), {"ERMS-SVK-106-avsandare"}),
    ("handling med counterpart", setattr_(REC + "/e:agents/e:agent[@agentType='receiver']", "agentType", "counterpart"), {"ERMS-SVK-103-typer", "ERMS-SVK-107-mottagare"}),
    ("originated saknas", remove(REC + "/e:dates/e:date[@dateType='originated']"), {"ERMS-SVK-112-originated"}),
    ("handlingens extraId fel", setattr_(REC + "/e:extraId", "extraIdType", "organisationsnummer"), {"ERMS-SVK-90-typ"}),
    ("svkRecord saknas", remove(REC + "/e:additionalInformation"), {"ERMS-SVK-115-finns"}),
    ("avtal med fel datumtyp", setattr_(SVKR + "/elm:contractInfo/e:dates/e:date[@dateType='end']", "dateType", "closed"), {"ERMS-SVK-124-typer"}),
    ("prioritet normal", settext("(//elm:workflowPriority)[1]", "normal"), {"ERMS-SVK-131-vl21"}),
    ("workflow utan typ", delattr_("(//elm:workflow)[1]", "typeOfWorkflow"), {"ERMS-SVK-128-typ"}),
    ("closing_person saknas", remove("(//elm:workflowRecipient)[1]/elm:agents/e:agent[@otherAgentType='closing_person']"), {"ERMS-SVK-146-closing"}),
    ("finished blir created", setattr_("(//elm:workflowRecipient)[1]/e:dates/e:date", "dateType", "created"), {"ERMS-SVK-145-finished"}),
    ("filformat versaler", setattr_("(//elm:svkAppendix)[1]/e:appendix", "fileFormat", "PDF"), {"ERMS-SVK-162-format"}),
    ("signatureInfo giltig", addsig, set()),
    ("signatureInfo två datum", seq(addsig, append(APX + "/elm:signatureInfo/e:dates", '<date dateType="created">2020-05-25T00:00:00</date>')), {"ERMS-SVK-176-created"}),
    ("signatureInfo fel agenttyp", seq(addsig, setattr_(APX + "/elm:signatureInfo/e:agent", "agentType", "sender")), {"ERMS-SVK-177-creator"}),
    ("signatureInfo utan algoritm", seq(addsig, delattr_(APX + "//elm:signatureFileHash", "algorithm")), {"ERMS-SVK-180-algoritm"}),
    ("signatory fel agenttyp", seq(addsig, setattr_(APX + "//elm:signatory/e:agent", "agentType", "creator")), {"ERMS-SVK-182-main-signatory"}),
    ("signatory fel datumtyp", seq(addsig, setattr_(APX + "//elm:signatory/e:dates/e:date", "dateType", "created")), {"ERMS-SVK-183-main-signature"}),
    ("okänd agentType", setattr_("//e:maintenanceEvent/e:agent", "agentType", "owner"), {"ERMS-SVK-19-vl6"}),
    ("agencyCode orgnr fel", settext("//e:agencyCode", "12345"), {"ERMS-SVK-10-orgnr"}),
    ("otherAgencyCode utan typ", append("//e:maintenanceAgency", '<otherAgencyCode>5610</otherAgencyCode>'), {"ERMS-SVK-12-vl4"}),
    ("otherAgencyCode orgnr fel", append("//e:maintenanceAgency", '<otherAgencyCode type="organisationsnummer">12</otherAgencyCode>'), {"ERMS-SVK-12-orgnr"}),
    ("idNumber orgnr fel", seq(setattr_(AGG + "/e:agents/e:agent[@agentType='creator']/e:idNumber", "idNumberType", "organisationsnummer")), {"ERMS-SVK-66-orgnr"}),
    ("idNumber pnr fel", seq(setattr_(AGG + "/e:agents/e:agent[@agentType='creator']/e:idNumber", "idNumberType", "personnummer")), {"ERMS-SVK-66-pnr"}),
    ("sekretess other", setattr_(AGG + "/e:restriction", "restrictionType", "other_type"), {"ERMS-SVK-22-confidential"}),
    ("sekretess två datum", append(AGG + "/e:restriction/e:dates", '<date dateType="end">2030-01-01T00:00:00</date>'), {"ERMS-SVK-25-ett"}),
    ("relatedObject utan objectId", remove("(//elm:relatedObject)[1]/elm:objectId"), {"ERMS-SVK-32-objectid"}),
    ("svkNote fel agenttyp", setattr_("(//elm:svkNote)[1]/elm:agents/e:agent", "agentType", "editor"), {"ERMS-SVK-38-creator"}),
    ("svkNote fel datumtyp", setattr_("(//elm:svkNote)[1]/e:dates/e:date", "dateType", "modified"), {"ERMS-SVK-39-created"}),
    ("records i stället för aggregations", lambda t: setattr(one(t, "/e:erms/e:aggregations"), "tag", "{%s}records" % E), {"ERMS-SVK-48-aggregations"}),
    ("två ärendeakter", dup(AGG), {"ERMS-SVK-48-en"}),
    ("arkivansvarigs orgnr fel", settext(AGG + "/e:extraId[@extraIdType='organisationsnummer']", "123"), {"ERMS-SVK-52-orgnr"}),
    ("extraId dubbelt", dup(AGG + "/e:extraId[@extraIdType='deliveringSystemId']"), {"ERMS-SVK-52-unik"}),
    ("två offentliga titlar", dup(AGG + "/e:otherTitle"), {"ERMS-SVK-61-en"}),
    ("svkAggregation saknas", remove(AGG + "/e:additionalInformation"), {"ERMS-SVK-64-finns"}),
    ("två skapare", dup(AGG + "/e:agents/e:agent[@agentType='creator']"), {"ERMS-SVK-66-en"}),
    ("två avslutare", dup(AGG + "/e:agents/e:agent[@otherAgentType='closing_person']"), {"ERMS-SVK-71-en"}),
    ("ärendets datum saknas", remove(AGG + "/e:dates"), {"ERMS-SVK-73-finns"}),
    ("ärendets created dubbelt", dup(AGG + "/e:dates/e:date[@dateType='created']"), {"ERMS-SVK-74-created"}),
    ("beslutsdatum fel typ", setattr_(AGG + "/e:action/e:dates/e:actionDate", "dateType", "closed"), {"ERMS-SVK-80-decision-date"}),
    ("inga handlingar", remove(REC), {"ERMS-SVK-85-finns"}),
    ("handling utan UUID", setattr_(REC, "systemIdentifier", "1"), {"ERMS-SVK-86-uuid"}),
    ("handling två offentliga titlar", dup(REC + "/e:otherTitle"), {"ERMS-SVK-98-en"}),
    ("handling utan status", remove(REC + "/e:status"), {"ERMS-SVK-99-status"}),
    ("två handlingar samma löpnummer", dup(REC), {"ERMS-SVK-100-unikt"}),
    ("riktning saknas", remove(REC + "/e:direction"), {"ERMS-SVK-102-riktning"}),
    ("handlingens aktörer saknas", remove(REC + "/e:agents"), {"ERMS-SVK-103-aktorer"}),
    ("handling två skapare", dup(REC + "/e:agents/e:agent[@agentType='creator']"), {"ERMS-SVK-104-en"}),
    ("handling två ansvariga", dup(REC + "/e:agents/e:agent[@agentType='responsible_person']"), {"ERMS-SVK-105-en"}),
    ("handlingens datum saknas", remove(REC + "/e:dates"), {"ERMS-SVK-110-datum"}),
    ("handlingens created saknas", remove(REC + "/e:dates/e:date[@dateType='created']"), {"ERMS-SVK-111-created"}),
    ("två ankomstdatum", append(REC + "/e:dates", '<date dateType="received">2020-01-01T00:00:00</date><date dateType="received">2020-01-02T00:00:00</date>'), {"ERMS-SVK-113-received"}),
    ("två expedieringsdatum", append(REC + "/e:dates", '<date dateType="expedited">2020-01-01T00:00:00</date><date dateType="expedited">2020-01-02T00:00:00</date>'), {"ERMS-SVK-114-expedited"}),
    ("appendix direkt i record", append(REC + "/e:additionalInformation", '<appendix name="a" path="a.pdf"/>'), {"ERMS-SVK-157-appendix"}),
    ("två startdatum i avtal", dup(SVKR + "/elm:contractInfo/e:dates/e:date[@dateType='start']"), {"ERMS-SVK-124-en"}),
    ("workflow två initierare", dup("(//elm:workflow)[1]/elm:agents/e:agent"), {"ERMS-SVK-132-creator"}),
    ("workflow fel datumtyp", setattr_("(//elm:workflow)[1]/e:dates/e:date", "dateType", "start"), {"ERMS-SVK-133-created"}),
    ("workflowNote fel datumtyp", setattr_("(//elm:workflowNote)[1]/e:dates/e:date", "dateType", "modified"), {"ERMS-SVK-138-created"}),
    ("workflowNote creator", setattr_("(//elm:workflowNote)[1]/elm:agents/e:agent[@agentType='sender']", "agentType", "creator"), {"ERMS-SVK-139-typer"}),
    ("workflowNote två avsändare", dup("(//elm:workflowNote)[1]/elm:agents/e:agent[@agentType='sender']"), {"ERMS-SVK-139-en"}),
    ("recipient saknas", setattr_("(//elm:workflowRecipient)[1]/elm:agents/e:agent[@agentType='recipient']", "agentType", "receiver"), {"ERMS-SVK-143-recipient", "ERMS-SVK-143-typer"}),
    ("två delegatorer", append("(//elm:workflowRecipient)[1]/elm:agents", '<agent agentType="other" otherAgentType="delegator"><name>X</name></agent><agent agentType="other" otherAgentType="delegator"><name>Y</name></agent>'), {"ERMS-SVK-147-delegator"}),
    ("filformat saknas", delattr_(APX + "/e:appendix", "fileFormat"), {"ERMS-SVK-162-finns"}),
    ("originalfilformat med punkt", setattr_(APX + "/e:appendix", "originalFileFormat", ".docx"), {"ERMS-SVK-163-format"}),
    ("filinfo fel datumtyp", setattr_(APX + "/elm:fileInfo/e:dates/e:date[@dateType='modified']", "dateType", "opened"), {"ERMS-SVK-171-typer"}),
    ("filinfo två created", dup(APX + "/elm:fileInfo/e:dates/e:date[@dateType='created']"), {"ERMS-SVK-171-en"}),
    # Gränsfall för XSLT 1.0-omskrivningen (värdelistor som strängar, matches() ersatt)
    ("identifikationstyp med avgränsare", setattr_("//e:control/e:identification[@identificationType='arkivbildare']", "identificationType", "aid|arkivbildare"), {"ERMS-SVK-1-arkivbildare", "ERMS-SVK-2-vl1"}),
    ("okänd identifikationstyp dubbelt", append("//e:control", '<identification identificationType="namn">A</identification><identification identificationType="namn">B</identification>'), {"ERMS-SVK-2-vl1"}),
    ("prioritet med avgränsare", settext("(//elm:workflowPriority)[1]", "high|low"), {"ERMS-SVK-131-vl21"}),
    ("orgnr elva siffror", settext("//e:control/e:identification[@identificationType='organisationsnummer']", "12345678901"), {"ERMS-SVK-2-orgnr-format"}),
    ("ärendenummer två mellanslag", settext(AGG + "/e:objectId", "F  2020-0032"), {"ERMS-SVK-51-format", "ERMS-SVK-89-format"}),
    ("ärendenummer gemen diariekod", settext(AGG + "/e:objectId", "f 2020-0032"), {"ERMS-SVK-51-format", "ERMS-SVK-89-format"}),
    ("ärendenummer bokstav i löpnummer", settext(AGG + "/e:objectId", "F 2020-003A"), {"ERMS-SVK-51-format", "ERMS-SVK-89-format"}),
    ("UUID med versaler", setattr_(AGG, "systemIdentifier", "3B9FBC5F-3EAF-4521-9726-0F142FEB04C3"), set()),
    ("UUID bindestreck på fel plats", setattr_(AGG, "systemIdentifier", "3b9fbc5f3-eaf-4521-9726-0f142feb04c3"), {"ERMS-SVK-49-uuid"}),
    ("UUID med icke-hex", setattr_(REC, "systemIdentifier", "8dbbdc56-8ada-4ad5-a1ec-b8131a1086ag"), {"ERMS-SVK-86-uuid"}),
    ("filformat fem tecken", setattr_(APX + "/e:appendix", "fileFormat", "jpeg2"), {"ERMS-SVK-162-format"}),
    ("filformat tomt", setattr_(APX + "/e:appendix", "fileFormat", ""), {"ERMS-SVK-162-format"}),
]

# Huvudfilen (XSLT 1.0) och XSLT 2.0-varianten ska ha samma regler och ge samma resultat.
SCH_FILES = ["ERMS-SVK-ARENDE.sch", "ERMS-SVK-ARENDE-xslt2.sch"]


def iso_schematron_errors(sch_path) -> list[str]:
    """Validerar ett Schematron-schema mot ISO Schematrons RELAX NG (från lxml). Bl.a. måste alla id vara unika."""
    rng = Path(isoschematron.__file__).parent / "resources" / "rng" / "iso-schematron.rng"
    validator = etree.RelaxNG(etree.parse(str(rng)))
    if validator.validate(etree.parse(str(sch_path))):
        return []
    return [f"rad {e.line}: {e.message}" for e in validator.error_log]


def run_cases(sch_path) -> tuple[int, set[str]]:
    """Kör alla fall mot ett schema. Returnerar antal fel och schemats assert-id:n."""
    print(f"== {sch_path.name}")
    fails = 0
    errors = iso_schematron_errors(sch_path)
    for e in errors:
        print(f"FEL inte giltig ISO Schematron, {e}")
    fails += bool(errors)

    base = etree.parse(str(schemas.REPO / "exempel.xml"))
    sch = Schematron(sch_path)
    ids = lambda tree: {i for i, _, _ in sch.failures(tree)}

    got = ids(base)
    print(f"{'OK ' if not got else 'FEL'} giltigt exempel {sorted(got) if got else ''}")
    fails += bool(got)
    for name, mut, want in CASES:
        t = copy.deepcopy(base)
        mut(t)
        got = ids(t)
        ok = got == want
        fails += not ok
        print(f"{'OK ' if ok else 'FEL'} {name}"
              + ("" if ok else f"\n     väntat {sorted(want)}\n     fick   {sorted(got)}"))

    asserts = set(re.findall(r'<assert id="([^"]+)"', sch_path.read_text(encoding="utf-8")))
    tested = set().union(*(w for _, _, w in CASES))
    untested = sorted(asserts - tested)
    unknown = sorted(tested - asserts)
    if untested:
        print("FEL asserts utan testfall:", ", ".join(untested))
    if unknown:
        print("FEL testfall med okända assert-id:", ", ".join(unknown))
    fails += bool(untested) + bool(unknown)
    print(f"{len(CASES) + 1} fall, {len(asserts)} asserts: {'alla stämmer' if not fails else f'{fails} fel'}\n")
    return fails, asserts


def main() -> int:
    paths = [schemas.REPO / f for f in SCH_FILES if (schemas.REPO / f).exists()]
    if not paths:
        print("ERMS-SVK-ARENDE.sch finns inte (v1). Inget att testa.")
        return 0
    fails = 0
    assert_sets = []
    for p in paths:
        f, asserts = run_cases(p)
        fails += f
        assert_sets.append(asserts)
    if len(paths) == 2 and assert_sets[0] != assert_sets[1]:
        print("FEL filerna har olika assert-id:",
              ", ".join(sorted(assert_sets[0] ^ assert_sets[1])))
        fails += 1
    print(f"Totalt: {'alla stämmer' if not fails else f'{fails} fel'}")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
