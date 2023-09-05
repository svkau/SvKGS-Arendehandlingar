<?xml version="1.0" encoding="UTF-8"?>
<!--
Namn:		ERMS-SVK-ARENDE.sch
Version:	0.1
Ändrad:		2023-09-05
Ändrad av:	Henrik Vitalis

<!-- Inklusive Svenska kyrkans anpassningar -->
<!-- E-ARK ERMS Schematron rules version 2.1 -->
<!-- E-ARK ERMS Schematron rules version 1.0 -->
<!-- <ns uri="https://DILCIS.eu/XML/ERMS" prefix="erms"/> -->

<schema xmlns="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2">
    <ns uri="http://www.loc.gov/mads/rdf/v1#" prefix="madsrdf"/>
    <ns uri="https://xml.svenskakyrkan.se/ERMS-SVK-ARENDE" prefix="erms"/>
    <ns uri="https://xml.svenskakyrkan.se/ERMS-SVK-ARENDE-element" prefix="svk"/>


    <!-- CO-OCCURRENCE CONSTRAINTS -->

    <pattern id="co-occurrence-constraints">
        <rule context="*[@aggregationType = 'own_aggregation_definition']">
            <assert test="normalize-space(@otherAggregationType)"> If the value of a <emph>aggregationType</emph> attribute is "own_aggregation_definition', then the <emph>otherAggregationType</emph> attribute must be used.</assert>
        </rule>
        <rule context="*[@dateType = 'Other']">
            <assert test="normalize-space(@otherDateType)"> If the value of a <emph>dateType</emph> attribute is "other', then the <emph>otherDateType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@directionDefinition = 'other']">
            <assert test="normalize-space(@otherDirectionDefinition)"> If the value of a <emph>directionDefinition</emph> attribute is "other', then the <emph>otherDirectionDefinition</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@addressLineType = 'other']">
            <assert test="normalize-space(@otherAddressLineType)"> If the value of a <emph>addressLineType</emph> attribute is "other', then the <emph>otherAddressLineType</emph> attribute must be used.</assert>
        </rule>
        <rule context="*[@contactLineType = 'other']">
            <assert test="normalize-space(@otherContactLineType)"> If the value of a <emph>contactLineType</emph> attribute is "other', then the <emph>otherContactLineType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@agentType = 'other']">
            <assert test="normalize-space(@otherAgentType)"> If the value of an <emph>agentType</emph> attribute is "other', then the <emph>otherAgentType</emph> attribute must be used. </assert>
        </rule>
        <rule context="*[@disposalDateType = 'other_date']">
            <assert test="normalize-space(@otherDisposalDateType)"> If the value of attribute <emph>disposalDateType</emph> is 'other_date', then the <emph>otherDisposalDateType</emph> attribute should be used </assert>
        </rule>
        <rule context="*[@restrictionType = 'other_type']">
            <assert test="normalize-space(@otherRestrictionType)"> If the value of attribute <emph>restrictionType</emph> is 'other_type', then the <emph>otherRestrictionType</emph> attribute should be used </assert>
        </rule>
        <rule context="*[@relationType = 'own_relation_definition']">
            <assert test="normalize-space(@oherRelationType)"> If the value of attribute <emph>relationType</emph> is 'own_relation_definition', then the <emph>otherRelationType</emph> attribute should be used </assert>
        </rule>
    </pattern>

<!-- Regler för Svenska kyrkans anpassning av ERMS -->

		<pattern id="svk_rules">
		<rule context="//erms:control">
		    <!-- ERMS-SVK2-3 -->
		    <assert test="count(erms:identification[@identificationType='arkivbildare'])=1">Det måste finnas en Identifikator av typen "arkivbildare" (ERMS-SVK2-3).</assert>
		    <assert test="count(erms:identification[@identificationType='ärendenummer'])=1">Det måste finnas en Identifikator av typen "ärendenummer" (ERMS-SVK2-3).</assert>
		</rule>

		<rule context="erms:control/erms:classificationSchema/erms:textualDescriptionOfClassificationSchema/erms:p">
		    <!-- ERMS-SVK5 -->
		    <assert test=".='KlaSL2016_1.0' or .='KlaSN2018_1.0' or .='KlaSS2016_1.0'">Klassificeringsstruktur måste väljas från SVK-VÄRDELISTA 2 (ERMS-SVK5).</assert>
		</rule>

		<rule context="//erms:aggregations">
		    <!-- ERMS-SVK20 -->
		    <assert test="count(*)=1">XML-filen får inte innehålla mer än en ärendeakt (ERMS-SVK20).</assert>
		</rule>

		<rule context="//erms:aggregation">
		    <!-- ERMS-SVK22 -->
		    <assert test="@aggregationType='caseFile'">Typen av aggregation ska alltid vara "caseFile" (ERMS-SVK22).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:objectId">
		    <!-- ERMS-SVK23 -->
			<assert test="matches(., '[A-Ö]+ \d{4}-\d{4}')">Ärendenumret ska ha formatet [diariekod] [årtal]-[löpnummer]. Löpnumret ska bestå av fyra siffror och fylls vid behov ut med nollor (ERMS-SVK23).</assert>
		</rule>

		<!-- Om Intern identifikator används måste attributet extraIdType finnas med och ha värdet deliveringSystemId -->
		<rule context="//erms:aggregation/erms:extraId">
		    <!-- ERMS-SVK24 -->
			<assert test="@extraIdType = 'deliveringSystemId'">Om elementet Intern identifikator används, måste attributet extraIdType ha värdet 'deliveringSystemId' (ERMS-SVK24).</assert>
		</rule>

		<rule context= "//erms:aggregation/erms:otherTitle">
		    <!-- ERMS-SVK32 -->
			<assert test="@titleType = 'publicTitle'">Om elementet Annan titel används, måste attributet titleType ha värdet 'publicTitle' (ERMS-SVK32).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:status">
		    <!-- ERMS-SVK33 -->
			<assert test="@value = 'closed' or @value = 'obliterated'">Ärendestatus får enbart ha något av värdena 'closed' eller 'obliterated' (ERMS-SVK33).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:relation">
		    <!-- ERMS-SVK34 -->
		    <assert test="@relationType = 'reference'">Om elementet Ärendereferens används, måste attributet relationTyp ha värdet 'reference' (ERMS-SVK34).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction">
		    <!-- ERMS-SVK36 -->
			<assert test="@restrictionType = 'confidential'">Om elementet Sekretess används, måste attributet restrictionType ha värdet 'confidential' (ERMS-SVK36).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction/erms:dates">
		    <!-- ERMS-SVK38 -->
			<assert test="count(erms:date) = 1">Endast ett datum, Sekretessdatum, är tillåtet (ERMS-SVK38).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:restriction/erms:dates/erms:date">
		    <!-- ERMS-SVK39 -->
			<assert test="@dateType = 'created'">Om elementet Sekretessdatum används, måste attributet dateType ha värdet 'created' (ERMS-SVK38).</assert>
		</rule>

		<rule context="//erms:aggregation/erms:agents">
		    <!-- ERMS SVK41-46 -->
		    <assert test="count(erms:agent[@agentType='creator'])&lt;2">Aktör av typen "creator" får bara förekomma en gång.</assert>
		    <assert test="count(erms:agent[@agentType='responsible_person'])&lt;2">Aktör av typen "responsible_person" får bara förekomma en gång.</assert>
		    <assert test="count(erms:agent[@otherAgentType='closer'])&lt;2">Aktör av typen "closer" får bara finnas en gång.</assert>
		</rule>

		<!--
		<rule context="//erms:aggregation/erms:agents/erms:agent">
		    <assert test="@agentType='creator' or @agentType='responsible_person' or @agentType='editor' or @agentType='counterpart' or @agentType='other'">Aktörer måste välja från värdelista</assert>
		</rule>
		-->

		<rule context="//erms:aggregation/erms:agents/erms:agent[@agentType = 'other']">
		    <!-- ERMS SVK46 -->
		    <assert test="@otherAgentType='closer'">Om attributet agentType har värdet "other", måste attributet otherAgentType här ha värded "closer".</assert>
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
		    <!-- ERMS-SVK86 -->
			<assert test="matches(., '[A-Ö]+ \d{4}-\d{4}:[1-9][0-9]*')">Dokumentnumret ska ha formatet [diariekod] [årtal]-[löpnummer]:[löpnummer]. (ERMS-SVK86).</assert>
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
			<assert test="@directionDefinition = 'incoming' or @directionDefinition = 'outgoing' or @directionDefinition = 'other'">Attributert directionDefinition måste ha värdet 'incoming, 'outgoing' eller 'other' (ERMS-SVK102).</assert>
			<assert test="@otherDirectionDefinition = 'internal'">Om attributet directionDefinition har värdet 'other', måste attributet otherDirectionDefinition har värder 'internal' (ERMS-SVK102).</assert>
		</rule>

		<rule context="//erms:record/erms:agents">
		    <!-- ERMS SVK103-108 -->
		    <assert test="count(erms:agent[@agentType='creator'])&lt;2">Aktör av typen Skapare får bara förekomma en gång (ERMS_SVK104).</assert>
		    <assert test="count(erms:agent[@agentType='responsible_person'])&lt;2">Aktör av typen Ansvarig får bara förekomma en gång.</assert>
		</rule>

		<rule context="//erms:record/erms:agents/erms:agent/erms:idNumber[@idNumberType = 'personnummer']">
			<assert test="matches(., '[0-9]{12}')">Personnummer måste skrivas med 12 siffror utan bindestreck.</assert>
		</rule>

		<rule context="//erms:record/erms:agents/erms:agent/erms:idNumber[@idNumberType = 'organisationsnummer']">
			<assert test="matches(., '[0-9]{10}')">Organisationsnummer måste skrivas med 10 siffror utan bindestreck.</assert>
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
			<assert test="count(erms:date[@dateType='expedited'])&lt;2">Expedieringsdatum får bara finnas en gång (ERMS-SVK:113).</assert>
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
