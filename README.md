*README-filen innehåller ett utdrag ur Svenska kyrkans gemensamma specifikationer för elektronisk arkivering - Ärendehandlingar*.
Se hela specifikationen här: SvKGS Ärendehandlingar

# SvKGS-Ärendehandlingar

***Version 1.0***

# 1. Inledning

Svenska kyrkans gemensamma specifikationer för elektronisk arkivering beskriver vilken in¬formation som ska
ingå vid leverans till Svenska kyrkans gemensamma e-arkiv och hur denna information ska struktureras.

Leveranser till e-arkivet delas in i informationstyper. Exempel på sådana kan vara ärendeakter med handlingar,
ekonomisk redovisning, löneredovisning, personalakter, information om gravrätter, projekthandlingar, bilder
och så vidare. Varje informationstyp kan behöva sin egen specifikation.

Beteckningen gemensamma specifikationer anger att specifikationerna gäller alla leveranser till e-arkivet oavsett
vem det är som levererar informationen och oavsett vilket IT-system som leveranser kommer ifrån.
Genom att informationen arkiveras på detta standardiserade sätt underlättas det långsiktiga bevarande
och möjligheten att återsöka den arkiverade informationen. Standardformatet kan utöver e-arkivering
även användas vid migrering av information mellan andra IT-system.

Svenska kyrkans gemensamma specifikationer är i första hand anpassningar av de specifikationer som
förvaltas av *the Digital Information LifeCycle Interoperability Standards Board* (DILCIS Board).
De kan också vara anpassningar av de förvaltningsgemensamma specifikationer (FGS) som har upprättats av Riksarkivet.
Specifikationerna kan också utgå ifrån andra standarder, om det finns några som är särskilt lämpliga
för informationstypen i fråga.

- [Dilcis Board](https://dilcis.eu)
- [Riksarkivet FGS](https://riksarkivet.se/fgs-earkiv)

## 1.1. Arkivpaket

Leverans av information till e-arkivet sker i form av arkivpaket. Ett paket är en mappstruktur med filer.
Paketet innehåller den levererade informationen, arkivobjektet, men också metadata som beskriver
informationen och den levererande arkivbildaren.

Specifikationerna i det här dokumentet beskriver arkivobjektet, det vill säga den information som
ska arkiveras. Det utgör endast en del av hela arkivpaketet.

Arkivpaketet i sin helhet utformas i enlighet med Riksarkivets specifikation
[FGS Paketstruktur 1.2](https://riksarkivet.se/Media/pdf-filer/doi-t/FGS_Paketstruktur_RAFGS1V1_2.pdf).

# Specifikationer för ärendehandlingar

*SvKGS Ärendehandlingar* avser arkivering av ärendeakter med tillhörande handlingar.
Specifikationerna är främst avsedda för arkivering av information från diarieföringssystem som
t.ex. Tietoevrys **Public 360°**, Vitecs **Acta** och **FAS** samt Eniacs **Aveny**.

Registrerad information om ett ärende och dess ingående handlingar bevaras i ett XML-dokument som
regleras av specifikationerna genom användandet av scheman (XSD och Schematron).
Även bifogade filer (i godkänt arkivformat) kan arkiveras.

*SvKGS Ärendehandlingar* följer helt och hållet *Specification for the E-ARK Content Information Type
Specification for Electronic Records Management Systems* (ERMS) version 2.1.0.
Detta innebär att specifikationen också följer [FGS Ärendehantering 2.0](https://www.riksarkivet.se/faststallda-kommande-fgser)
och [Riksarkivets tillämpning av CITS ERMS (för överlämnande till Riksarkivet)](https://www.riksarkivet.se/Media/pdf-filer/doi-t/Riksarkivets_tillampning_CITS_ERMS_overlamnande_V1.0.pdf). 

ERMS tillåter att man gör anpassningar för den egna organisationens behov.
För användning i Svenska kyrkan har ett antal anpassningar gjorts.
Dessa redovisas nedan i detta dokument.

## 2.2. XML-dokumentet

Det XML-dokument som innehåller information om en ärendeakt och de ingående handlingarna definieras i ett XML-schema.
Se avsnittet Scheman nedan. Detta är XML-dokumentets grundläggande uppbyggnad:

![figur_01.png](assets/figur_01.png)

*Figur 1. Grundläggande struktur i ett XML-dokument.*

Elementet `erms` är dokumentets rot-element. Elementet `control` innehåller underelement med information om
själva XML-dokumentet (se Tabell 1).

Elementet `aggregations` rymmer underelement av typen aggregation, vilket i det här fallet betyder ärendeakt
(se Tabell 2 och Tabell 3). Notera att det i *SvKGS Ärendehandlingar* endast får finnas en aggregation i varje XML-dokument.

Elementet `aggregation` kan innehålla flera element av typen record, alltså ärendehandlingar (se Tabell 4 och Tabell 5).
Varje `record` kan innehålla elementet `appendix` som är en bifogad fil till den registrerade handlingen (se Tabell 6).

Observera att det tillagda elementet `svkAppendix` används i *SvKGS Ärendehandlingar* i stället för ERMS-elementet `appendix`.

I tabellerna nedan finns de element som bör eller måste finnas i ett XML-dokument enligt *SvKGS Ärendehandlingar*.
Tabellerna följer strukturen i XML-dokumentet:

![figur_02.png](assets/figur_02.png)

*Figur 2. Översikt av tabeller med dataelement.*

## 2.3. Värdelistor

I många fall är det värde som får anges i ett dataelement begränsat till värden som finns i en specificerad värdelista.
De värdelistor som ingår i *SvKGS Ärendehandlingar* finns nedan i detta dokument.
Värdelistorna kan innehålla värden från ERMS eller vara tillagda värden och är därför också en del av
Svenska kyrkans anpassning av ERMS. Utgångspunkten har varit att så långt som möjligt använda värden från ERMS.

## 2.4. Scheman

XML-scheman och Schematron används i ERMS för att på ett mer tekniskt sätt definiera hur dataelementen
ska utformas. Scheman kan också användas för att validera ett XML-dokument så att man kan avgöra om det
följer specifikationen.

I ERMS ingår schemana [ERMS.xsd](https://citserms.dilcis.eu/schema/ERMS.xsd) och [ERMS.sch](https://citserms.dilcis.eu/schema/erms.sch).

I *SvKGS Ärendehandlingar* används schemana

**ERMS.xsd**<br/>
Schemat används för att validera de delat av XML-dokumentet som följer ERMS-standard.

**ERMS-SVK-element.xsd**<br/>
I detta schema definieras alla element som är Svenska kyrkans tillägg till ERMS. Schemat är alltså inte
specifikt för *SvKGS Ärendehandlingar* utan används i andra anpassningar av ERMS.
Schemat är publikt tillgängligt på [Github](https://github.com/svkau/SvKGS-Arendehandlingar).

**ERMS-SVK-ARENDE.xsd**<br/>
Schemat reglerar själva strukturen på den del av XML-dokumentet som utgörs av Svenska kyrkans tillägg
och vilka tillagda element som får användas i enlighet med SvKGS Ärendehandlingar.
Denna del av XML-dokumentet ingår i ERMS-elementet `additionalXMLData`.

**ERMS-SVK-ARENDEN.sch**<br/>
Schemat innehåller dels de regler som ingår i ERMS-standarden (ERMS.sch), dels Svenska kyrkans regler som
de beskrivs i *SvKGS Ärendehandlingar*. De två sistnämnda schemana är specifika för
*SvKGS Ärendehandlingar* och är publikt tillgängliga på [Github](https://github.com/svkau/SvKGS-Arendehandlingar).

En särskild anmärkning om elementet `appendix` i behöver göras. Eftersom det har funnits behov av att
utöka detta element med flera underelement, och då det inte finns något element `additionalXMLData` här,
används inte `appendix` utan i stället ett eget element `svkAppendix` som definieras i ERMS-SVK-element.xsd.

Användandet av elementet appendix förbjuds genom en regel i ERMS-SVK.sch.

För att validera ett XML-dokument och avgöra om det följer specifikationerna i *SvKGS Ärendehandlingar*, måste man
alltså använda både **ERMS.xsd** och **ERMS-SVK-ARENDE.xsd** (som i sin tur importerar och använder **ERMS-SVK-element.xsd**).
Därtill måste dokumentet valideras mot **ERMS-SVK-ARENDE.sch**.

## 2.5. Datatyper

Värden som anges i dataelementen måste vara av de datatyper som definieras i XML-schemana.
Datatyper som kan förekomma är:

- [string](https://www.w3.org/TR/xmlschema-2/#string)
- [token](https://www.w3.org/TR/xmlschema-2/#token)
- [integer](https://www.w3.org/TR/xmlschema-2/#integer)
- [decimal](https://www.w3.org/TR/xmlschema-2/#decimal)
- [dateTime](https://www.w3.org/TR/xmlschema-2/#dateTime)
- [boolean](https://www.w3.org/TR/xmlschema-2/#boolean)

För att ange datum används alltid datatypen dateTime, vilket betyder att både datum och klocklag ned till
sekundnivå ska anges i [UTC-format](https://sv.wikipedia.org/wiki/Koordinerad_universell_tid)
enligt [ISO 8601](https://sv.wikipedia.org/wiki/ISO_8601) (med bindestreck och kolon). Om klockslag saknas används
noll-tecken. Tidszon anges i regel inte och förutsätts då vara Europe/Stockholm.

Exempel på datum och tid: `2018-03-04T15:15:22`. Enbart datum: `2020-09-17T00:00:00`.

Vid angivande av tal (integer och decimal) används inte tusentalsavgränsare.

Vid angivande av decimal används punkt som decimalavgränsare.

## 2.6. Råd om användandet av *SvKGS Ärendehandlingar*

I tabellerna med dataelement nedan har varje element en identifieringskod (t.ex. ERMS-SVK:1).
Även elementets motsvarande kod i ERMS anges, om det inte är ett tillagt element.

Om ett element är obligatoriskt, anges detta särskilt. I annat fall är det frivilligt att använda elementet.

Element kan få förekomma en enda gång eller upprepade gånger i ett XML-dokument.
Om ett element får upprepas, anges detta särskilt. I annat fall får elementet endast förekomma en gång.

I tabellerna anges också motsvarande XML-elements namn och vilken datatyp som ska användas.

Informationen i det levererande IT-systemet måste mappas mot specifikationens dataelement och sedan transformeras
till ett XML-format som kan valideras av de scheman som ingår i specifikationen.
Alla XML-filer måste ha teckenkodning UTF-8.

En XML-fil får enbart innehålla ett enda ärende, men leveransen kan bestå av flera filer.
Filerna samlas i en mapp, och om leveransen innehåller dokumentfiler samlas dessa i en undermapp.
Varje sådant leveranspaket får bara innehålla ärenden från en och samma arkivbildare och ett och samma diarium.

![figur_03.png](assets/figur_03.png)

*Figur 3. Mappstruktur för ärendeleverans. Namn på mappar och filer är enbart exempel.*

Innan en leverans till e-arkivet görs, måste den levererande parten och e-arkivets förvaltningsorganisation
tillsammans upprätta en leveransöverenskommelse där villkor och förutsättningar för leveransen specificeras.
Se mer om leveransförfarandet i Arkivhandboken, kapitel 8.

# 3. Dataelement med exempel

## 3.1. Övergripande information om XML-dokumentet

Kontroll är ett obligatoriskt element som beskriver själva XML-filen och vad den innehåller.
Den underlättare förståelsen av informationen, om XML-filen skulle separeras från arkivpaketet.

### Tabell 1. Kontroll

---

**ERMS-SVK:1** (ERMS1)

*Identifikator*

> Identifierar ERMS-dokumentet

> Obligatoriskt. Elementet får upprepas.

> Tre identifikatorer måste användas: arkivbildarens namn och id samt ärendets nummer. Se exempel nedan.

> **XML-element:**	`identification`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:2** (ERMS2)

*Typ av identifikator*

> Beskrivning av identifikatorn.

> Obligatoriskt. Värdet väljs från SVK-värdelista 1.

> **XML-element:**	`identification/@identificationType`<br/>
> **Datatyp:**	string

---

**xempel 1 – Identifikator**

```xml
<control>
    <identification identificationType="arkivbildare">Sunne pastorat</identification>
	<identification identificationType="organisationsnummer">1234567890</identification>
	<identification identificationType="aid">5610</identification>
	<identification identificationType="ärendenummer">P 2019-0254</identification>
</control>
```

---

**ERMS-SVK:3** (ERMS3)

*Informationsklassning*

> Informationsklass som baseras på säkerhetsklassificering.

> **XML-element:**	`informationClass`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:4** (ERMS4-6)

*Klassificeringsstruktur*

> Den klassificeringsstruktur som har använts vid klassificering av det aktuella ärendet.

> Obligatoriskt. Värdet välj från SVK-värdelista 2.

> **XML-element:**	`classificationSchema/textualDescriptionOfClassificationSchema/p` <br/>
> **Datatyp:**	string

---

**Exempel 2 – Klassificeringsstruktur**

```xml
<control>
	<classificationSchema>
		<textualDescriptionOfClassificationSchema>
			<p>KlaSL2016_1.0</p>
		</textualDescriptionOfClassificationSchema>
	</classificationSchema>
</control>
```
**ERMS-SVK:5** (ERMS8)

*Säkerhetsklassning*

> Säkerhetsklass.

> **XML-element:**	`securityClass` <br/>
> **Datatyp:**	string

---

**ERMS-SVK:6** (ERMS10)

*Underhåll*

> Samlingselement för underhållsinformation som används för att beskriva XML-dokumentets tillkomst och eventuella ändringar.

> Obligatoriskt.

> **XML-element:**	`maintenanceInformation`

---

**ERMS-SVK:7** (ERMS11)

*Status*

> XML-dokumentets status.

> Obligatoriskt. Värdet välj från SVK-värdelista 3.
>
> För ett nyskapat dokument är värdet alltid `new`.

> **XML-element:**	`maintenanceStatus/@value` <br/>
> **Datatyp:**	string

---

**ERMS-SVK:8** (ERMS12)

*Skapare*

> Samlingselement med beskrivning av den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`maintenanceAgency`

---

**ERMS-SVK:9** (ERMS13)

*Skapare ID*

> Identifierande kod för den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`agencyCode`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:10** (ERMS14)

*Typ av ID*

> Beskriver vilken typ av kod som har använts för att identifiera skaparen av XML-dokumentet.

> Obligatoriskt. Värdet väljs från SVK-värdelista 4.

> **XML-element:**	`agencyCode/@type`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:11** (ERMS15)

*Alternativt ID*

> Ytterligare en identifierande kod som kan användas vid behov.

> **XML-element:**	`otherAgencyCode<br/>
> **Datatyp:**	string

---

**ERMS-SVK:12** (ERMS16)

*Typ av alternativt IDID*

> Samma som ovan (ERMS-SVK:10)

> Obligatoriskt om Alternativt ID används.

> **XML-element:**	`otherAgencyCode/@type`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:13** (ERMS17)

*Skapare Namn*

> Namn på den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`agencyName`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:14** (ERMS19)

*Underhållshistoria*

>Samlingselement för dokumentets underhållshistoria.

> Obligatoriskt.

> **XML-element:**	`maintenanceHistory`

---

**ERMS-SVK:15** (ERMS20)

*Underhållshändelse*

> En händelse i dokumentets underhållshistoria.

> Obligatoriskt. Elementet kan upprepas.
> 
> När XML-dokumentet skapas, får det en *Underhållshändelse* av typen `created`.

> **XML-element:**	`maintenanceEvent`

---

**ERMS-SVK:16** (ERMS21)

*Typ av händelse*

> Typ av underhållshändelse.

> Obligatoriskt. Värdet väljs från SVK-VÄRDELISTA 5.

> **XML-element:**	`eventType/@value`<br/>
> **Datatyp:**	token

---

**ERMS-SVK:17** (ERMS22)

*Datum för händelse*

> Datum då underhållshändelsen inträffade.

> Obligatoriskt.

> **XML-element:**	`eventDateTime`<br/>
> **Datatyp:**	dateTime

---

**ERMS-SVK:18** (ERMS23)

*Utförare*

> Den agent som har utfört handlingen.

> Obligatoriskt.

> **XML-element:**	`agent`

---

**ERMS-SVK:19** (ERMS93)

*Typ av utförare*

> Anger vilken egenskap utföraren har i förhållande till den utförda handlingen.

> Obligatoriskt. Värdet väljs från SVK-VÄRDELISTA 6.

> **XML-element:**	`agent/@agentType`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:20** (ERMS95)

*Namn*

> Namn på den person eller organisation som har utfört handlingen.

> Obligatoriskt.

> **XML-element:**	`agent/name`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:21** (ERMS99)

*Organisation*

> Organisationstillhörighet.

> Obligatoriskt om det är en person som är agent.

> **XML-element:**	`agent/organisation`<br/>
> **Datatyp:**	string

---

**Exempel 3 – Underhåll**

```xml
<control>
	<maintenanceInformation>
		<maintenanceStatus value="new"/>
		<maintenanceAgency>
			<agencyCode type="organisationsnummer">1234567876</agencyCode>
				<agencyName>Kyrkostyrelsen</agencyName>
		</maintenanceAgency>
		<maintenanceHistory>
			<maintenanceEvent>
				<eventType value="created"/>
				<eventDateTime>2001-12-17T09:30:47</eventDateTime>
				<agent agentType="deliverer">
					<name>Public 360</name>
					<organisation>Tietoevry</organisation>
				</agent>
			</maintenanceEvent>
		</maintenanceHistory>
	</maintenanceInformation>
</control>
```

---

## 3.2. Information om ärendeakter

### Tabell 2. Ärendeakter

---

**ERMS-SVK:22** (ERMS198)

*Ärendeakt*

> Samlingsobjekt för ärendeakten med ingående dokument och filer.

> Obligatoriskt.
> 
> Varje ärendeakt ska dokumenteras i en XML-fil, och ingen XML-fil får innehålla mer än en ärendeakt.

> **XML-element:**	`aggregation`

---

**ERMS-SVK:23** (ERMS199)

*Identifikator*

> Identifikator för ärendeakten i form av UUID. Identifikatorn anges automatiskt redan i det levererande systemet eller vid överföring till e-arkivet.

> Obligatoriskt.

> **XML-element:**	`aggregation/@systemIdentifier`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:24** (ERMS200)

*Typ av aggregation*

> Typ av aggregation, vilket i den här specifikationen alltid är ”caseFile”, det vill säga ”ärendeakt”.

> Obligatoriskt.

> **XML-element:**	`aggregation/@aggregationType=”caseFile”`<br/>
> **Datatyp:**	string

---

**Exempel 4 – Ärendeakt**

```xml
<aggregation systemIdentifier="3b9fbc5f-3eaf-4521-9726-0f142feb04c3" aggregationType="caseFile">
```

---

**ERMS-SVK:25** (ERMS218)

*Ärendenummer*

> Ärendets officiella nummer, ”diarienumret”.

> Obligatoriskt.
> 
> Ärendenumret ska ha formatet [diariekod] [årtal]-[löpnummer].
> Diariekoden ska bestå av versaler. Löpnumret ska bestå av fyra siffror
> och fylls vid behov ut med nollor, t.ex. S 2019-0043.

> **XML-element:**	`objectId`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:26** (ERMS219)

*Arkivansvarigs ID*

> Ett unikt ID för den arkivansvariga enheten.

> Obligatoriskt. Värdet på attributet `extraIdType` hämtas från SVK-värdelista 4.

> **XML-element:**	`extraId`<br/>
> **Datatyp:**	string

---

**ERMS-SVK:27** (ERMS219)

*Intern identifikator*

> Befintligt id i det levererande systemet.

> Om elementet *Intern identifikator* används, måste attributet `extraIdType` ha värdet ”deliveringSystemId”.

> **XML-element:**	`objectId`<br/>
> **Datatyp:**	string

---

**Exempel 5 – Ärendenummer och Intern identifikator**

```xml
<aggregation>
	<objectId>F 2019-0032</objectId>
	<extraId extraIdType="organisationsnummer">0987654321</extraId>
	<extraId extraIdType="deliveringSystemId">34565</extraId>
</aggregation>
```

---


