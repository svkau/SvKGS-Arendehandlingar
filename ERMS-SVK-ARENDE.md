![svkgs_arende](https://github.com/svkau/SvKGS-Arendehandlingar/assets/13225565/c16f2550-24cf-4a56-ae7f-5f257bc839dc)

# SvKGS-Ärendehandlingar

***Version 1.0 beta***

# Innehåll

- 1 [Inledning](#1-inledning)
  - 1.1 [Arkivpaket](#11-arkivpaket)
- 2 [Specifikationer för ärendehandlingar](#2-specifikationer-för-ärendehandlingar)
  - 2.2 [XML-dokumentet](#22-xml-dokumentet)
  - 2.3 [Värdelistor](#23-värdelistor)
  - 2.4 [Scheman](#24-scheman)
  - 2.5 [Datatyper](#25-datatyper)
  - 2.6 [Råd om användandet av *SvKGS Ärendehandlingar*](#26-råd-om-användandet-av-svkgs-ärendehandlingar)
- 3 [Dataelement med exempel](#3-dataelement-med-exempel)
  - 3.1 [Övergripande information om XML-dokumentet](#31-övergripande-information-om-xml-dokumentet)
  - 3.2 [Element som används för information om både ärendeakter och handlingar](#32-element-som-används-för-information-om-både-ärendeakter-och-handlingar)
  - 3.3 [Information om ärendeakter](#33-information-om-ärendeakter)
  - 3.4 [Information om ärendehandlingar](#34-information-om-ärendehandlingar)
  - 3.5 [Information om bifogade filer](#35-information-om-bifogade-filer)

# 1. Inledning

*Svenska kyrkans gemensamma specifikationer för elektronisk arkivering* beskriver vilken information som ska
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

# 2. Specifikationer för ärendehandlingar

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



- erms (1...1)
    - control (1...1)
    - aggregations (1...1)
      - aggregation (1...1) 
          - record (1...n)
            - appendix (1...n)


Elementet `erms` är dokumentets rot-element. Elementet `control` innehåller underelement med information om
själva XML-dokumentet (se avsnitt [3.1. Övergripande information om XML-dokumentet](#31-övergripande-information-om-xml-dokumentet)).

Elementet `aggregations` rymmer underelement av typen aggregation, vilket i det här fallet betyder ärendeakt
(se avsnitt [3.3. Information om ärendeakter](#33-information-om-ärendeakter)).
Notera att det i *SvKGS Ärendehandlingar* endast får finnas en aggregation i varje XML-dokument.

Elementet `aggregation` kan innehålla flera element av typen `record`, alltså ärendehandlingar
(se avsnitt [3.4. Information om ärendehandlingar](#34-information-om-ärendehandlingar)).

Varje `record` kan innehålla flera elementet av typen `appendix` som är en bifogad fil till den registrerade handlingen
(se avsnitt [3.5. Information om bifogade filer](#35-information-om-bifogade-filer)).

Observera att det tillagda elementet `svkAppendix` används i *SvKGS Ärendehandlingar* i stället för ERMS-elementet `appendix`.

I elementlistorna nedan finns de element som bör eller måste finnas i ett XML-dokument enligt *SvKGS Ärendehandlingar*.

- [Elementlista 1. Kontroll](#elementlista-1-kontroll)
- [Elementlista 2. ERMS-element för både ärendeakter och handlingar](#elementlista-2-erms-standardelement)
- [Elementlista 3. Tillagda element för både ärendeakter och handlingar](#elementlista-3-tillagda-element)
- [Elementlista 4. ERMS-element för ärendeakter](#elementlista-4-ärendeakter)
- [Elementlista 5. Tillagda element för ärendeakter](#elementlista-5-svenska-kyrkans-tilläggsinformation-om-ärendeakter)
- [Elementlista 6. ERMS-element för handlingar](#elementlista-6-ärendehandlingar)
- [Elementlista 7. Tillagda element för handlingar](#elementlista-7-svenska-kyrkans-tilläggsinformation-om-ärendehandlingar)
- [Elementlista 8. Element för bifogade filer](#elementlista-8-bifogad-fil)

## 2.3. Värdelistor

I många fall är det värde som får anges i ett dataelement begränsat till värden som finns i en specificerad värdelista.
De värdelistor som ingår i *SvKGS Ärendehandlingar* finns i ett eget dokument, [ERMS-SVK-ARENDE-vardelistor.md](ERMS-SVK-ARENDE-vardelistor.md).
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
Schemat är publikt tillgängligt på [Github](https://github.com/svkau/ERMS-SVK-element).

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

<img src="https://github.com/svkau/SvKGS-Arendehandlingar/assets/13225565/98ae301d-a05f-4f40-aef9-2f77683210d6" alt="figur_03" width="70%"/>

*Mappstruktur för ärendeleverans. Namn på mappar och filer är enbart exempel.*

Innan en leverans till e-arkivet görs, måste den levererande parten och e-arkivets förvaltningsorganisation
tillsammans upprätta en leveransöverenskommelse där villkor och förutsättningar för leveransen specificeras.
Se mer om leveransförfarandet i Arkivhandboken, kapitel 8.

# 3. Dataelement med exempel

## 3.1. Övergripande information om XML-dokumentet

Kontroll är ett obligatoriskt element som beskriver själva XML-filen och vad den innehåller.
Den underlättare förståelsen av informationen, om XML-filen skulle separeras från arkivpaketet.

### Elementlista 1. Kontroll

---

#### ERMS-SVK:1 - *Identifikator*

(ERMS1)

> Identifierar ERMS-dokumentet

> Obligatoriskt. Elementet får upprepas.

> Tre identifikatorer måste användas: arkivbildarens namn och id samt ärendets nummer. Se exempel nedan.

> **XML-element:**	`identification`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:2 - *Typ av identifikator*

(ERMS2)

> Beskrivning av identifikatorn.

> Obligatoriskt. Värdet väljs från [Värdelista 1](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-1---typ-av-identifikator).

> **XML-element:**	`identification/@identificationType`<br/>
> **Datatyp:**	string

---

#### Exempel 1 – Identifikator

```xml
<control>
    <identification identificationType="arkivbildare">Sunne pastorat</identification>
    <identification identificationType="organisationsnummer">1234567890</identification>
    <identification identificationType="aid">5610</identification>
    <identification identificationType="ärendenummer">P 2019-0254</identification>
</control>
```

---

#### ERMS-SVK:3 - *Informationsklassning*

(ERMS3)

> Informationsklass som baseras på säkerhetsklassificering.

> **XML-element:**	`informationClass`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:4 - *Klassificeringsstruktur*

(ERMS4-6)

> Den klassificeringsstruktur som har använts vid klassificering av det aktuella ärendet.

> Obligatoriskt. Värdet välj från [Värdelista 2](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-2---klassificeringsstruktur).

> **XML-element:**	`classificationSchema/textualDescriptionOfClassificationSchema/p` <br/>
> **Datatyp:**	string

---

#### Exempel 2 – Klassificeringsstruktur

```xml
<control>
	<classificationSchema>
		<textualDescriptionOfClassificationSchema>
			<p>KlaSL2016_1.0</p>
		</textualDescriptionOfClassificationSchema>
	</classificationSchema>
</control>
```
---

#### ERMS-SVK:5 - *Säkerhetsklassning*

(ERMS8)

> Säkerhetsklass.

> **XML-element:**	`securityClass` <br/>
> **Datatyp:**	string

---

#### ERMS-SVK:6 - *Underhåll*

(ERMS10)

> Samlingselement för underhållsinformation som används för att beskriva XML-dokumentets tillkomst och eventuella ändringar.

> Obligatoriskt.

> **XML-element:**	`maintenanceInformation`

---

#### ERMS-SVK:7 - *Status*

(ERMS11)

> XML-dokumentets status.

> Obligatoriskt. Värdet välj från [Värdelista 3](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-3---xml-dokumentets-status).
>
> För ett nyskapat dokument är värdet alltid `new`.

> **XML-element:**	`maintenanceStatus/@value` <br/>
> **Datatyp:**	string

---

#### ERMS-SVK:8 - *Skapare*

(ERMS12)

> Samlingselement med beskrivning av den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`maintenanceAgency`

---

#### ERMS-SVK:9 - *Skapare ID*

(ERMS13)

> Identifierande kod för den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`agencyCode`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:10 - *Typ av ID*

(ERMS14)

> Beskriver vilken typ av kod som har använts för att identifiera skaparen av XML-dokumentet.

> Obligatoriskt. Värdet väljs från [Värdelista 4](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-4---typ-av-id).

> **XML-element:**	`agencyCode/@type`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:11 - *Alternativt ID*

(ERMS15)

> Ytterligare en identifierande kod som kan användas vid behov.

> **XML-element:**	`otherAgencyCode<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:12 - *Typ av alternativt ID*

(ERMS16)

> Samma som ovan (ERMS-SVK:10)

> Obligatoriskt om Alternativt ID används.

> **XML-element:**	`otherAgencyCode/@type`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:13 - *Skapare Namn*

(ERMS17)

> Namn på den instans som har skapat XML-dokumentet.

> Obligatoriskt.

> **XML-element:**	`agencyName`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:14 - *Underhållshistoria*

(ERMS19)

>Samlingselement för dokumentets underhållshistoria.

> Obligatoriskt.

> **XML-element:**	`maintenanceHistory`

---

#### ERMS-SVK:15 - *Underhållshändelse*

(ERMS20)

> En händelse i dokumentets underhållshistoria.

> Obligatoriskt. Elementet kan upprepas.
> 
> När XML-dokumentet skapas, får det en *Underhållshändelse* av typen "created".

> **XML-element:**	`maintenanceEvent`

---

#### ERMS-SVK:16 - *Typ av händelse*

(ERMS21)

> Typ av underhållshändelse.

> Obligatoriskt. Värdet väljs från [Värdelista 5](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-5---typ-av-underh%C3%A5llsh%C3%A4ndelse).

> **XML-element:**	`eventType/@value`<br/>
> **Datatyp:**	token

---

#### ERMS-SVK:17 - *Datum för händelse*

(ERMS22)

> Datum då underhållshändelsen inträffade.

> Obligatoriskt.

> **XML-element:**	`eventDateTime`<br/>
> **Datatyp:**	dateTime

---

#### ERMS-SVK:18 - *Utförare*

(ERMS23)

> Den agent som har utfört handlingen.

> Obligatoriskt.

> **XML-element:**	`agent`

---

#### ERMS-SVK:19 - *Typ av utförare*

(ERMS93)

> Anger vilken egenskap utföraren har i förhållande till den utförda handlingen.

> Obligatoriskt. Värdet väljs från [Värdelista 6](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-6---typ-av-akt%C3%B6r-agenttype).

> **XML-element:**	`agent/@agentType`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:20 - *Namn*

(ERMS95)

> Namn på den person eller organisation som har utfört handlingen.

> Obligatoriskt.

> **XML-element:**	`agent/name`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:21 - *Organisation*

(ERMS99)

> Organisationstillhörighet.

> Obligatoriskt om det är en person som är agent.

> **XML-element:**	`agent/organisation`<br/>
> **Datatyp:**	string

---

#### Exempel 3 – Underhåll

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

## 3.2. Element som används för information om både ärendeakter och handlingar

Flera element såväl i ERMS som i *SvKGS Ärendehandlingar* kan användas för att ange information om både
ärendeakter och handlingar. De kan alltså användas på flera ställen i XML-dokumentet.

### 3.2.1. Aktörer

Elementen `agents` och `agent` används som en standard för att beskriva en person eller en organisation
som fungerar som aktör i något avseende. Olika typer av aktörer anges genom attributet `agentType` vars
värde hämtas från [ERMS-SVK-ARENDE-värdelista 6](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-6---typ-av-akt%C3%B6r-agenttype).

Om man vill använda ett värde i ERMS-SVK-ARENDE-värdelista 6 som inte ingår i ERMS utan är en
anpassning i *SvKGS Ärendehandlingar*, måste attributet `agentType` ha värdet "other". I detta
fall används attributet `otherAgentType` för att ange typ av aktör.

Elementet `agents` är ett samlingselement för ett eller flera element av typen `agent` som i sin tur
har underelementen `name` (string), `organisation` (string), `idNumber` (string) och `role` (string).
Av dessa är `name` det enda som är obligatoriskt.

Elementet `idNumber` kan användas för att ange t.ex. personnummer men också användarnamn och andra
identifikatorer som inte är nummer. Olika typer av `idNumber` anges genom attributet `idNumberType`,
vars värde hämtas från [ERMS-SVK-ARENDE-värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

#### Exempel 4 – Aktörer

```xml
<agents>
    <agent agentType="responsible_person">
        <name>Fredrik Johansson</name>
        <organisation>Kyrkstadens församling</organisation>
        <idNumber idNumberType="username">fredjo</idNumber>
    </agent>
    <agent agentType="counterpart">
        <name>Exempelföretaget AB</name>
        <idNumber idNumberType="organisationsnummer">1234567890</idNumber>
    </agent>
    <agent agentType="other" otherAgentType="closing_person">
        <name>Anna Pettersson</name>
        <organisation>Kyrkstadens församling</organisation>
        <idNumber idNumberType="username">annpet</idNumber>
    </agent>
</agents>
```

### 3.2.2. Datum

Elementen `dates` och `date` används som standard för att ange datum i XML-dokumentet. Olika typer av
datum anges genom attributet `dateType`, vars värde hämtas från [ERMS-SVK-ARENDE-värdelista 22](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-värdelista-22---datum).

Om man vill använda ett värde i [ERMS-SVK-ARENDE-värdelista 22](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-värdelista-22---datum) som inte ingår i ERMS utan är en
anpassning i *SvKGS Ärendehandlingar*, måste attributet `dateType` ha värdet "other". I detta
fall används attributet `otherDateType` för att ange typ av datum.

Elementet `date` kräver datatypen dateTime. Se avsnittet **[2.5. Datatyper](#25-datatyper)**.

#### Exempel 5 – Datum

```xml
<dates>
    <date dateType="created">2020-05-20T00:00:00</date>
    <date dateType="opened">2020-05-22T00:00:00</date>
    <date dateType="closed">2020-05-30T00:00:00</date>
</dates>
```
---

### Elementlista 2. ERMS standardelement

---

#### ERMS-SVK:22 - *Sekretessmarkering*


(ERMS253, ERMS57)

>Samlingselement för uppgift om sekretess.

> Elementet kan upprepas.
>
> Om elementet *Sekretess* används måste attributet `restrictionType` ha värdet ”confidential”.

> **XML-element:**	`restriction`<br/>

---

#### ERMS-SVK:23 - *Förklarande text*

(ERMS253, ERMS57)

>Fritext som beskriver sekretessen.

> **XML-element:**	`explanatoryText`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:24 - *Lagrum*

(ERMS59)

>Hänvisning till paragraf i kyrkoordningens 54 kapitel, till Offentlighets- och sekretesslagen
> eller till annat lagrum som stöder den angivna sekretessen.

> **XML-element:**	`regulation`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:25 - *Sekretessdatum*

(ERMS62)

>Datum från och med vilket sekretessen anses gälla.

>Om elementet *Sekretessdatum* används, måste attributet `dateType` ha värdet ”created”.

> **XML-element:**	`dates/date/@dateType="created"`<br/>
> **Datatyp:**	dateTime

---

#### Exempel 6 – Sekretessmarkering

```xml
<restriction restrictionType="confidential">
    <explanatoryText>Sekretess enligt KO</explanatoryText>
    <regulation>KO 54:2</regulation>
    <dates>
        <date dateType="created">2020-01-02T00:00:00</date>
    </dates>
</restriction>
```

---

#### ERMS-SVK:26 - *Kommentar*

(ERMS212, ERMS50)

> Kommentar till ärendet eller handlingen.
 
> Kommentaren utgörs av en enda sammanhängande text och är inte möjlig att upprepa. Se exemplet nedan.
> 
> I *SvKGS Ärendehandlingar* har elementet `notes` alltså ett mycket snävare användningsområde
> än vad som är fallet i ERMS.
> 
> För upprepade kommentarer eller anteckningar används i stället elementet `svkNotes`, se [SVK-ERMS:34](#erms-svk34---anteckningar).
>
> Om elementet *Kommentar* används, måste `noteType` ha värdet ”comment”.

> **XML-element:**	`notes/note/@noteType="comment"`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:27 - *Datum för kommentar*

(ERMS51)

> Datum då kommentaren skapades.

> **XML-element:**	`notes/note/@noteDate`<br/>
> **Datatyp:**	dateTime

---

#### Exempel 7 – Kommentar

```xml
<aggregation>
	<notes>
		<note noteType="comment" noteDate="2019-02-21T00:00:00">Detta är en kommentar</note>
	</notes>
</aggregation>
```
---

### Elementlista 3. Tillagda element

---

#### ERMS-SVK:28 - *Relaterade objekt*

> Samlingselement med referenser till objekt som ärendet relaterar till.

> Objekten kan vara projekt eller fastigheter.

> **XML-element:** `svk:relatedObjects`<br/>

---

#### ERMS-SVK:29 - *Relaterat objekt*

> Referens till objekt som ärendet relaterar till.

> Elementet kan upprepas.

> **XML-element:** `svk:relatedObject`<br/>

---

#### ERMS-SVK:30 - *Typ av objekt*

> Anger vilken typ av objekt det är fråga om.

> Obligatoriskt om elementet *Relaterat objekt* används. Värdet väljs från [Värdelista 18](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-18---typ-av-objekt).

> **XML-element:** `svk:relatedObject/@typeOfObject`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:31 - *Objektnamn*

> Det relaterade objektets namn.

> Obligatoriskt om elementet *Relaterat objekt* används.

> **XML-element:** `svk:objectName`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:32 - *ObjektID*

> Projektnummer, fastighetsbeteckning eller annan identifikator för objektet.

> Obligatoriskt om elementet *Relaterat objekt* används.

> **XML-element:** `svk:objectId`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:33 - *Internt ID*

> Objektets id-nummer i det levererande systemet.

> **XML-element:** `svk:deliveringSystemId`<br/>
> **Datatyp:** token

---

#### Exempel 8 – Relaterat objekt

```xml
<svk:relatedObjects>
    <svk:relatedObject typeOfObject="project">
        <svk:objectName>Omläggning av kyrktaket 2009</svk:objectName>
        <svk:objectId>P 2009:1</svk:objectId>
        <svk:deliveringSystemId>34958</svk:deliveringSystemId>
    </svk:relatedObject>
</svk:relatedObjects>
```

---

#### ERMS-SVK:34 - *Anteckningar*

> Samlingselement för anteckningar kopplade till ett ärende eller dokument.

> **XML-element:** `svk:svkNotes`<br/>

---

#### ERMS-SVK:35 - *Anteckning*

> Enskild anteckning kopplad till ärendet eller dokumentet.

> Elementet kan upprepas.

> **XML-element:** `svk:svkNote`<br/>

---

#### ERMS-SVK:36 - *Typ av anteckning*

> Kategorisering av anteckningen.

> Obligatoriskt om elementet *Anteckning* används. Värdet väljs från [Värdelista 10](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-10---typ-av-anteckning).

> **XML-element:** `svk:svkNote/@typeOfNote`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:37 - *Text*

> Anteckningens lydelse.

> Obligatoriskt om elementet *Anteckning* används.

> **XML-element:** `svk:noteText`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:38 - *Skapare av anteckning*

> Person som har gjort anteckningen.

> Obligatoriskt om elementet *Anteckning* används.
> 
> Se avsnitt [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet *creator*.

> **XML-element:** `svk:agents/agent/@agentType="creator"`

---

#### ERMS-SVK:39 - *Datum för anteckning*

> Datum och tid när anteckningen gjordes.

> Obligatoriskt om elementet *Anteckning* används.
> 
> Se avsnitt [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum).
> 
> Attributet `dateType` måste ha värdet *created*

> **XML-element:** `dates/date/dateType="created"`<br/>
> **Datatyp:** dateTime

---

#### Exempel 9 – Anteckningar

```xml
<svk:ermsSvkAggregation>
	<svk:svkNotes>
		<svk:svkNote typeOfNote="generell anteckning">
			<svk:noteText>Detta är en anteckning</svk:noteText>
			<svk:agents>
                <agent agentType="creator">
                    <name>Jörgen Persson</name>
                </agent>
            </svk:agents>
			<dates>
                <date dateType="created">2019-02-23T00:00:00</date>
            </dates>
		</svk:svkNote>
	</svk:svkNotes>
</svk:ermsSvkAggregation>
```
---

#### ERMS-SVK:40 - *Ändringslogg*

> Samlingselement för loggningsuppgifter.

> **XML-element:** `svk:auditLogEvents`<br/>

---

#### ERMS-SVK:41 - *Händelse*

> Enskild händelse i ändringsloggen.

> Obligatoriskt om elementet *Ändringslogg* används.

> **XML-element:** `svk:auditLogEvent`<br/>

---

#### ERMS-SVK:42 - *Tid*

> Datum och tid då ändringen gjordes.

> Obligatoriskt om elementet *Händelse* används.

> **XML-element:** `svk:eventTime`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:43 - *Användare*

> Namn på personen som gjorde ändringen.

> Obligatoriskt om elementet *Händelse* används.

> **XML-element:** `svk:user`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:44 - *Tillämpningsområde*

> Beskrivning av det som ändringen avser.

> Obligatoriskt om elementet *Händelse* används. Värdet väljs från [Värdelista 11](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-11---till%C3%A4mpningsomr%C3%A5de).

> **XML-element:** `svk:scope`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:45 - *Åtgärd*

> Beskrivning av ändringen.

> Obligatoriskt om elementet *Händelse* används. Värdet väljs från [Värdelista 12](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-12---%C3%A5tg%C3%A4rd).

> **XML-element:** `svk:action`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:46 - *Värde före ändring*

> Om ett värde har ändrats, anges här lydelsen före ändringen.

> **XML-element:** `svk:valueBeforeChange`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:47 - *Värde efter ändring*

> Om ett värde har ändrats, anges här lydelsen efter ändringen.

> **XML-element:** `svk:valueAfterChange`<br/>
> **Datatyp:** token

---

#### Exempel 10 – Ändringslogg

```xml
<svk:auditLogEvents>
    <svk:auditLogEvent>
        <svk:time>2009-09-22T11:47:00</svk:time>
        <svk:user> Jörgen Persson</svk:user>
        <svk:scope>ärende</svk:scope>
        <svk:action>create</svk:action>
    </svk:auditLogEvent>
    <svk:auditLogEvent>
        <svk:time>2009-09-22T11:52:00</svk:time>
        <svk:user>Jörgen Persson</svk:user>
        <svk:scope>ärendemening</svk:scope>
        <svk:action>update</svk:action>
        <svk:valueBeforeChange>Upphandling av frysboxar</svk:valueBeforeChange>
        <svk:valueAfterChange>Upphandling av kylskåp</svk:valueAfterChange>
    </svk:auditLogEvent>
    <svk:auditLogEvent>
        <svk:time>2009-09-22T12:10:00</svk:time>
        <svk:user> Jörgen Persson </svk:user>
        <svk:scope>ärendestatus</svk:scope>
        <svk:action>update</svk:action>
        <svk:valueBeforeChange>Öppet</svk:valueBeforeChange>
        <svk:valueAfterChange>Makulerat</svk:valueAfterChange>
    </svk:auditLogEvent>
</svk:auditLogEvents>
```

---

## 3.3. Information om ärendeakter

---

### Elementlista 4. Ärendeakter

---

#### ERMS-SVK:48 - *Ärendeakt*

(ERMS198)

> Samlingsobjekt för ärendeakten med ingående dokument och filer.

> Obligatoriskt.
> 
> Varje ärendeakt ska dokumenteras i en XML-fil, och ingen XML-fil får innehålla mer än en ärendeakt.

> **XML-element:**	`aggregation`

---

#### ERMS-SVK:49 - *Identifikator*

(ERMS199)

> Identifikator för ärendeakten i form av UUID. Identifikatorn anges automatiskt redan i det levererande systemet eller vid överföring till e-arkivet.

> Obligatoriskt.

> **XML-element:**	`aggregation/@systemIdentifier`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:50 - *Typ av aggregation*

(ERMS200)

> Typ av aggregation, vilket i den här specifikationen alltid är ”caseFile”, det vill säga ”ärendeakt”.

> Obligatoriskt.

> **XML-element:**	`aggregation/@aggregationType=”caseFile”`<br/>
> **Datatyp:**	string

---

#### Exempel 11 – Ärendeakt

```xml
<aggregation systemIdentifier="3b9fbc5f-3eaf-4521-9726-0f142feb04c3" aggregationType="caseFile">
```

---

#### ERMS-SVK:51 - *Ärendenummer*

(ERMS218)

> Ärendets officiella nummer, ”diarienumret”.

> Obligatoriskt.
> 
> Ärendenumret ska ha formatet [diariekod] [årtal]-[löpnummer].
> Diariekoden ska bestå av versaler. Löpnumret ska bestå av fyra siffror
> och fylls vid behov ut med nollor, t.ex. S 2019-0043.

> **XML-element:**	`objectId`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:52 - *Arkivansvarigs ID*

(ERMS219)

> Ett unikt ID för den arkivansvariga enheten.

> Obligatoriskt. Värdet på attributet `extraIdType` hämtas från [Värdelista 4](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-4---typ-av-id).

> **XML-element:**	`extraId`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:53 - *Intern identifikator*

(ERMS219)

> Befintligt id i det levererande systemet.

> Om elementet *Intern identifikator* används, måste attributet `extraIdType` ha värdet ”deliveringSystemId”.

> **XML-element:**	extraId/@deliveringSystemId`<br/>
> **Datatyp:**	string

---

#### Exempel 12 – Ärendenummer och Intern identifikator

```xml
<aggregation>
	<objectId>F 2019-0032</objectId>
	<extraId extraIdType="organisationsnummer">0987654321</extraId>
	<extraId extraIdType="deliveringSystemId">34565</extraId>
</aggregation>
```

---

#### ERMS-SVK:54 - *Informationsklassning*

(ERMS202)

> Ärendets informationsklass.

> **XML-element:**	`informationClass`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:55 - *Säkerhetsklassning*

(ERMS203)

> Ärendets säkerhetsklass.

> **XML-element:**	`securityClass`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:56 - *Klassificering*

(ERMS208)

> Namnet på den process i den officiella klassificeringsstrukturen som har angivits som klassificering av ärendet och de ingående handlingarna.

> **XML-element:**	`classification`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:57 - *Klassificeringskod*

(ERMS75)

> Namnet på den process i den officiella klassificeringsstrukturen som har angivits som klassificering av ärendet och de ingående handlingarna.

> **XML-element:**	`classification/@classificationCode`<br/>
> **Datatyp:**	string

---

#### Exempel 13 – Klassificering

```xml
<aggregation>
	<classification classificationCode="2.7">Ge service</classification>
</aggregation>
```

---

#### ERMS-SVK:58 - *Nyckelord*

(ERMS223)

> Samlingselement för nyckelord.

> **XML-element:**	`keywords`<br/>

---

#### ERMS-SVK:59 - *Nyckelord*

(ERMS224)

****

> Enskilt nyckelord.

> Elementet kan upprepas.

> **XML-element:**	`keyword`<br/>
> **Datatyp:**	string

---

#### Exempel 14 – Nyckelord

```xml
<aggregation>
	<keywords>
		<keyword>församlingsordning</keyword>
		<keyword>kyrkorådet</keyword>
	</keywords>
</aggregation>
```

---

#### ERMS-SVK:60 - *Ärendemening*

(ERMS209)

> Ärendemening, ärendets titel.

> **XML-element:**	`title`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:61 - *Offentlig titel*

(ERMS210)

> Används endast för Offentlig titel i leveranser från Public 360°.

> Om elementet `otherTitel` används måste attributet `titleType` ha värdet ”publicTitle”.

> **XML-element:**	`otherTitle/@titleType="publicTitle"`<br/>
> **Datatyp:**	string

---

#### Exempel 15 – Ärendemening och Offentlig titel

```xml
<aggregation>
	<title>Ärendets titel</title>
	<otherTitle titleType="publicTitle">En offentlig titel</otherTitle>
</aggregation>
```

---

#### ERMS-SVK:62 - *Ärendestatus*

(ERMS239)

> Ärendets status.

> Obligatoriskt. Värdet väljs från [Värdelista 7](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-7---%C3%A4rende--och-handlingsstatus).
>
> Giltiga värden:”closed” (avslutat) eller ”obliterated” (makulerat).
 
```xml
<aggregation>
	<status value="closed"/>
</aggregation>
```

> **XML-element:**	`status/@value`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:63 - *Ärendereferens*

(ERMS52-53)

> Referens till och/eller från annat ärende.

> Elementet kan upprepas.
>
> Om möjligt anges det andra ärendets *Ärendenummer* enligt specifikationen i detta dokument,
> annars ärendenumret i annat format eller fritext.
> 
> Om elementet *Ärendereferens* används, måste attributet `relationType` ha värdet ”reference”.

> **XML-element:**	`relation/@relationType="reference"`<br/>
> **Datatyp:**	string

---

#### Exempel 16 – Ärendereferens

```xml
<aggregation>
	<relation relationType="reference">F 2019-0454</relation>
</aggregation>
```

---

#### ERMS-SVK:64 - *Utökad XML-data*

(ERMS252, ERMS43)

> Utökad XML-data är en del av Svenska kyrkans anpassning av ERMS.

> Obligatoriskt
> 
> Se [Elementlista 5](ERMS-SVK-ARENDE.md#elementlista-5-svenska-kyrkans-tilläggsinformation-om-ärendeakter).

> **XML-element:**	`additionalXMLData`<br/>

---

#### *Sekretessmarkering*

> Se [ERMS-SVK:22](ERMS-SVK-ARENDE.md#erms-svk22---sekretessmarkering)

---

#### ERMS-SVK:65 - *Aktörer*

(ERMS230-235)

> Samlingselement för alla agerande parter i ärendet.

> Se avsnitt [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).

> **XML-element:**	`agents`<br/>

---

#### ERMS-SVK:66 - *Skapare*

(ERMS230)

****

> Den som har skapat ärendet i systemet.

> Om elementet *Skapare* används, måste attributet `agentType` ha värdet ”creator”.

> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/@agentType="creator"`<br/>

---

#### ERMS-SVK:67 - *Handläggare*

> Ansvarig handläggare för ärendet.

> Om elementet *Handläggare* används, måste attributet `agentType` ha värdet ”responsible_person”.
 
> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/@agentType="responsible_person"`

---

#### ERMS-SVK:68 - *Medhandläggare*

(ERMS232)

****

> Eventuella medhandläggare utöver den ansvariga.

> Elementet kan upprepas.
> 
> Om elementet *Medhandläggare* används, måste attributet `agentType` ha värdet ”editor”.
 
> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/@agentType="editor"`

---

#### ERMS-SVK:69 - *Ärendepart*

>Extern part i ärendet.

> Elementet kan upprepas.
> 
>Om elementet *Ärendepart* används, måste attributet `agentType` ha värdet ”counterpart”.
 
> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/@agentType="counterpart`

---

#### ERMS-SVK:70 - *Annan aktör*

> Annan typ av aktör eller kontakt kopplad till ärendet.

> Elementet kan upprepas.
> 
> Om elementet *Annan aktör* används, måste attributet `agentType` ha värdet ”agent”.
 
> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/agentType="agent"`

---

#### ERMS-SVK:71 - *Avslutare*

> Den som har avslutat eller makulerat ärendet.

> Om elementet *Avslutare* används, måste attributet `agentType` ha värdet ”other”
> och `otherAgentType` värdet ”closing_person”.

> Om `idNumber` används hämtas värdet för `idNumberType`från [Värdelista 8](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-8---typ-av-idnumber).

> **XML-element:**	`agent/@agentType="other" @otherAgentType="closing_person"`

---

#### ERMS-SVK:72 - *Beskrivning*

(ERMS211)

>En beskrivning av ärendet utöver *Ärendemening*.

> **XML-element:**	`description`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:73 - *Datum*

(ERMS204-206)

> Samlingselement för datum som gäller för ärendet.

> Se avsnitt [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum).

> **XML-element:**	`dates`<br/>

---

#### ERMS-SVK:74 - *Skapat*

(ERMS232)

> Datum då ärendet skapades i systemet. Här avses ett av systemet automatiskt satt datum.

> Obligatoriskt.
> 
> Om uppgiften saknas i diariesystemet, används samma datum som för *Öppnat*.
> 
> Om elementet *Skapat* används, måste `dateType` ha värdet ”created”.

> **XML-element:**	`date/@dateType=”created”`<br/>
> **Datatyp:**	dateTime

---

#### ERMS-SVK:75 - *Öppnat*

> Datum då ärendet officiellt öppnades.

> Obligatoriskt.
> 
> Om elementet *Öppnat* används, måste `dateType` ha värdet ”opened”.

> **XML-element:**	`date/@dateType=”opened”`<br/>
> **Datatyp:**	dateTime

---

#### ERMS-SVK:76 - *Avslutat*

> Datum då ärendet avslutades eller makulerades.

> Obligatoriskt.
> 
> Om elementet *Avslutat* används, måste `dateType` ha värdet ”closed”.

> **XML-element:**	`date/@dateType=”closed”`<br/>
> **Datatyp:**	dateTime

---

#### ERMS-SVK:77 - *Beslut i ärendet*

(ERMS240)

>Samlingselement som används för uppgifter om beslut som har fattats i ärendet och
> som i diariesystemet har registrerats separat och inte som en vanlig handling.

>Elementet kan upprepas.
> 
> *SvKGS Ärendehandlingar* har alltså ett betydligt snävare användningsområde
> av elementet `action` än vad som är fallet i ERMS.

> **XML-element:**	`action`<br/>

---

#### ERMS-SVK:78 - *Beslutstext*

(ERMS84)

>Beslutets lydelse samt ev. referens till protokoll.

> Obligatoriskt om elementet *Beslut i ärendet* används.

> **XML-element:**	`actionText`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:79 - *Typ av händelse*

(ERMS87)

> Obligatoriskt om elementet *Beslut i ärendet* används.
> 
> Elementet måste ha värdet ”beslut”.

> **XML-element:**	`actionType`<br/>
> **Datatyp:**	string

---

#### ERMS-SVK:80 - *Beslutsdatum*

(ERMS89, ERMS47)

> Datum då beslutet fattades.
 
> Om elementet *Beslutsdatum* används, måste `dateType` ha värdet ”decision_date”.
>
> Se avsnittet [3.2.2 Datum](ERMS-SVK-ARENDE.md#322-datum).

> **XML-element:**	`dates/date/@dateType=”decision_date”`<br/>
> **Datatyp:**	dateTime

---

#### ERMS-SVK:81 - *Beslutsfattare*

(ERMS90-91, 93)

> Namn på person eller organ som har fattat beslutet.
 
> Se avsnittet [3.2.1 Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Om elementet *Beslutsfattare* används, måste `agentType` ha värdet ”authorising_person”.

> **XML-element:**	`agents/agent/@agentType="authorising_person"`<br/>

---

#### Exempel 17 – Beslut i ärendet

```xml
<aggregation>
	<action>
		<actionText>Beslutets lydelse</actionText>
		<actionType>beslut</actionType>
		<dates>
			<actionDate dateType="decision_date">2020-05-20T00:00:00</actionDate>
		</dates>
		<agents>
			<agent agentType="authorising_person">
				<name>Kyrkorådet</name>
			</agent>
		</agents>
	</action>
</aggregation>
```
---

#### *Kommentar*

> Se [ERMS-SVK:26](ERMS-SVK-ARENDE.md#erms-svk26---kommentar).

---

### Elementlista 5. Svenska kyrkans tilläggsinformation om ärendeakter.

---

#### ERMS-SVK:82 - *Tilläggsinformation*

> De element som inte ingår i ERMS utan är tillägg i Svenska kyrkans anpassning är samlade i elementet *Tilläggsinformation*.

> Obligatoriskt.

> **XML-element:** `additionalInformation/additionalXMLData/svk:ermsSvkArende/svk:ermsSvkAggregation`<br/>

---

#### ERMS-SVK:83 - *Version av SvKGS Ärendehandlingar*

> Anger vilken version av SvKGS Ärendehandlingar som XML-dokumentet är kompatibelt med.

> Obligatoriskt.

> **XML-element:** `svk:ermsSvkArende/@ermsSvkArendeVersion="1.0"` (decimal)<br/>


---

#### ERMS-SVK:84 - *Initiativ*

> Anger om initiativ till ärendets öppnande är externt
> (genom en inkommande handling), eller om ärendet har öppnats på eget (internt) initiativ.

> Värdet väljs från [Värdelista 9](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-9---initiativ).
> Möjliga värden: ”externt”eller ”eget”.

> **XML-element:** `svk:initiative`<br/>
> **Datatyp:** token

---

#### *Relaterade objekt*

> Se [ERMS-SVK:28](ERMS-SVK-ARENDE.md#erms-svk28---relaterade-objekt).

---

#### *Anteckningar*

> Se [ERMS-SVK:34](ERMS-SVK-ARENDE.md#erms-svk34---anteckningar).

---

#### *Ändringslogg*

> Se [ERMS-SVK:40](ERMS-SVK-ARENDE.md#erms-svk40---ändringslogg).

---

## 3.4. Information om ärendehandlingar

---

### Elementlista 6. Ärendehandlingar

---

#### ERMS-SVK:85 - *Handling*

(ERMS129)

> Samlingselement med information om en i ärendet registrerad handling.

> Obligatoriskt. Elementet kan upprepas.

> **XML-element:** `record`<br/>

---

#### ERMS-SVK:86 - *Identifikator*

(ERMS130)

> Identifikator för dokumentet i form av UUID. Identifikatorn anges
> automatiskt redan i det levererande systemet eller vid överföring till e-arkivet.

> Obligatoriskt.

> **XML-element:** `record/@systemIdentifier`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:87 - *Handlingstyp*

(ERMS131)

> Övergripande typ av handling. Motsvarar **inte** handlingstyp i arkivredovisning/dokumenthanteringsplan.

> Obligatoriskt. Värdet väljs från [Värdelista 13](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-13---handlingstyp).
> 
> Oavsett handlingstyp kan värdet ”ärendedokument” alltid användas.

> **XML-element:** `record/@recordType`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:88 - *Form*

(ERMS132)

> Anger om handlingen bara finns i fysisk form, bara i digital form eller både och.

> Värdet väljs från [Värdelista 14](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-14---form).

> **XML-element:** `record/@recordPhysicalOrDigital`<br/>
> **Datatyp:** string

---

#### Exempel 18 – Handling

```xml
<record
	systemIdentifier="8dbbdc56-8ada-4ad5-a1ec-b8131a1086a2"
	recordPhysicalOrDigital="digital"
	recordType="ärendedokument">
</record>
```

#### ERMS-SVK:89 - *Handlingsnummer*

(ERMS146)

> En kombination av *Ärendenummer* ([ERMS-SVK:51](ERMS-SVK-ARENDE.md#erms-svk51---ärendenummer)) och handlingens *Löpnummer*
> ([ERMS-SVK:100](ERMS-SVK-ARENDE.md#erms-svk100---löpnummer)) med kolon emellan.

> Obligatoriskt.
> 
> Exempel: `S 2010-0034:1`

> **XML-element:** `objectId`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:90 - *Intern identifikator*

(ERMS148-149)

> Befintligt id i det levererande systemet.

> Om elementet *Intern identifikator* används, måste attributet `extraIdType` ha
> värdet ”deliveringSystemId”.

> **XML-element:** `objectId`<br/>
> **Datatyp:** string

---

#### Exempel 19 – Handlingsnummer och Intern identifikator

```xml
<record>
	<objectId>C 1995-0032:1</objectId>
	<extraId extraIdType="deliveringSystemId">34565</extraId>
```

#### ERMS-SVK:91 - *Informationsklassning*

(ERMS133)

> Handlingens informationsklass.

> **XML-element:** `informationClass`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:92 - *Säkerhetsklassning*

(ERMS134)

> Handlingens säkerhetsklass.

> **XML-element:** `securityClass`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:93 - *Klassificering*

(ERMS196)

> Namnet på den process i den officiella klassificeringsstrukturen som har
> angivits som klassificering av ärendet och de ingående handlingarna.

> **XML-element:** `classification`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:94 - *Klassificeringskod*

(ERMS75)

> Koden för den process som angivits under *Klassificering*.

> **XML-element:** `classification/@classificationCode`<br/>
> **Datatyp:** string

---

#### Exempel 20 – Klassificering

```xml
<record>
	<classification classificationCode="2.7">Ge service</classification>
</record>
```

---

#### ERMS-SVK:95 - *Nyckelord*

(ERMS152)

> Samlingselement för nyckelord.

> **XML-element:** `keywords`<br/>

---

#### ERMS-SVK:96 - *Nyckelord*

(ERMS153)

> Enskilt nyckelord.

> Elementet kan upprepas.

> **XML-element:** `keyword`<br/>
> **Datatyp:** string

---

#### Exempel 21 – Nyckelord

```xml
<record>
    <keywords>
        <keyword>församlingsordning</keyword>
        <keyword>kyrkorådet</keyword>
    </keywords>
</record>
```
---

#### ERMS-SVK:97 - *Titel*

(ERMS)

> Titel eller en beskrivning av handlingen.

> Obligatoriskt.

> **XML-element:** `title`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:98 - *Offentlig titel*

(ERMS)

> Används enbart för Offentlig titel i leveranser från Public 360°.

> Om elementet *Annan titel* används måste attributet titleType ha
> värdet ”publicTitle”.

> **XML-element:** `otherTitle/@titleType="publicTitle"`<br/>
> **Datatyp:** string

---

#### Exempel 22 – Titel och Offentlig titel

```xml
<record>
	<title>Handlingens titel</title>
	<otherTitle titleType="publicTitle">En offentlig titel</otherTitle>
</record>
```

---

#### ERMS-SVK:99 - *Status*

(ERMS)

> Handlingens status.

> Obligatoriskt. Värdet väljs från [Värdelista 7](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-7---%C3%A4rende--och-handlingsstatus).
> 
> Värdet kan vara antingen ”closed”, vilket innebär att dokumentet är registrerat
> som inkommet eller upprättat, eller ”obliterated”, vilket betyder att det är
> makulerat.

```xml
<record>
	<status value="closed"/>
</record>
````

> **XML-element:** `status/@value`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:100 - *Löpnummer*

(ERMS)

> Handlingens löpnummer i ärendet.
 
> Obligatoriskt. Måste vara unikt i respektive ärende.

> **XML-element:** `runningNumber`<br/>
> **Datatyp:** integer

---

#### ERMS-SVK:101 - *Dokumentreferens*

(ERMS)

> Referens till och/eller från annan handling.

> Elementet kan upprepas.
> 
> Om möjligt anges den andra handlingens Dokumentnummer enligt specifikationen
> i detta dokument, annars en hänvisning till dokumentet i annat format eller
> fritext.
> 
> Om elementet Dokumentreferens används, måste attributet
> `relationType` ha värdet ”reference”.

> **XML-element:** `relation/@relationType="reference"`<br/>
> **Datatyp:** string

---

#### Exempel 23 – Dokumentreferens

```xml
<record>
	<relation relationType="reference">F 2019-0454:4</relation>
</record>
```

---

#### *Sekretessmarkering*

> se [ERMS-SVK:22](ERMS-SVK-ARENDE.md#erms-svk22---sekretessmarkering).

---

#### ERMS-SVK:102 - *Riktning*

(ERMS)

> Anger handlingens riktning.

> Obligatoriskt. Värdet väljs från [Värdelista 15](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-15---riktning).
> 
>Kan vara något av värdena:
> 1.	”incoming” – en inkommen handling
> 2.	”outgoing” – en genom expediering upprättad handling
> 3.	”internal” – en på annat sätt upprättad handling

> **XML-element:** `direction/@directionDefinition`<br/>
> **Datatyp:** string

---

#### Exempel 24 – Riktning

1.
```xml
<record>
	<direction directionDefinition="incoming"/>
</record>
```

2.
```xml
<record>
	<direction directionDefinition="outgoing"/>
</record>
```

3.
```xml
<record>
	<direction directionDefinition="other" otherDirectionDefinition="internal"/>
</record>
```

---

#### ERMS-SVK:103 - *Aktörer*

(ERMS)

> Samlingselement för alla agerande parter.

> Obligatoriskt.
> 
> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).

> **XML-element:** `agents`<br/>

---

#### ERMS-SVK:104 - *Skapare*

(ERMS)

> Den som har skapat handlingen i systemet.

> Om elementet *Skapare* används, måste `agentType` ha värdet ”creator”.

> **XML-element:** `agent/@agentType="creator`

---

#### ERMS-SVK:105 - *Ansvarig*

(ERMS)

> Den som ägde eller hade ansvar för handlingen innan ärendet avslutades.

> Om elementet *Ansvarig* används, måste `agentType` ha värdet ”responsible_person”.


> **XML-element:** `agent/@agenttype="responsible_person"`

---

#### ERMS-SVK:106 - *Avsändare*

(ERMS)

> Avsändare av en inkommen handling.

> Obligatoriskt om *Riktning* har värdet ”incoming”. Elementet kan upprepas.
> 
> Om elementet *Avsändare* används, måste `agentType` ha värdet ”sender”.

> **XML-element:** `agent/@agentType="sender"`

---

#### ERMS-SVK:107 - *Mottagare*

(ERMS)

> Mottagare av en utgående handling.

> Obligatoriskt om *Riktning* har värdet ”outgoing”. Elementet kan upprepas.
> 
> Om elementet *Mottagare* används, måste `agentType` ha värdet ”receiver”.

> **XML-element:** `agent/@agentType="receiver"`

---

#### ERMS-SVK:108 - *Annan aktör*

(ERMS)

> Annan typ av aktör än de ovan specificerade.

> Elementet kan upprepas.
 
> Om elementet *Annan aktör* används, måste `agentType` ha värdet ”agent”.

> **XML-element:** `agent/@agentType="agent"`

---

#### Exempel 25 – Aktörer

```xml
<record>
    <agents>
        <agent agentType="creator">
            <name>Anna Andersson</name>
            <idNumber idNumberType="username">svkanan</idNumber>
        </agent>
        <agent agentType="responsible_person">
            <name>Johan Göransson</name>
            <idNumber idNumberType="username">svkjogo</idNumber>
        </agent>
        <!-- Om det är en inkommande handling: -->
        <agent agentType="sender">
            <name>Försäkringskassan</name>
        </agent>
        <!-- Om det är en utgående handling: -->
        <agent agentType="receiver">
            <name>Försäkringskassan</name>
        </agent>
    </agents>
</record>
```

---

#### ERMS-SVK:109 - *Beskrivning*

(ERMS)

> Beskrivning av handlingen.

> **XML-element:** `description`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:110 - *Datum*

(ERMS)

> Samlingselement för alla datum som rör handlingen.

> Se avsnittet [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum) ovan.

> **XML-element:** `dates`<br/>

---

#### ERMS-SVK:111 - *Skapat*

(ERMS)

> Datum och tid då handlingen skapades i systemet.
> Här avses ett av systemet automatiskt satt datum.

> Obligatoriskt.
>
> Om uppgiften saknas i diariesystemet, används samma datum som i *Registrerat*.
> 
> Om elementet *Skapat* används, måste `dateType` ha värdet ”created”.

> **XML-element:** `date/@dateType=”created”`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:112 - *Registrerat*

(ERMS)

> Datum och tid då handlingen registrerades (diariefördes) som inkommen,
> utgående eller på annat sätt färdigställd.

> Obligatoriskt.
>
> Uppgiften relaterar till elementet *Riktning*. Om *Riktning* t.ex. har värdet ”outgoing”,
> anges här datum för expediering. Om *Riktning* i stället har värdet ”incoming”,
> anges här datum då handlingen inkom.
> 
> Om elementet *Registrerat* används, måste `dateType` ha värdet ”originated”.

> **XML-element:** `date/@dateType=”originated”`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:113 - *Ankomstdatum*

(ERMS)

> Datum då handlingen inkom (om annat än *Registrerat*).
 
> Om elementet *Ankomstdatum* används, måste `dateType` ha värdet ”received”.

> **XML-element:** `date/@dateType=”received”`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:114 - *Expedieringsdatum*

(ERMS)

> Datum då handlingen expedierades (om annat än *Registrerat*).
 
> Om elementet *Expedieringsdatum* används, måste `dateType` ha värdet ”expedited”.

> **XML-element:** `date/@dateType=”expedited”`<br/>
> **Datatyp:** dateTime

---

#### Exempel 26 – Datum

```xml
<record>
	<dates>
		<date dateType="created">2020-02-02T12:32:15</date>
		<date dateType="originated">2020-02-02T00:00:00</date>
		<date dateType="received">2020-01-14T00:00:00</date>
	</dates>
</record>
```

---

#### *Kommentar*

> se [ERMS-SVK:26](ERMS-SVK-ARENDE.md#erms-svk26---kommentar).

---

#### ERMS-SVK:115 - *Utökad XML-data*

> *Utökad XML-data* är en del av Svenska kyrkans anpassning av ERMS.

> Obligatoriskt.
> 
> Se [Elementlista 7](ERMS-SVK-ARENDE.md#elementlista-7-svenska-kyrkans-tilläggsinformation-om-ärendehandlingar).

> **XML-element:** `additionalXMLData`<br/>

---

### Elementlista 7. Svenska kyrkans tilläggsinformation om ärendehandlingar

---

#### ERMS-SVK:116 - *Tilläggsinformation*

> De element som inte ingår i ERMS utan är tillägg i Svenska kyrkans anpassning är samlade i elementet *Tilläggsinformation*.

> Obligatoriskt.

> **XML-element:** `additionalInformation/additionalXMLData/svk:ermsSvkArende/svk:ermsSvkRecord`<br/>

---

#### *Relaterade objekt*

> Se [ERMS-SVK:28](ERMS-SVK-ARENDE.md#erms-svk28---relaterade-objekt).

---

#### *Anteckningar*

> Se [ERMS-SVK:34](ERMS-SVK-ARENDE.md#erms-svk34---anteckningar).

---

#### ERMS-SVK:117 - *Avtalsinformation*

> Samlingselement för extra information om registrerade avtal.

> **XML-element:** `svk:contractInfo`<br/>

---

#### ERMS-SVK:118 - *Avsändares referens*

> Referens till avtalspartners exemplar av avtalsdokumentet.

> **XML-element:** `svk:externalReference`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:119 - *Avropat värde*

> Avropat värde.

> Kan endast anges i heltal.

> **XML-element:** `svk:callOffValue`<br/>
> **Datatyp:** integer

---

#### ERMS-SVK:120 - *Valuta*

> Valutaslag för *Avropat värde*.

> Valutakod enligt [ISO 4217](https://sv.wikipedia.org/wiki/ISO_4217).
> ”SEK” är förvalt värde och behöver inte anges specifikt.

> **XML-element:** `svk:callOffValue/@currency`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:121 - *Kontraktsvärde*

> Kontraktsvärde.

> Kan endast anges i heltal.

> **XML-element:** `svk:contractValue`<br/>
> **Datatyp:** integer

---

#### ERMS-SVK:122 - *Valuta*

> Valutaslag för *Kontraktsvärde*.

> Valutakod enligt [ISO 4217](https://sv.wikipedia.org/wiki/ISO_4217).
> ”SEK” är förvalt värde och behöver inte anges specifikt.

> **XML-element:** `svk:contractValue/@currency`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:123 - *Avtalstyp*

> Typ av avtal.

> Värdet väljs från [Värdelista 16](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-16---avtalstyp).

> **XML-element:** `svk:typeOfAgreement`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:124 - *Giltigt från*

> Datum från vilket avtalet är giltigt.

> Om elementet *Giltigt från* används, måste attributet `dateType` ha värdet ”start”.

> **XML-element:** `svk:dates/date/@datetype="start"`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:125 - *Giltigt till*

> Datum fram till vilket avtalet är giltigt.

> Om elementet *Giltigt till* används, måste attributet `dateType` ha värdet ”end”.

> **XML-element:** `svk:dates/date/@datetype="end"`<br/>
> **Datatyp:** dateTime

---

#### Exempel 27 – Avtalsinformation

```xml
<svk:ermsSvkRecord>
	<svk:contractInfo>
		<svk:externalReference>ref3453</svk:externalReference>
		<svk:callOffValue currency="SEK">34000</svk:callOffValue>
		<svk:contractValue currency="SEK">45000</svk:contractValue>
		<svk:typeOfAgreement>Avtal</svk:typeOfAgreement>
		<dates>
			<date dateType="start">2018-02-12T00:00:00</date>
			<date dateType="end">2019-02-12T00:00:00</date>
		</dates>
	</svk:contractInfo>
</svk:ermsSvkRecord>
```

---

#### ERMS-SVK:126 - *Arbetsflöden*

> Samlingselement för arbetsflöden kopplade till handlingen.

> **XML-element:** `svk:workflows`<br/>

---

#### ERMS-SVK:127 - *Arbetsflöde*

> Ett enskilt arbetsflöde kopplat till handlingen.

> Obligatoriskt om *Arbetsflöden* används.

> **XML-element:** `svk:workflow`<br/>

---

#### ERMS-SVK:128 - *Typ av arbetsflöde*

> Typ av arbetsflöde.

> Obligatoriskt. Värdet väljs från [Värdelista 19](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-19---typ-av-arbetsfl%C3%B6de).
> 
> Attributet `typeOfWorkflow` kan enbart ha värdet ”approval”.

> **XML-element:** `svk:workflow/@typeOfWorkflow="approval"`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:129 - *Namn*

> Namn på arbetsflödet.

> **XML-element:** `svk:workflowName`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:130 - *Status*

> Arbetsflödets status.

> Obligatoriskt. Värdet väljs från [Värdelista 20](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-20---arbetsfl%C3%B6des-status).

> **XML-element:** `svk:workflowStatus`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:131 - *Prioritet*

> Arbetsflödets prioritet.

> Värdet väljs från [Värdelista 21](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-21---arbetsfl%C3%B6des-prioritet).

> **XML-element:** `svk:workflowPriority`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:132 - *Initierat av*

> Den person som har startat arbetsflödet.

> Obligatoriskt.
> 
> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer). 
> 
> Attributet `agentType` måste ha värdet ”creator”.

> **XML-element:** `svk:agents/agent/@agentType="creator"`<br/>

---

#### ERMS-SVK:133 - *Initierat datum*

> Datum då arbetsflödet startades.

> Obligatoriskt.
> 
> Se avsnittet [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum).
> 
> Attributet dateType måste ha värdet ”created”.

> **XML-element:** `dates/date/@dateType=”created”`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:134 - *Meddelande*

> Meddelande knutet till arbetsflödet.

> **XML-element:** `svk:workflowMessage`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:135 - *Anteckningar*

> Samlingselement för löpande anteckningar förda under arbetsflödets gång.

> **XML-element:** `svk:workflowNotes`<br/>

---

#### ERMS-SVK:136 - *Anteckning*

> Enskild anteckning

> **XML-element:** `svk:workflowNote`<br/>

---

#### ERMS-SVK:137 - *Text*

> Anteckningens lydelse.

> Obligatoriskt om *Anteckning* används.

> **XML-element:** `svk:workflowNoteText`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:138 - *Datum för anteckning*

> Datum då anteckningen skapades.

> Obligatoriskt om *Anteckning* används.
> 
> Se avsnittet [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum).
> 
> Attributet `dateType` måste ha värdet "created".

> **XML-element:** `dates/date/@dateType="created"`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:139 - *Skickad från*

> Den person som har skapat anteckningen (och skickat den till någon annan).

> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet ”sender”.

> **XML-element:** `svk:agents/agent/@agentType="sender"`<br/>

---

#### ERMS-SVK:140 - *Skickad till*

> Den person som anteckningen har skickats till.

> Se avsnittet[3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet ”receiver”.

> **XML-element:** `svk:agents/agent/@agentType="receiver"`<br/>

---

#### ERMS-SVK:141 - *Arbetsflödesmottagare*

> Samlingselement för de personer som ingår i arbetsflödet och som t.ex. ska godkänna ett dokument.

> Obligatoriskt.

> **XML-element:** `svk:workflowRecipients`<br/>

---

#### ERMS-SVK:142 - *Mottagare*

> Personer som ingår i arbetsflödet.

> Obligatoriskt.

> **XML-element:** `svk:workflowRecipient`<br/>

---

#### ERMS-SVK:143 - *Enskild mottagare*

> Uppgifter om en enskild person i arbetsflödet.

> Obligatoriskt.
> 
> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet ”recipient”.

> **XML-element:** `svk:agents/agent/@agentype="recipient"`<br/>

---

#### ERMS-SVK:144 - *Status från mottagare*

> Flödets status hos den enskilde mottagaren.

> Obligatoriskt. Värdet väljs från [Värdelista 20](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-20---arbetsfl%C3%B6des-status).

> **XML-element:** `svk:recipientStatus`<br/>
> **Datatyp:** token

---

#### ERMS-SVK:145 - *Slutfört datum*

> Datum då den enskilda mottagaren har slutfört sin del i arbetsflödet.

> Obligatoriskt.
>
> Se avsnittet [3.2.2. Datum](ERMS-SVK-ARENDE.md#322-datum).
> 
> Attributet `dateType` måste ha värdet "finished".

> **XML-element:** `dates/date/@dateType="finished"`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:146 - *Slutfört av*

> Den person som slutfört sin del i arbetsflödet (i regel samma person som är mottagare).

> Obligatoriskt.
> 
> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet ”other” och attributet `otherAgentType` måste
> ha värdet *closing_person*.

> **XML-element:** `svk:agents/agent/@agentType="other" @otherAgentType="executor"`<br/>

---

#### ERMS-SVK:147 - *På uppdrag av*

> Om den person som slutfört sin del i arbetsflödet, har gjort det på
> uppdrag av någon annan, anges denna person här.

> Se avsnittet [3.2.1. Aktörer](ERMS-SVK-ARENDE.md#321-aktörer).
> 
> Attributet `agentType` måste ha värdet ”other” och attributet `otherAgentType` måste
> ha värdet *delegator*.

> **XML-element:** `svk:agents/agent/@agentType="other" @otherAgentType="delegator"`<br/>

---

#### ERMS-SVK:148 - *Mottagarkommentar*

> Kommentar som mottagaren kan lämna i anslutning till sin del i arbetsflödet.

> **XML-element:** `svk:reciepientComment`<br/>
> **Datatyp:** string

---

#### Exempel 28 – Arbetsflöden

```xml
<svk:ermsSvkRecord>
    <svk:workflows>
        <svk:workflow typeOfWorkflow="approval">
            <svk:workflowName>Godkännande</svk:workflowName>
            <svk:workflowStatus>approved</svk:workflowStatus>
            <svk:priority>normal</svk:priority>
            <svk:agents>
                <agent agentType="creator">
                    <name>Bo Mattsson</name>    
                </agent>
            </svk:agents>
            <dates>
                <date dateType="created">2022-01-14T00:00:00</date>
            </dates>
            <svk:workflowMessage>Översändes för godkännande.</svk:workflowMessage>
            <svk:workflowNotes>
                <svk:workflowNote>
                    <svk:workflowNoteText>Nu är det bråttom!</svk:workflowNoteText>
                    <dates>
                        <date dateType="created">2022-02-28T00:00:00</date>
                    </dates>
                    <svk:agents>
                        <agent agentType="sender">Bo Mattsson</agent>
                        <agent agentType="receiver">Patrik Andersson</agent>
                    </svk:agents>
                </svk:workflowNote>
            </svk:workflowNotes>
            <svk:workflowRecipients>
                <svk:workflowRecipient>
                    <svk:agents>
                        <agent agentType="recipient">
                            <name>Patrik Andersson</name>
                        </agent>
                        <agent agentType="other" otherAgentType="executor">
                            <name>Patrik Andersson</name>
                            <idNumber type="username">knet\patand</idNumber>
                        </agent>
                        <agent agentType="other" otherAgentType="delegator">
                            <name>Gudrun Andersson</name>
                        </agent>
                    </svk:agents>
                    <dates>
                        <date dateType="finished">2022-03-01T00:00:00</date>
                    </dates>
                    <svk:recipientStatus>approved</svk:recipientStatus>
                    <svk:recipientComment>Det ser bra ut! Jag godkänner.</svk:recipientComment>
                </svk:workflowRecipient>
            </svk:workflowRecipients>
        </svk:workflow>
    </svk:workflows>
</svk:ermsSvkRecord>
```

---

#### ERMS-SVK:149 - *Bifogad fil*

> Uppgifter om fil som är kopplad till den registrerade handlingen.

> Elementet kan upprepas.
> 
> Se [Elementlista 8](ERMS-SVK-ARENDE.md#elementlista-8-bifogad-fil).

> **XML-element:** `svk:ermsSvkRecord/svk:svkAppendix`<br/>

---

#### *Ändringslogg*

> se [ERMS-SVK:40](ERMS-SVK-ARENDE.md#erms-svk40---ändringslogg).

---

## 3.5. Information om bifogade filer

I ERMS används för bifogade filer elementet record/additionalInformation/appendix.
I Svenska kyrkans anpassning av ERMS används i stället tilläggselementet
`record/additionalInformation/additionalXMLData/ermsSvkArende/ermsSvkRecord/svkAppendix`.

---

### Elementlista 8. Bifogad fil

---

#### ERMS-SVK:150 - *Bifogad fil*

> Samlingselement för uppgifter om en fil som är kopplad till en registrerad handling.

> Elementet kan upprepas.

> **XML-element:** `svk:svkAppendix`<br/>

---

#### ERMS-SVK:151 - *Appendix*

> Samlingselement för den information om filen som följer ERMS-standard.

> **XML-element:** `appendix`<br/>

---

#### ERMS-SVK:152 - *Gallringsbar*

> Med gallringsbar avses här att den bifogade filen kan gallras innan handlingen i sig gallras.

> Det kan gälla t.ex. filer som bevaras i produktionsformat, om det också finns en
> motsvarande fil i bevarandeformat.
>
> Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som motsvarar false).

> **XML-element:** `appendix/@disposable`<br/>
> **Datatyp:** boolean

---

#### ERMS-SVK:153 - *Namn*

> Filens namn.

> Obligatoriskt.

> **XML-element:** `appendix/@name`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:154 - *Beskrivning*

> Beskrivning av filen.

> **XML-element:** `appendix/@description`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:155 - *Filformat*

> Filens format.

> Obligatoriskt.
> 
> Anges i form av filnamnsändelse (max fyra tecken) utan punkt och med små bokstäver.
>
> Exempel: pdf, png, txt

> **XML-element:** `appendix/@fileFormat`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:156 - *Originalfilformat*

> Om filen är konverterad till arkivformat, anges här originalfilens format.
 
> Anges i form av filnamnsändelse (max fyra tecken) utan punkt och med små bokstäver.
>
> Exempel: docx, xlsx, msg

> **XML-element:** `appendix/@originalFileFormat`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:157 - *Sökväg*

> Relativ sökväg till filens placering i arkivpaketet.
 
> Obligatoriskt.
> 
> Exempel: files/document_01.pdf

> **XML-element:** `appendix/@path`<br/>
> **Datatyp:** string

---

#### ERMS-SVK:158 - *Uppgift om e-signatur*

> Anger om det har funnits en e-signatur som har gallrats före leverans.
 
> Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som motsvarar false).

> **XML-element:** `appendix/@eSignatureHasExisted`<br/>
> **Datatyp:** boolean

---

#### ERMS-SVK:159 - *E-signatur*

> Samlingselement för information om befintlig e-signatur.
 
> **XML-element:** `eSignature`<br/>

---

#### ERMS-SVK:160 - *E-signatur finns*

> Anger om det finns en e-signatur.

> Obligatoriskt om elementet *E-signatur* används.
 
> Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som motsvarar false).

> **XML-element:** `eSignature/@present`<br/>
> **Datatyp:** boolean

---

#### ERMS-SVK:161 - *Verifikationsdatum*

> Datum och tid då e-signaturen senast verifierades.

> **XML-element:** `eSignature/@dateSignatureIsVerified`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:162 - *Signatur*

****

> Element för filens e-signatur enligt dess eget XML-schema.

> Leveransöverenskommelsen ska innehålla information om hur
> e-signaturer lagras och om vilket schema som används.

> **XML-element:** `signature`<br/>

---

#### ERMS-SVK:163 - *Filinformation*

> Samlingselement för utökad information om filen.
> 
> (Tillägg till ERMS-standard)

> **XML-element:** `svk:fileInfo`<br/>

---

#### ERMS-SVK:164 - *Skapad*

> Datum och tid då filen skapades (systeminformation).
> 
> Attributet `dateType` måste ha värdet "created".

> **XML-element:** `dates/date/@dateType="created"`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:165 - *Senast ändrad*

> Datum och tid då filen senast ändrades (systeminformation).
> 
> Attributet `dateType` måste ha värdet "modified".

> **XML-element:** `dates/date/@dateType="modified"`<br/>
> **Datatyp:** dateTime

---

#### ERMS-SVK:166 - *Versionsnummer*

> Om flera versioner av samma fil är kopplade till handlingen, anges versionsnummer här.
> 
> Versionsnumreringen kan enbart anges med heltal.

> **XML-element:** `svk:versionNumber`<br/>
> **Datatyp:** integer

---

#### ERMS-SVK:167 - *Variant*

> Om flera varianter av samma version är kopplade till handlingen, anges unik variant här.

> Värdet väljs från [Värdelista 17](ERMS-SVK-ARENDE-vardelistor.md#erms-svk-arende-v%C3%A4rdelista-17---variant).

> **XML-element:** `svk:variant`<br/>
> **Datatyp:** token

---

#### Exempel 29 – svkAppendix

```xml
<svk:svkAppendix>
	<svk:appendix name="ansökan" path="filer/ansökan.pdf" fileFormat="pdf"/>
	<svk:fileInfo>
		<svk:dateCreated>2010-02-01T00:00:00</svk:dateCreated>
		<svk:dateLastEdited>2010-02-01T00:00:00</svk:dateLastEdited>
		<svk:versionNumber>1</svk:versionNumber>
		<svk:variant>preservation</svk:variant>
    </svk:fileInfo>
</svk:svkAppendix>
```

---

#### *Ändringslogg*

> Se [ERMS-SVK:40](ERMS-SVK-ARENDE.md#erms-svk40---ändringslogg).

---

