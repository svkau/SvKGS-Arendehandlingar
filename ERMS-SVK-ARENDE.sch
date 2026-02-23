<?xml version="1.0" encoding="UTF-8"?>
<!--
Namn:		ERMS-SVK-ARENDE.sch
Version:	1.0
Ändrad:		2026-02-23
Ändrad av:	Henrik Vitalis
-->

<!-- XSLT 1.0-kompatibel version för lxml -->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- queryBinding borttaget för XSLT 1.0-kompatibilitet -->
    
    <ns uri="http://www.loc.gov/mads/rdf/v1#" prefix="madsrdf"/>
	<ns uri="https://DILCIS.eu/XML/ERMS" prefix="erms"/>
    <ns uri="https://xml.svenskakyrkan.se/ERMS-SVK-ARENDE" prefix="svk"/>

    <!-- CO-OCCURRENCE CONSTRAINTS -->
    <pattern id="co-occurrence-constraints">
        <rule context="*[@aggregationType = 'own_aggregation_definition']">
            <assert test="normalize-space(@otherAggregationType)"> If the value of a <emph>aggregationType</emph> attribute is 'own_aggregation_definition', then the <emph>otherAggregationType</emph> attribute must be used.</assert>
        </rule>
        <rule context="*[@dateType = 'Other']">
            <assert test="normalize-space(@otherDateType)"> If the value of a <emph>dateType</emph> attribute is 'other', then the <emph>otherDateType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@directionDefinition = 'other']">
            <assert test="normalize-space(@otherDirectionDefinition)"> If the value of a <emph>directionDefinition</emph> attribute is 'other', then the <emph>otherDirectionDefinition</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@addressLineType = 'other']">
            <assert test="normalize-space(@otherAddressLineType)"> If the value of a <emph>addressLineType</emph> attribute is 'other', then the <emph>otherAddressLineType</emph> attribute must be used.</assert>
        </rule>
        <rule context="*[@contactLineType = 'other']">
            <assert test="normalize-space(@otherContactLineType)"> If the value of a <emph>contactLineType</emph> attribute is 'other', then the <emph>otherContactLineType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@agentType = 'other']">
            <assert test="normalize-space(@otherAgentType)"> If the value of an <emph>agentType</emph> attribute is 'other', then the <emph>otherAgentType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@disposalDateType = 'other_date']">
            <assert test="normalize-space(@otherDisposalDateType)"> If the value of attribute <emph>disposalDateType</emph> is 'other_date', then the <emph>otherDisposalDateType</emph> attribute should be used </assert>
        </rule>
        <rule context="*[@restrictionType = 'other_type']">
            <assert test="normalize-space(@otherRestrictionType)"> If the value of attribute <emph>restrictionType</emph> is 'other_type', then the <emph>otherRestrictionType</emph> attribute should be used </assert>
        </rule>
        <rule context="*[@relationType = 'own_relation_definition']">
            <assert test="normalize-space(@otherRelationType)"> If the value of attribute <emph>relationType</emph> is 'own_relation_definition', then the <emph>otherRelationType</emph> attribute should be used </assert>
        </rule>
    </pattern>

	<!-- Regler för Svenska kyrkans anpassning av ERMS - XSLT 1.0 kompatibel -->
	<pattern id="svk_rules">
		<rule context="//erms:control">
		    <!-- ERMS-SVK:1-2 -->
		    <assert test="count(erms:identification[@identificationType='arkivbildare'])=1">Det måste finnas en Identifikator av typen "arkivbildare" (ERMS-SVK:1-2).</assert>
		    <assert test="count(erms:identification[@identificationType='ärendenummer'])=1">Det måste finnas en Identifikator av typen "ärendenummer" (ERMS-SVK:1-2).</assert>
			<assert test="count(erms:identification[@identificationType='organisationsnummer'])=1 or count(erms:identification[@identificationType='aid'])=1">
				Det måste finnas en Identifikator av typen "organisationsnummer" eller "aid" (ERMS-SVK:1-2).</assert>
			
			<!-- XSLT 1.0: Använd string-length istället för matches() för organisationsnummer -->
			<assert test="string-length(erms:identification[@identificationType='organisationsnummer']) = 10 and 
			             translate(erms:identification[@identificationType='organisationsnummer'], '0123456789', '') = ''">
			    Organisationsnummer måste skrivas med 10 siffror utan bindestreck.
			</assert>
		</rule>

		<rule context="erms:control/erms:classificationSchema/erms:textualDescriptionOfClassificationSchema/erms:p">
		    <!-- ERMS-SVK:4 -->
		    <assert test=".='KlaSL2016_1.0' or .='KlaSN2018_1.0' or .='KlaSS2016_1.0'">Klassificeringsstruktur måste väljas från SVK-VÄRDELISTA 2 (ERMS-SVK:4).</assert>
		</rule>

		<rule context="erms:control/erms:maintenanceInformation/erms:maintenanceAgency/erms:agencyCode">
			<!-- ERMS-SVK:10 -->
			<assert test="@type='aid' or @type='organisationsnummer'">Typ av ID måste väljas från SVK-VÄRDELISTA 4 (ERMS-SVK:10).</assert>
		</rule>

		<rule context="erms:control/erms:maintenanceInformation/erms:maintenanceAgency/erms:agencyCode[@type='organisationsnummer']">
			<!-- ERMS-SVK:10 - XSLT 1.0 kompatibel -->
			<assert test="string-length(.) = 10 and translate(., '0123456789', '') = ''">
			    Organisationsnummer måste skrivas med 10 siffror utan bindestreck.
			</assert>
		</rule>

		<rule context="//erms:aggregations">
		    <!-- ERMS-SVK:22 -->
		    <assert test="count(*)=1">XML-filen får inte innehålla mer än en ärendeakt (ERMS-SVK:22).</assert>
		</rule>

		<rule context="//erms:aggregation">
		    <!-- ERMS-SVK:24 -->
		    <assert test="@aggregationType='caseFile'">Typen av aggregation ska alltid vara "caseFile" (ERMS-SVK:24).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:objectId">
		    <!-- ERMS-SVK:25 - XSLT 1.0: Dela upp vid mellanslag och bindestreck -->
		    <assert test="contains(., ' ') and 
		                 contains(., '-') and
		                 string-length(substring-before(., ' ')) > 0 and
		                 string-length(substring-before(substring-after(., ' '), '-')) = 4 and
		                 translate(substring-before(substring-after(., ' '), '-'), '0123456789', '') = '' and
		                 string-length(substring-after(., '-')) = 4 and
		                 translate(substring-after(., '-'), '0123456789', '') = ''">
		        Ärendenumret ska ha formatet [diariekod] [årtal]-[löpnummer]. Löpnumret ska bestå av fyra siffror och fylls vid behov ut med nollor (ERMS-SVK:25).
		    </assert>
		</rule>

		<rule context="//erms:aggregation">
			<!-- ERMS-SVK:26 -->
			<assert test="count(erms:extraId[@extraIdType='organisationsnummer'])=1 or count(erms:extraId[@extraIdType='aid'])=1">
				Arkivansvarigs ID är obligatoriskt. Värdet för extraIdType måste väljas från SVK-VÄRDELISTA 4 (ERMS-SVK:26).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:extraId[@extraIdType='organisationsnummer']">
			<!-- KORRIGERAD: XSLT 1.0 kompatibel organisationsnummer-test -->
			<assert test="string-length(.) = 10 and translate(., '0123456789', '') = ''">
			    Organisationsnummer måste skrivas med 10 siffror utan bindestreck.
			</assert>
		</rule>

		<!-- Om Intern identifikator används måste attributet extraIdType finnas med och ha värdet deliveringSystemId -->
		<rule context="//erms:aggregation/erms:extraId">
		    <!-- ERMS-SVK:27 -->
			<assert test="@extraIdType = 'deliveringSystemId' or @extraIdType = 'organisationsnummer'">Om elementet Intern identifikator används, måste attributet extraIdType ha värdet 'deliveringSystemId' eller 'organisationsnummer' (ERMS-SVK:27).</assert>
		</rule>

		<rule context= "//erms:aggregation/erms:otherTitle">
		    <!-- ERMS-SVK:35 -->
			<assert test="@titleType = 'publicTitle'">Om elementet otherTitle används, måste attributet titleType ha värdet 'publicTitle' (ERMS-SVK:35).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:status">
		    <!-- ERMS-SVK:36 -->
			<assert test="@value = 'closed' or @value = 'obliterated'">Ärendestatus får enbart ha något av värdena 'closed' eller 'obliterated' (ERMS-SVK:36).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:relation">
		    <!-- ERMS-SVK:37 -->
		    <assert test="@relationType = 'reference'">Om elementet Ärendereferens används, måste attributet relationType ha värdet 'reference' (ERMS-SVK:37).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction">
		    <!-- ERMS-SVK:38 -->
			<assert test="@restrictionType = 'confidential'">Om elementet Sekretess används, måste attributet restrictionType ha värdet 'confidential' (ERMS-SVK:38).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction/erms:dates">
		    <!-- ERMS-SVK:39 -->
			<assert test="count(erms:date) = 1">Endast ett datum, Sekretessdatum, är tillåtet (ERMS-SVK:39).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction/erms:dates/erms:date">
		    <!-- ERMS-SVK:40 -->
			<assert test="@dateType = 'created'">Om elementet Sekretessdatum används, måste attributet dateType ha värdet 'created' (ERMS-SVK:40).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:agents">
		    <!-- ERMS SVK41-46 -->
		    <assert test="count(erms:agent[@agentType='creator'])&lt;2">Aktör av typen "creator" får bara förekomma en gång.</assert>
		    <assert test="count(erms:agent[@agentType='responsible_person'])&lt;2">Aktör av typen "responsible_person" får bara förekomma en gång.</assert>
		    <assert test="count(erms:agent[@otherAgentType='closer'])&lt;2">Aktör av typen "closer" får bara finnas en gång.</assert>
		</rule>

		<rule context="//erms:aggregation/erms:agents/erms:agent[@agentType = 'other']">
		    <!-- ERMS SVK46 -->
		    <assert test="@otherAgentType='closer'">Om attributet agentType har värdet "other", måste attributet otherAgentType här ha värdet "closer".</assert>
		</rule>

		<rule context="//erms:aggregation/erms:dates">
		    <!-- ERMS SVK49-51 -->
		    <assert test="count(erms:date[@dateType='created'])&lt;2">Datum av typen "created" får bara finnas en gång.</assert>
		    <assert test="count(erms:date[@dateType='opened'])=1">Datum av typen "opened" är obligatoriskt och får bara finnas en gång.</assert>
		    <assert test="count(erms:date[@dateType='closed'])=1">Datum av typen "closed" är obligatoriskt och får bara finnas en gång.</assert>
		</rule>

		<rule context="//erms:aggregation/erms:action">
		    <!-- ERMS-SVK53-56 -->
		    <assert test="erms:actionType='beslut'">Elementet actionType måste ha värdet "beslut"</assert>
		    <assert test="count(erms:dates/erms:actionDate)&lt;2">Elementet actionDate får bara förekomma en gång.</assert>
		    <assert test="erms:dates/erms:actionDate/@dateType='decision_date'">Attributet dateType måste ha värdet "decision_date"</assert>
		    <assert test="count(erms:agents/erms:agent)&lt;2">Elementet agent får bara förekomma en gång.</assert>
		    <assert test="erms:agents/erms:agent/@agentType='other'">Attributet agentType måste ha värdet "other"</assert>
		    <assert test="erms:agents/erms:agent/@otherAgentType='decisionMaker'">Attributet otherAgentType måste ha värdet "decisionMaker"</assert>
		</rule>

        <rule context="//erms:aggregation/erms:notes">
            <!-- ERMS-SVK57-58 -->
            <assert test="count(erms:note)&lt;2">Elementet note får bara förekomma en gång.</assert>
            <assert test="erms:note/@noteType='comment'">Attributet noteType måste ha värdet "comment".</assert>
        </rule>

        <rule context="//erms:record">
            <!-- ERMS-SVK84 -->
            <assert test="@recordType='ärendedokument' or @recordType='avtalsdokument'">Attributet recordType måste vara "ärendedokument" eller "avtalsdokument"</assert>
        </rule>

        <rule context="//erms:record/erms:objectId">
		    <!-- ERMS-SVK86 - XSLT 1.0: Dela upp vid mellanslag, bindestreck och kolon -->
		    <assert test="contains(., ' ') and 
		                 contains(., '-') and
		                 contains(., ':') and
		                 string-length(substring-before(., ' ')) > 0 and
		                 string-length(substring-before(substring-after(., ' '), '-')) = 4 and
		                 translate(substring-before(substring-after(., ' '), '-'), '0123456789', '') = '' and
		                 string-length(substring-before(substring-after(., '-'), ':')) = 4 and
		                 translate(substring-before(substring-after(., '-'), ':'), '0123456789', '') = '' and
		                 string-length(substring-after(., ':')) > 0 and
		                 translate(substring-after(., ':'), '0123456789', '') = '' and
		                 substring(substring-after(., ':'), 1, 1) != '0'">
		        Dokumentnumret ska ha formatet [diariekod] [årtal]-[löpnummer]:[löpnummer]. (ERMS-SVK86).
		    </assert>
		</rule>

		<!-- Om Intern identifikator används måste attributet extraIdType finnas med och ha värdet deliveringSystemId -->
		<rule context="//erms:record/erms:extraId">
		    <!-- ERMS-SVK87 -->
			<assert test="@extraIdType = 'deliveringSystemId'">Om elementet Intern identifikator används, måste attributet extraIdType ha värdet 'deliveringSystemId' (ERMS-SVK87).</assert>
		</rule>

		<rule context= "//erms:record/erms:otherTitle">
		    <!-- ERMS-SVK94 -->
			<assert test="@titleType = 'publicTitle'">Om elementet Annan titel används, måste attributet titleType ha värdet 'publicTitle' (ERMS-SVK94).</assert>
		</rule>

		<rule context="//erms:record/erms:status">
		    <!-- ERMS-SVK95 -->
			<assert test="@value = 'closed' or @value = 'obliterated'">Handlingens status får enbart ha något av värdena 'closed' eller 'obliterated' (ERMS-SVK95).</assert>
		</rule>

		<rule context="//erms:record/erms:relation">
		    <!-- ERMS-SVK97 -->
		    <assert test="@relationType = 'reference'">Om elementet Dokumentreferens används, måste attributet relationType ha värdet 'reference' (ERMS-SVK97).</assert>
		</rule>

		<rule context="//erms:record/erms:restriction">
		    <!-- ERMS-SVK98 -->
		    <assert test="@restrictionType = 'confidential'">Om elementet Sekretess används, måste attributet restrictionType ha värdet 'confidential' (ERMS-SVK98).</assert>
		</rule>

		<rule context="//erms:record/erms:restriction/erms:dates/erms:date">
			<!-- ERMS-SVK101 -->
			<assert test="@dateType = 'created'">Om elementet Sekretessdatum används måste attributet dateType ha värdet 'created' (ERMS-SVK101).</assert>
		</rule>

		<rule context="//erms:record/erms:direction">
			<!-- ERMS-SVK102 -->
			<assert test="@directionDefinition = 'incoming' or @directionDefinition = 'outgoing' or @directionDefinition = 'other'">Attributet directionDefinition måste ha värdet 'incoming', 'outgoing' eller 'other' (ERMS-SVK102).</assert>
		</rule>

		<rule context="//erms:record/erms:direction[@directionDefinition = 'other']">
			<!-- ERMS-SVK102 fortsättning -->
			<assert test="@otherDirectionDefinition = 'internal'">Om attributet directionDefinition har värdet 'other', måste attributet otherDirectionDefinition ha värdet 'internal' (ERMS-SVK102).</assert>
		</rule>

		<rule context="//erms:record/erms:agents">
		    <!-- ERMS SVK103-108 -->
		    <assert test="count(erms:agent[@agentType='creator'])&lt;2">Aktör av typen Skapare får bara förekomma en gång (ERMS_SVK104).</assert>
		    <assert test="count(erms:agent[@agentType='responsible_person'])&lt;2">Aktör av typen Ansvarig får bara förekomma en gång.</assert>
		</rule>

		<rule context="//erms:record/erms:agents/erms:agent/erms:idNumber[@idNumberType = 'personnummer']">
			<!-- XSLT 1.0: Använd string-length och translate för personnummer -->
			<assert test="string-length(.) = 12 and translate(., '0123456789', '') = ''">
			    Personnummer måste skrivas med 12 siffror utan bindestreck.
			</assert>
		</rule>

		<rule context="//erms:record/erms:agents/erms:agent/erms:idNumber[@idNumberType = 'organisationsnummer']">
			<!-- XSLT 1.0: Använd string-length och translate för organisationsnummer -->
			<assert test="string-length(.) = 10 and translate(., '0123456789', '') = ''">
			    Organisationsnummer måste skrivas med 10 siffror utan bindestreck.
			</assert>
		</rule>

		<rule context="//erms:record/erms:agents/erms:agent/erms:idNumber">
		    <!-- ERMS SVK103-108 -->
			<assert test="@idNumberType = 'användarnamn' or @idNumberType = 'personnummer' or @idNumberType = 'organisationsnummer'">Om idNumber används måste attributet idNumberType ha något av värdena 'användarnamn', 'personnummer' eller 'organisationsnummer'.</assert>
		</rule>

		<rule context="//erms:record/erms:dates">
		    <!-- ERMS SVK110-114 -->
		    <assert test="count(erms:date[@dateType='created'])=1">Datum för skapande är obligatoriskt och får bara finnas en gång (ERMS-SVK:111).</assert>
		    <assert test="count(erms:date[@dateType='originated'])=1">Datum för registrering är obligatoriskt och får bara finnas en gång (ERMS-SVK:112).</assert>
		    <assert test="count(erms:date[@dateType='received'])&lt;2">Ankomstdatum får bara finnas en gång (ERMS-SVK:113).</assert>
			<assert test="count(erms:date[@dateType='expedited'])&lt;2">Expedieringsdatum får bara finnas en gång (ERMS-SVK:114).</assert>
		</rule>

		<rule context="//erms:record/erms:notes">
            <!-- ERMS-SVK:115-116 -->
            <assert test="count(erms:note)&lt;2">Elementet note får bara förekomma en gång.</assert>
            <assert test="erms:note/@noteType='comment'">Attributet noteType måste ha värdet "comment".</assert>
        </rule>

		<rule context="//erms:record/erms:additionalInformation">
			<!-- ERMS-SVK:143 -->
			<assert test="count(erms:appendix)=0">erms:appendix får inte användas (ERMS-SVK:143).</assert>
		</rule>

	</pattern>

</schema>
