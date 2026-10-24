<?xml version="1.0" encoding="UTF-8"?>
<!--
Namn:		ERMS-SVK-ARENDE.sch
Version:	2.0
Ändrad:		2026-10-24
Ändrad av:	Henrik Vitalis

Svenska kyrkans regler för SvKGS Ärendehandlingar 2.0, utöver det som kontrolleras av
ERMS_v3.xsd och ERMS-SVK-ARENDE.xsd.

- Varje regel ligger i ett eget pattern, så att flera regler kan gälla samma element.
  (Inom ett pattern används bara den första regel vars context matchar.)
- Varje assert har id="ERMS-SVK-n-…" och meddelandet slutar med "(ERMS-SVK:n)",
  där n är dataelementets id i ERMS-SVK-ARENDE.md.
- Värdelistorna (VL n) motsvarar ERMS-SVK-ARENDE-vardelistor.md.
- Kontrollerna av "other…"-attribut i ERMS finns i DILCIS erms_v3.sch och upprepas inte här.

Kräver en XSLT 2.0-processor, t.ex. Saxon.
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

	<title>SvKGS Ärendehandlingar 2.0</title>

	<ns uri="https://DILCIS.eu/XML/ERMS" prefix="erms"/>
	<ns uri="https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK-ARENDE/v2" prefix="svk"/>
	<ns uri="https://earkiv.svenskakyrkan.se/schemas/ERMS-SVK/v1" prefix="elm"/>

	<!-- Värdelistor som inte kontrolleras av XML-schemana, eller där SvKGS begränsar ERMS-värden -->
	<let name="VL1" value="('aid', 'arkivbildare', 'organisationsnummer', 'ärendenummer')"/>
	<let name="VL2" value="('KlaSL2016_1.0', 'KlaSN2018_1.0', 'KlaSS2016_1.0')"/>
	<let name="VL4" value="('aid', 'organisationsnummer')"/>
	<let name="VL6" value="('agent', 'authorising_person', 'counterpart', 'creator', 'deliverer', 'editor',
		'main_signatory', 'other', 'receiver', 'recipient', 'responsible_person', 'sender')"/>
	<let name="VL6-svk" value="('closing_person', 'delegator')"/>
	<let name="VL7" value="('closed', 'obliterated')"/>
	<let name="VL8" value="('username', 'organisationsnummer', 'personnummer')"/>
	<let name="VL13" value="('ärendedokument', 'avtalsdokument', 'personalaktsdokument', 'projektdokument',
		'bild', 'video', 'fil')"/>
	<let name="VL21" value="('high', 'low', 'standard')"/>
	<let name="VL22" value="('closed', 'created', 'decision_date', 'end', 'expedited', 'finished',
		'main_signature', 'modified', 'opened', 'originated', 'received', 'sent', 'start')"/>

	<let name="uuid" value="'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'"/>
	<let name="arendenummer" value="'^[A-ZÅÄÖ]+ [0-9]{4}-[0-9]{4}$'"/>

	<!-- ============================================================ 3.1 Kontroll -->

	<pattern id="ERMS-SVK-1">
		<rule context="erms:control">
			<assert id="ERMS-SVK-1-arkivbildare" test="count(erms:identification[@identificationType = 'arkivbildare']) = 1">
				Det ska finnas exakt en Identifikator av typen "arkivbildare" (ERMS-SVK:1).</assert>
			<assert id="ERMS-SVK-1-arendenummer" test="count(erms:identification[@identificationType = 'ärendenummer']) = 1">
				Det ska finnas exakt en Identifikator av typen "ärendenummer" (ERMS-SVK:1).</assert>
			<assert id="ERMS-SVK-1-orgnr-aid" test="erms:identification[@identificationType = ('organisationsnummer', 'aid')]">
				Det ska finnas en Identifikator av typen "organisationsnummer" eller "aid" (ERMS-SVK:1).</assert>
			<assert id="ERMS-SVK-1-unik" test="every $t in $VL1 satisfies count(erms:identification[@identificationType = $t]) le 1">
				Varje typ av Identifikator får bara förekomma en gång (ERMS-SVK:1).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-2">
		<rule context="erms:control/erms:identification">
			<assert id="ERMS-SVK-2-vl1" test="@identificationType = $VL1">
				Typ av identifikator "<value-of select="@identificationType"/>" finns inte i Värdelista 1 (ERMS-SVK:2).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-2-orgnr">
		<rule context="erms:identification[@identificationType = 'organisationsnummer']">
			<assert id="ERMS-SVK-2-orgnr-format" test="matches(., '^[0-9]{10}$')">
				Organisationsnummer ska bestå av tio siffror utan bindestreck (ERMS-SVK:2).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-4">
		<rule context="erms:control">
			<assert id="ERMS-SVK-4-finns" test="erms:classificationSchema/erms:textualDescriptionOfClassificationSchema/erms:p">
				Klassificeringsstruktur är obligatorisk (ERMS-SVK:4).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-4-vl2">
		<rule context="erms:control/erms:classificationSchema/erms:textualDescriptionOfClassificationSchema/erms:p">
			<assert id="ERMS-SVK-4-vl2" test="normalize-space(.) = $VL2">
				Klassificeringsstrukturen "<value-of select="."/>" finns inte i Värdelista 2 (ERMS-SVK:4).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-9">
		<rule context="erms:control/erms:maintenanceInformation/erms:maintenanceAgency">
			<assert id="ERMS-SVK-9-finns" test="erms:agencyCode">
				Skapare ID (agencyCode) är obligatoriskt (ERMS-SVK:9).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-10">
		<rule context="erms:maintenanceAgency/erms:agencyCode">
			<assert id="ERMS-SVK-10-vl4" test="@type = $VL4">
				Typ av ID ska vara "aid" eller "organisationsnummer" enligt Värdelista 4 (ERMS-SVK:10).</assert>
			<assert id="ERMS-SVK-10-orgnr" test="not(@type = 'organisationsnummer') or matches(., '^[0-9]{10}$')">
				Organisationsnummer ska bestå av tio siffror utan bindestreck (ERMS-SVK:10).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-12">
		<rule context="erms:maintenanceAgency/erms:otherAgencyCode">
			<assert id="ERMS-SVK-12-vl4" test="@type = $VL4">
				Typ av alternativt ID ska anges och vara "aid" eller "organisationsnummer" enligt Värdelista 4 (ERMS-SVK:12).</assert>
			<assert id="ERMS-SVK-12-orgnr" test="not(@type = 'organisationsnummer') or matches(., '^[0-9]{10}$')">
				Organisationsnummer ska bestå av tio siffror utan bindestreck (ERMS-SVK:12).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-15">
		<rule context="erms:control/erms:maintenanceInformation/erms:maintenanceHistory">
			<assert id="ERMS-SVK-15-created" test="erms:maintenanceEvent/erms:eventType/@value = 'created'">
				Det ska finnas en Underhållshändelse av typen "created" (ERMS-SVK:15).</assert>
		</rule>
	</pattern>

	<!-- ============================================================ 3.2 Gemensamma element -->

	<pattern id="ERMS-SVK-19">
		<!-- Gäller alla aktörer i dokumentet, se 3.2.1 och Värdelista 6 -->
		<rule context="erms:agent">
			<assert id="ERMS-SVK-19-vl6" test="@agentType = $VL6">
				Typ av aktör "<value-of select="@agentType"/>" finns inte i Värdelista 6 (ERMS-SVK:19).</assert>
			<assert id="ERMS-SVK-19-other" test="not(@agentType = 'other') or @otherAgentType = $VL6-svk">
				När agentType är "other" ska otherAgentType vara "closing_person" eller "delegator" enligt Värdelista 6 (ERMS-SVK:19).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-66-idnumber">
		<!-- Gäller alla idNumber, se 3.2.1 och Värdelista 8 (ERMS-SVK:66-71) -->
		<rule context="erms:agent/erms:idNumber">
			<assert id="ERMS-SVK-66-vl8" test="@idNumberType = $VL8">
				idNumberType ska anges och väljas från Värdelista 8 (ERMS-SVK:66).</assert>
			<assert id="ERMS-SVK-66-orgnr" test="not(@idNumberType = 'organisationsnummer') or matches(., '^[0-9]{10}$')">
				Organisationsnummer ska bestå av tio siffror utan bindestreck (ERMS-SVK:66).</assert>
			<assert id="ERMS-SVK-66-pnr" test="not(@idNumberType = 'personnummer') or matches(., '^[0-9]{12}$')">
				Personnummer ska bestå av tolv siffror utan bindestreck (ERMS-SVK:66).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-date-vl22">
		<!-- Gäller alla datum, se 3.2.2 och Värdelista 22 -->
		<rule context="erms:date | erms:actionDate">
			<assert id="ERMS-SVK-date-vl22" test="@dateType = $VL22">
				Typ av datum "<value-of select="@dateType"/>" finns inte i Värdelista 22 (avsnitt 3.2.2).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-22">
		<rule context="erms:restriction">
			<assert id="ERMS-SVK-22-confidential" test="@restrictionType = 'confidential'">
				Sekretessmarkering ska ha restrictionType "confidential" (ERMS-SVK:22).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-25">
		<rule context="erms:restriction/erms:dates">
			<assert id="ERMS-SVK-25-ett" test="count(erms:date) = 1 and erms:date/@dateType = 'created'">
				Sekretessmarkering får bara ha ett datum, Sekretessdatum med dateType "created" (ERMS-SVK:25).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-26">
		<rule context="erms:aggregation/erms:notes | erms:record/erms:notes">
			<assert id="ERMS-SVK-26-en" test="count(erms:note) le 1">
				Kommentar får inte upprepas (ERMS-SVK:26).</assert>
			<assert id="ERMS-SVK-26-comment" test="every $n in erms:note satisfies $n/@noteType = 'comment'">
				Kommentar ska ha noteType "comment" (ERMS-SVK:26).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-30">
		<rule context="elm:relatedObject">
			<assert id="ERMS-SVK-30-typ" test="@typeOfObject">
				Typ av objekt (typeOfObject) är obligatoriskt (ERMS-SVK:30).</assert>
			<assert id="ERMS-SVK-32-objectid" test="elm:objectId">
				ObjektID (elm:objectId) är obligatoriskt (ERMS-SVK:32).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-36">
		<rule context="elm:svkNote">
			<assert id="ERMS-SVK-36-typ" test="@typeOfNote">
				Typ av anteckning (typeOfNote) är obligatoriskt (ERMS-SVK:36).</assert>
			<assert id="ERMS-SVK-38-creator" test="count(elm:agents/erms:agent) = 1 and elm:agents/erms:agent/@agentType = 'creator'">
				Anteckning ska ha exakt en Skapare med agentType "creator" (ERMS-SVK:38).</assert>
			<assert id="ERMS-SVK-39-created" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'created'">
				Anteckning ska ha exakt ett datum med dateType "created" (ERMS-SVK:39).</assert>
		</rule>
	</pattern>

	<!-- ============================================================ 3.3 Ärendeakter -->

	<pattern id="ERMS-SVK-48">
		<rule context="/erms:erms">
			<assert id="ERMS-SVK-48-aggregations" test="erms:aggregations">
				XML-dokumentet ska innehålla en ärendeakt (aggregations/aggregation), inte records (ERMS-SVK:48).</assert>
			<assert id="ERMS-SVK-48-en" test="count(//erms:aggregation) = 1">
				XML-dokumentet får bara innehålla en ärendeakt (ERMS-SVK:48).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-49">
		<rule context="erms:aggregation">
			<assert id="ERMS-SVK-49-uuid" test="matches(@systemIdentifier, $uuid)">
				Ärendeaktens identifikator ska vara ett UUID (ERMS-SVK:49).</assert>
			<assert id="ERMS-SVK-50-casefile" test="@aggregationType = 'caseFile'">
				Typ av aggregation ska vara "caseFile" (ERMS-SVK:50).</assert>
			<assert id="ERMS-SVK-51-format" test="matches(erms:objectId, $arendenummer)">
				Ärendenumret "<value-of select="erms:objectId"/>" ska ha formatet [diariekod] [årtal]-[löpnummer], t.ex. "S 2019-0043" (ERMS-SVK:51).</assert>
			<assert id="ERMS-SVK-52-finns" test="erms:extraId[@extraIdType = $VL4]">
				Arkivansvarigs ID (extraId med extraIdType "organisationsnummer" eller "aid") är obligatoriskt (ERMS-SVK:52).</assert>
			<assert id="ERMS-SVK-61-en" test="count(erms:otherTitle) le 1">
				Offentlig titel får bara förekomma en gång (ERMS-SVK:61).</assert>
			<assert id="ERMS-SVK-62-finns" test="erms:status">
				Ärendestatus är obligatoriskt (ERMS-SVK:62).</assert>
			<assert id="ERMS-SVK-64-finns" test="count(erms:additionalInformation/erms:additionalXMLData/svk:ermsSvkArende/svk:ermsSvkAggregation) = 1">
				Ärendeakten ska ha Tilläggsinformation (additionalInformation/additionalXMLData/svk:ermsSvkArende/svk:ermsSvkAggregation) (ERMS-SVK:64, ERMS-SVK:82).</assert>
			<assert id="ERMS-SVK-73-finns" test="erms:dates">
				Datum (dates) är obligatoriskt för ärendeakten (ERMS-SVK:73).</assert>
			<assert id="ERMS-SVK-85-finns" test="erms:record">
				Ärendeakten ska innehålla minst en Handling (record) (ERMS-SVK:85).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-52">
		<rule context="erms:aggregation/erms:extraId">
			<assert id="ERMS-SVK-52-typ" test="@extraIdType = ($VL4, 'deliveringSystemId')">
				extraIdType ska vara "aid", "organisationsnummer" (ERMS-SVK:52) eller "deliveringSystemId" (ERMS-SVK:53).</assert>
			<assert id="ERMS-SVK-52-unik" test="count(../erms:extraId[@extraIdType = current()/@extraIdType]) = 1">
				Varje typ av extraId får bara förekomma en gång (ERMS-SVK:52, ERMS-SVK:53).</assert>
			<assert id="ERMS-SVK-52-orgnr" test="not(@extraIdType = 'organisationsnummer') or matches(., '^[0-9]{10}$')">
				Organisationsnummer ska bestå av tio siffror utan bindestreck (ERMS-SVK:52).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-61">
		<rule context="erms:aggregation/erms:otherTitle | erms:record/erms:otherTitle">
			<assert id="ERMS-SVK-61-public" test="@titleType = 'public'">
				Offentlig titel ska ha titleType "public" (ERMS-SVK:61, ERMS-SVK:98).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-62">
		<rule context="erms:aggregation/erms:status | erms:record/erms:status">
			<assert id="ERMS-SVK-62-vl7" test="@value = $VL7">
				Status ska vara "closed" eller "obliterated" enligt Värdelista 7 (ERMS-SVK:62, ERMS-SVK:99).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-63">
		<rule context="erms:aggregation/erms:relation | erms:record/erms:relation">
			<assert id="ERMS-SVK-63-reference" test="@relationType = 'reference'">
				Ärende- och dokumentreferens ska ha relationType "reference" (ERMS-SVK:63, ERMS-SVK:101).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-65">
		<rule context="erms:aggregation/erms:agents">
			<assert id="ERMS-SVK-65-typer" test="every $a in erms:agent satisfies
				$a/@agentType = ('creator', 'responsible_person', 'editor', 'counterpart', 'agent')
				or ($a/@agentType = 'other' and $a/@otherAgentType = 'closing_person')">
				Ärendets aktörer får bara vara av typerna creator, responsible_person, editor, counterpart, agent eller other/closing_person (ERMS-SVK:65-71).</assert>
			<assert id="ERMS-SVK-66-en" test="count(erms:agent[@agentType = 'creator']) le 1">
				Skapare får bara förekomma en gång (ERMS-SVK:66).</assert>
			<assert id="ERMS-SVK-67-en" test="count(erms:agent[@agentType = 'responsible_person']) le 1">
				Handläggare får bara förekomma en gång (ERMS-SVK:67).</assert>
			<assert id="ERMS-SVK-71-en" test="count(erms:agent[@otherAgentType = 'closing_person']) le 1">
				Avslutare får bara förekomma en gång (ERMS-SVK:71).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-74">
		<rule context="erms:aggregation/erms:dates">
			<assert id="ERMS-SVK-74-created" test="count(erms:date[@dateType = 'created']) = 1">
				Ärendeakten ska ha exakt ett datum Skapat med dateType "created" (ERMS-SVK:74).</assert>
			<assert id="ERMS-SVK-75-opened" test="count(erms:date[@dateType = 'opened']) = 1">
				Ärendeakten ska ha exakt ett datum Öppnat med dateType "opened" (ERMS-SVK:75).</assert>
			<assert id="ERMS-SVK-76-closed" test="count(erms:date[@dateType = 'closed']) = 1">
				Ärendeakten ska ha exakt ett datum Avslutat med dateType "closed" (ERMS-SVK:76).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-77">
		<rule context="erms:aggregation/erms:action">
			<assert id="ERMS-SVK-79-beslut" test="erms:actionType = 'beslut'">
				Beslut i ärendet ska ha actionType "beslut" (ERMS-SVK:79).</assert>
			<assert id="ERMS-SVK-80-decision-date" test="count(erms:dates/erms:actionDate) le 1 and
				(every $d in erms:dates/erms:actionDate satisfies $d/@dateType = 'decision_date')">
				Beslut i ärendet får ha högst ett Beslutsdatum, med dateType "decision_date" (ERMS-SVK:80).</assert>
			<assert id="ERMS-SVK-81-beslutsfattare" test="count(erms:agents/erms:agent) le 1 and
				(every $a in erms:agents/erms:agent satisfies $a/@agentType = 'authorising_person')">
				Beslut i ärendet får ha högst en Beslutsfattare, med agentType "authorising_person" (ERMS-SVK:81).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-83">
		<rule context="svk:ermsSvkArende">
			<assert id="ERMS-SVK-83-version" test="number(@ermsSvkArendeVersion) = 2">
				ermsSvkArendeVersion ska vara "2.0" för SvKGS Ärendehandlingar 2.0 (ERMS-SVK:83).</assert>
		</rule>
	</pattern>

	<!-- ============================================================ 3.4 Ärendehandlingar -->

	<pattern id="ERMS-SVK-86">
		<rule context="erms:record">
			<let name="agg" value="ancestor::erms:aggregation[1]"/>
			<assert id="ERMS-SVK-86-uuid" test="matches(@systemIdentifier, $uuid)">
				Handlingens identifikator ska vara ett UUID (ERMS-SVK:86).</assert>
			<assert id="ERMS-SVK-87-vl13" test="@recordType = $VL13">
				Handlingstyp (recordType) ska anges och väljas från Värdelista 13 (ERMS-SVK:87).</assert>
			<assert id="ERMS-SVK-89-format" test="erms:objectId = concat($agg/erms:objectId, ':', erms:runningNumber)">
				Handlingsnumret "<value-of select="erms:objectId"/>" ska vara ärendenumret och löpnumret med kolon emellan, här "<value-of select="concat($agg/erms:objectId, ':', erms:runningNumber)"/>" (ERMS-SVK:89).</assert>
			<assert id="ERMS-SVK-97-titel" test="erms:title">
				Titel är obligatoriskt (ERMS-SVK:97).</assert>
			<assert id="ERMS-SVK-98-en" test="count(erms:otherTitle) le 1">
				Offentlig titel får bara förekomma en gång (ERMS-SVK:98).</assert>
			<assert id="ERMS-SVK-99-status" test="erms:status">
				Status är obligatoriskt (ERMS-SVK:99).</assert>
			<assert id="ERMS-SVK-100-lopnummer" test="erms:runningNumber">
				Löpnummer är obligatoriskt (ERMS-SVK:100).</assert>
			<assert id="ERMS-SVK-100-unikt" test="not(erms:runningNumber) or
				count($agg/erms:record[erms:runningNumber = current()/erms:runningNumber]) = 1">
				Löpnumret <value-of select="erms:runningNumber"/> förekommer flera gånger i ärendet (ERMS-SVK:100).</assert>
			<assert id="ERMS-SVK-102-riktning" test="erms:direction">
				Riktning är obligatoriskt (ERMS-SVK:102).</assert>
			<assert id="ERMS-SVK-103-aktorer" test="erms:agents">
				Aktörer (agents) är obligatoriskt (ERMS-SVK:103).</assert>
			<assert id="ERMS-SVK-110-datum" test="erms:dates">
				Datum (dates) är obligatoriskt för handlingen (ERMS-SVK:110).</assert>
			<assert id="ERMS-SVK-115-finns" test="count(erms:additionalInformation/erms:additionalXMLData/svk:ermsSvkArende/svk:ermsSvkRecord) = 1">
				Handlingen ska ha Tilläggsinformation (additionalInformation/additionalXMLData/svk:ermsSvkArende/svk:ermsSvkRecord) (ERMS-SVK:115, ERMS-SVK:116).</assert>
			<assert id="ERMS-SVK-157-appendix" test="not(erms:additionalInformation/erms:appendix)">
				ERMS-elementet appendix får inte användas direkt i record/additionalInformation. Använd elm:svkAppendix (avsnitt 2.4, ERMS-SVK:157).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-90">
		<rule context="erms:record/erms:extraId">
			<assert id="ERMS-SVK-90-typ" test="@extraIdType = 'deliveringSystemId'">
				Intern identifikator ska ha extraIdType "deliveringSystemId" (ERMS-SVK:90).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-102">
		<rule context="erms:record/erms:direction">
			<assert id="ERMS-SVK-102-vl15" test="@directionDefinition = ('incoming', 'outgoing')
				or (@directionDefinition = 'other' and @otherDirectionDefinition = 'internal')">
				Riktning ska vara "incoming", "outgoing" eller "other" med otherDirectionDefinition "internal" enligt Värdelista 15 (ERMS-SVK:102).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-103">
		<rule context="erms:record/erms:agents">
			<let name="riktning" value="../erms:direction/@directionDefinition"/>
			<assert id="ERMS-SVK-103-typer" test="every $a in erms:agent satisfies
				$a/@agentType = ('creator', 'responsible_person', 'sender', 'receiver', 'agent')">
				Handlingens aktörer får bara vara av typerna creator, responsible_person, sender, receiver eller agent (ERMS-SVK:103-108).</assert>
			<assert id="ERMS-SVK-104-en" test="count(erms:agent[@agentType = 'creator']) le 1">
				Skapare får bara förekomma en gång (ERMS-SVK:104).</assert>
			<assert id="ERMS-SVK-105-en" test="count(erms:agent[@agentType = 'responsible_person']) le 1">
				Ansvarig får bara förekomma en gång (ERMS-SVK:105).</assert>
			<assert id="ERMS-SVK-106-avsandare" test="not($riktning = 'incoming') or erms:agent[@agentType = 'sender']">
				En inkommen handling ska ha minst en Avsändare med agentType "sender" (ERMS-SVK:106).</assert>
			<assert id="ERMS-SVK-107-mottagare" test="not($riktning = 'outgoing') or erms:agent[@agentType = 'receiver']">
				En utgående handling ska ha minst en Mottagare med agentType "receiver" (ERMS-SVK:107).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-111">
		<rule context="erms:record/erms:dates">
			<assert id="ERMS-SVK-111-created" test="count(erms:date[@dateType = 'created']) = 1">
				Handlingen ska ha exakt ett datum Skapat med dateType "created" (ERMS-SVK:111).</assert>
			<assert id="ERMS-SVK-112-originated" test="count(erms:date[@dateType = 'originated']) = 1">
				Handlingen ska ha exakt ett datum Registrerat med dateType "originated" (ERMS-SVK:112).</assert>
			<assert id="ERMS-SVK-113-received" test="count(erms:date[@dateType = 'received']) le 1">
				Ankomstdatum får bara förekomma en gång (ERMS-SVK:113).</assert>
			<assert id="ERMS-SVK-114-expedited" test="count(erms:date[@dateType = 'expedited']) le 1">
				Expedieringsdatum får bara förekomma en gång (ERMS-SVK:114).</assert>
		</rule>
	</pattern>

	<!-- ============================================================ Elementlista 7: tillägg för handlingar -->

	<pattern id="ERMS-SVK-124">
		<rule context="elm:contractInfo/erms:dates">
			<assert id="ERMS-SVK-124-typer" test="every $d in erms:date satisfies $d/@dateType = ('start', 'end')">
				Avtalets datum ska ha dateType "start" eller "end" (ERMS-SVK:124, ERMS-SVK:125).</assert>
			<assert id="ERMS-SVK-124-en" test="count(erms:date[@dateType = 'start']) le 1 and count(erms:date[@dateType = 'end']) le 1">
				Giltigt från och Giltigt till får bara förekomma en gång var (ERMS-SVK:124, ERMS-SVK:125).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-128">
		<rule context="elm:workflow">
			<assert id="ERMS-SVK-128-typ" test="@typeOfWorkflow">
				Typ av arbetsflöde (typeOfWorkflow) är obligatoriskt (ERMS-SVK:128).</assert>
			<assert id="ERMS-SVK-131-vl21" test="not(elm:workflowPriority) or elm:workflowPriority = $VL21">
				Prioritet ska väljas från Värdelista 21 (ERMS-SVK:131).</assert>
			<assert id="ERMS-SVK-132-creator" test="count(elm:agents/erms:agent) = 1 and elm:agents/erms:agent/@agentType = 'creator'">
				Arbetsflödet ska ha exakt en aktör, Initierat av, med agentType "creator" (ERMS-SVK:132).</assert>
			<assert id="ERMS-SVK-133-created" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'created'">
				Arbetsflödet ska ha exakt ett datum, Initierat datum, med dateType "created" (ERMS-SVK:133).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-136">
		<rule context="elm:workflowNote">
			<assert id="ERMS-SVK-138-created" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'created'">
				Anteckningen ska ha exakt ett datum med dateType "created" (ERMS-SVK:138).</assert>
			<assert id="ERMS-SVK-139-typer" test="every $a in elm:agents/erms:agent satisfies $a/@agentType = ('sender', 'receiver')">
				Anteckningens aktörer ska ha agentType "sender" eller "receiver" (ERMS-SVK:139, ERMS-SVK:140).</assert>
			<assert id="ERMS-SVK-139-en" test="count(elm:agents/erms:agent[@agentType = 'sender']) le 1 and count(elm:agents/erms:agent[@agentType = 'receiver']) le 1">
				Skickad från och Skickad till får bara förekomma en gång var (ERMS-SVK:139, ERMS-SVK:140).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-142">
		<rule context="elm:workflowRecipient">
			<let name="a" value="elm:agents/erms:agent"/>
			<assert id="ERMS-SVK-143-recipient" test="count($a[@agentType = 'recipient']) = 1">
				Mottagaren ska ha exakt en Enskild mottagare med agentType "recipient" (ERMS-SVK:143).</assert>
			<assert id="ERMS-SVK-146-closing" test="count($a[@agentType = 'other' and @otherAgentType = 'closing_person']) = 1">
				Mottagaren ska ha exakt en Slutfört av med agentType "other" och otherAgentType "closing_person" (ERMS-SVK:146).</assert>
			<assert id="ERMS-SVK-147-delegator" test="count($a[@agentType = 'other' and @otherAgentType = 'delegator']) le 1">
				På uppdrag av får bara förekomma en gång (ERMS-SVK:147).</assert>
			<assert id="ERMS-SVK-143-typer" test="every $x in $a satisfies
				$x/@agentType = 'recipient' or ($x/@agentType = 'other' and $x/@otherAgentType = $VL6-svk)">
				Mottagarens aktörer ska vara recipient, other/closing_person eller other/delegator (ERMS-SVK:143, ERMS-SVK:146, ERMS-SVK:147).</assert>
			<assert id="ERMS-SVK-145-finished" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'finished'">
				Mottagaren ska ha exakt ett datum, Slutfört datum, med dateType "finished" (ERMS-SVK:145).</assert>
		</rule>
	</pattern>

	<!-- ============================================================ 3.5 Bifogade filer -->

	<pattern id="ERMS-SVK-162">
		<rule context="elm:svkAppendix/erms:appendix">
			<assert id="ERMS-SVK-162-finns" test="@fileFormat">
				Filformat (fileFormat) är obligatoriskt (ERMS-SVK:162).</assert>
			<assert id="ERMS-SVK-162-format" test="not(@fileFormat) or matches(@fileFormat, '^[a-z0-9]{1,4}$')">
				Filformat ska anges som filnamnsändelse med högst fyra tecken, utan punkt och med små bokstäver (ERMS-SVK:162).</assert>
			<assert id="ERMS-SVK-163-format" test="not(@originalFileFormat) or matches(@originalFileFormat, '^[a-z0-9]{1,4}$')">
				Originalfilformat ska anges som filnamnsändelse med högst fyra tecken, utan punkt och med små bokstäver (ERMS-SVK:163).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-171">
		<rule context="elm:fileInfo/erms:dates">
			<assert id="ERMS-SVK-171-typer" test="every $d in erms:date satisfies $d/@dateType = ('created', 'modified')">
				Filinformationens datum ska ha dateType "created" eller "modified" (ERMS-SVK:171, ERMS-SVK:172).</assert>
			<assert id="ERMS-SVK-171-en" test="count(erms:date[@dateType = 'created']) le 1 and count(erms:date[@dateType = 'modified']) le 1">
				Skapad och Senast ändrad får bara förekomma en gång var (ERMS-SVK:171, ERMS-SVK:172).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-175">
		<rule context="elm:signatureInfo">
			<assert id="ERMS-SVK-176-created" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'created'">
				Information om e-signaturer ska ha exakt ett datum, Initierat datum, med dateType "created" (ERMS-SVK:176).</assert>
			<assert id="ERMS-SVK-177-creator" test="erms:agent/@agentType = 'creator'">
				Initierat av ska ha agentType "creator" (ERMS-SVK:177).</assert>
			<assert id="ERMS-SVK-180-algoritm" test="normalize-space(elm:signatureFileHash/@algorithm)">
				Algoritm (signatureFileHash/@algorithm) är obligatoriskt (ERMS-SVK:180).</assert>
		</rule>
	</pattern>

	<pattern id="ERMS-SVK-181">
		<rule context="elm:signatory">
			<assert id="ERMS-SVK-182-main-signatory" test="erms:agent/@agentType = 'main_signatory'">
				Undertecknat av ska ha agentType "main_signatory" (ERMS-SVK:182).</assert>
			<assert id="ERMS-SVK-183-main-signature" test="count(erms:dates/erms:date) = 1 and erms:dates/erms:date/@dateType = 'main_signature'">
				Undertecknaren ska ha exakt ett datum, Undertecknat datum, med dateType "main_signature" (ERMS-SVK:183).</assert>
		</rule>
	</pattern>

</schema>
