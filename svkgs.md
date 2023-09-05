Inledning

Svenska kyrkans gemensamma specifikationer för elektronisk arkivering
beskriver vilken in­formation som ska ingå vid leverans till Svenska
kyrkans gemensamma e-arkiv och hur denna information ska struktureras.
Leveranser till e-arkivet delas in i informationstyper. Exempel på
informationstyper kan vara ärendeakter med handlingar, ekonomisk
redovisning, löneredovis­ning, personalakter, information om gravrätter,
projekthandlingar, bilder och så vidare. Varje sådan informationstyp
behöver sin egen specifikation.

Beteckningen gemensamma specifikationer anger att specifikationerna
gäller alla leveranser till e-arkivet oavsett vem det är som levererar
informationen och oavsett vilket IT-system som leve­ranser kommer ifrån.
Genom att informationen arkiveras på detta standardiserade sätt
under­lättas det långsiktiga bevarande och möjligheten att återsöka den
arkiverade informationen. Standardformatet kan utöver e-arkivering även
användas vid migrering av information mellan andra IT-system.

Svenska kyrkans gemensamma specifikationer är i första hand anpassningar
av de specifika­tioner som förvaltas av the Digital Information LifeCycle
Interoperability Standards Board (DILCIS Board). De kan också vara
anpassningar av de Förvaltningsgemensamma specifikationer (FGS) som har
upprättats av Riksarkivet. Anledningen till att specifikationerna främst
grundar sig på DILCIS Board är att Riksarkivet har upphört med sin
förvaltning av FGS:er och hänvisar till de gemensamma specifikationerna
på EU-nivå. Specifikationerna kan också utgå ifrån andra stan­darder, om
det finns några som är särskilt lämpliga för informationstypen i fråga.

DILCIS Board: <https://dilcis.eu>

Riksarkivet FGS: <https://riksarkivet.se/fgs-earkiv>

Arkivpaket

Leverans av information till e-arkivet sker i form av arkivpaket. Ett
paket är en mappstruktur med filer. Paketet innehåller den levererade
informationen, arkivobjektet, men också metadata som beskriver
informationen och den levererande arkivbildaren.

Specifikationerna i det här dokumentet beskriver arkivobjektet, det vill
säga den information som ska arkiveras. Det utgör endast en del av hela
arkivpaketet.

Arkivpaketet i sin helhet utformas i enlighet med Riksarkivets
speccifikation [FGS Paketstruktur
1.2](https://riksarkivet.se/Media/pdf-filer/doi-t/FGS_Paketstruktur_RAFGS1V1_2.pdf).

Specifikationer för ärendehandlingar

SvKGS Ärendehandlingar avser arkivering av ärendeakter med tillhörande
handlingar. Specifika­tionerna är främst avsedda för arkivering av
information från diarieföringssystem som t.ex. Tietoevrys Public 360°,
Vitecs Acta och FAS samt Eniacs Aveny.

Registrerad information om ett ärende och dess ingående handlingar
bevaras i ett XML-doku­ment som regleras av specifikationerna genom
användandet av scheman (XSD och Schematron). Även bifogade filer (i
godkänt arkivformat) kan arkiveras.

SvKGS Ärendehandlingar följer helt och hållet Specification for the
E-ARK Content Information Type Specification for Electronic Records
Management Systems (ERMS) version 2.1.0.

ERMS tillåter att man gör anpassningar för den egna organisationens
behov. För använding i Svenska kyrkan har ett antal anpassningar gjorts.
Dessa redovisas nedan i dokumentet.

XML-dokumentet

Det XML-dokument som innehåller information om en ärendeakt och de
ingående handlingarna definieras i ett XML-schema. Se avsnittet
[Scheman](#_Scheman) nedan. Detta är XML-dokumentets grundläg­gande
uppbyggnad:

![En bild som visar svart, mörker Automatiskt genererad
beskrivning](media/image1.png){width="2.5520833333333335in"
height="2.482082239720035in"}

Figur . Grundläggande struktur i ett XML-dokument

Elementet erms är dokumentets rot-element. Elementet control innehåller
underelement med in­formation om själva XML-dokumentet (se [Tabell
1](#_Tabell_1._Kontroll)). Elementet aggregations rymmer underele­ment av
typen aggregation, vilket i det här fallet betyder ärendeakt (se [Tabell
2](#_Tabell_2._Ärendeakter) och [Tabell 3](#_Tabell_3._Svenska)). No­tera
att det i SvKGS Ärendehandlingar endast får finnas en aggregation i
varje XML-dokument. Elementet aggregation kan innehålla flera element av
typen record, alltså ärendehandlingar (se [Tabell
4](#_Tabell_4._Ärendehandlingar) och [Tabell 5](#_Tabell_5._Svenska)).
Varje record kan innehålla elementet appendix som är en bifogad fil till
den registrerade handlingen (se [Tabell 6](#_Tabell_6._Bifogade)).
Notera att det tillagda elementet svkAppendix används i SvKGS
Ärendehandlingar i stället för elementet appendix.

Alla XML-filer måste ha teckenkodning UTF-8

Om anpassningarna

Ett XML-dokument som är utformat i enlighet SvKGS Ärendehandlingar är
alltid ett giltigt ERMS-dokument. Däremot är ett ERMS-dokument inte
nödvändigtvis överensstämmande med SvKGS Ärendehandlingar, eftersom
anpassningar har gjorts.

Anpassningarna kan vara av två slag:

Specificerande definitioner av i ERMS befintliga element

Tillagda element som inte finns i ERMS

I tabellerna nedan finns de element som bör eller måste finnas i ett
XML-dokument enligt SvKGS Ärendehandlingar. Tabellerna följer strukturen
i XML-dokumentet:

![En bild som visar text, skärmbild, Teckensnitt, linje Automatiskt
genererad beskrivning](media/image2.png){width="2.7965594925634294in"
height="3.6805555555555554in"}

Figur . Översikt av tabeller med dataelement.

Element i ERMS som inte är obligatoriska och som har bedömts sakna nytta
för Svenska kyrkans behov ingår inte i SvKGS Ärendehandlingar. Målet har
varit att använda så få element som möjligt.

Mer information om anpassningarna finns i stycket [Scheman](#_Scheman)
nedan.

Värdelistor

I många fall är det värde som får anges i ett dataelement begränsat till
värden som finns i en speci­ficerad värdelista. De värdelistor som ingår
i SvKGS Ärendehandlingar finns [nedan i detta dokument](#_Värdelistor).
Värdelistorna i SvKGS Ärendehandlingar kan innehålla värden från ERMS
eller vara tillagda värden och är därför också en del av Svenska kyrkans
anpassning av ERMS. Utgångspunkten har varit att så långt som möjligt
använda värden från ERMS.

[]{#_Scheman .anchor}Scheman

XML-scheman och Schematron används i ERMS för att på ett mer tekniskt
sätt definiera hur da­taelementen ska utformas. Scheman kan också
användas för att validera ett XML-dokument så att man kan avgöra om det
följer specifikationen.

I ERMS ingår schemana
[ERMS.xsd](https://citserms.dilcis.eu/schema/ERMS.xsd) och
[ERMS.sch](https://citserms.dilcis.eu/schema/erms.sch).

I SvKGS Ärendehandlingar används schemana
[ERMS-SVK-ARENDE.xsd](#_XML-schema_ERMS-SVK-ARENDE.xsd),
[ERMS-SVK-ARENDEN-ele­ment.xsd](#_XML-schema:_ERMS-SVK-ARENDE-element)
och [ERMS-SVK-ARENDEN.sch](#_Schematron:_ERMS-SVK-ARENDE.sch).

ERMS-SVK-ARENDE.xsd är identisk med ERMS.xsd men har en egen namnrymd
för att göra det möjligt att importera och använda andra scheman i
kombination med detta. I elementet [addit­ionalXMLData]{.mark} tillåter
ERMS att man använder element från en annan namnrymd, och detta
ut­nyttjas i ERMS-SVK-ARENDE.xsd där element från
ERMS-SVK-ARENDEN-element.xsd import­eras.

ERMS-SVK-ARENDE.sch innehåller de regler som finns i ERMS.sch samt de
regler som är Svenska kyrkans anpassningar av element som ingår i ERMS.

Anpassningar som består av tillagda element regleras alltså i
ERMS-SVK-ARENDEN-element.xsd, och anpassningar som närmare definierar
befintliga element eller värdelistor regleras i ERMS-SVK-ARENDE.sch

De frivilliga element i ERMS som formellt inte ingår i SvKGS
Ärendehandlingar har inte tagits bort i ERMS-SVK-ARENDE.xsd, eftersom
det har varit önskvärt att detta schema ska vara överens­stämmande med
ERMS.xsd.

En särskild anmärkning om elementet [appendix]{.mark} i
ERMS-SVK-ARENDE.xsd behöver göras. Ef­tersom det har funnits behov av att
utöka detta element med flera underelement, och då det inte finns något
element [additionalXMLData]{.mark} här, används inte [appendix]{.mark}
utan i stället ett eget element [svkAppendix]{.mark} som definieras i
ERMS-SVK-ARENDEN-element.xsd.

Elementet [appendix]{.mark} finns fortfarande kvar i
ERMS-SVK-ARENDE.xsd, men användandet av det förbjuds genom en regel i
ERMS-SVK-ARENDE.sch.

För att validera ett XML-dokument och avgöra om det följer
specifikationerna i SvKGS Ärende­handlingar, måste man alltså använda
både ERMS-SVK-ARENDE.xsd (som importerar och använ­der även
ERMS-SVK-ARENDE-element.xsd) och ERMS-SVK-ARENDE.sch. Ett XML-dokument
som följer specifikationerna validerar också mot ERMS.xsd och ERMS.sch.

Datatyper

Värden som anges i dataelementen måste vara av de datatyper som
definieras i XML-schemana. Datatyper som kan förekomma är:

[string](https://www.w3.org/TR/xmlschema-2/#string)

[token](https://www.w3.org/TR/xmlschema-2/#token)

[integer](https://www.w3.org/TR/xmlschema-2/#integer)

[decimal](https://www.w3.org/TR/xmlschema-2/#decimal)

[dateTime](https://www.w3.org/TR/xmlschema-2/#dateTime)

[boolean](https://www.w3.org/TR/xmlschema-2/#boolean)

För att ange datum används alltid datatypen dateTime, vilket betyder att
både datum och klocklag ned till sekundnivå ska anges i
[UTC-format](https://sv.wikipedia.org/wiki/Koordinerad_universell_tid)
enligt [ISO 8601](https://sv.wikipedia.org/wiki/ISO_8601) (med
bindestreck och kolon). Om klockslag saknas används noll-tecken. Tidszon
anges i regel inte och förutsätts då vara Europe/Stockholm.

Exempel på datum och tid: 2018-03-04T15:15:22. Enbart datum:
2020-09-17T00:00:00.

Vid angivande av tal (integer och decimal) används inte
tusentalsavgränsare.

Vid angivande av decimal används punkt som decimalavgränsare.

Råd om användandet av SvKGS Ärendehandlingar

I tabellerna med dataelement nedan har varje element en
identifieringskod (t.ex. erms-svk:1). Även elementets motsvarande kod i
ERMS anges, om det inte är ett tillagt element.

Om ett element är obligatoriskt, anges detta särskilt. I annat fall är
det frivilligt att använda ele­mentet. Element kan få förekomma en enda
gång eller upprepade gånger i ett XML-dokument. Om ett element får
upprepas, anges detta särskilt. I annat fall får elementet endast
förekomma en gång.

I tabellerna anges också motsvarande XML-elements namn och vilken
datatyp som ska användas.

Informationen i det levererande IT-systemet måste mappas mot
specifiaktionens dataelement och sedan transfomeras till ett XML-format
som kan valideras av de scheman som ingår i speci­fikationen. Alla
XML-filer måste ha teckenkodning UTF-8.

En XML-fil får enbart innehålla ett enda ärende, men leveransen kan
bestå av flera filer. Filerna samlas i en mapp, och om leveransen
innehåller dokumentfiler samlas dessa i en undermapp. Varje sådant
lerveranspaket får bara innehålla ärenden från en och samma arkivbildare
och ett och samma diarium.

![](media/image3.png){width="1.815631014873141in"
height="1.4765255905511812in"}

Figur . Mappstruktur för ärendeleverans. Namn på mappar och filer är
enbart exempel.

Innan en leverans till e-arkivet görs, måste den levererande parten och
e-arkivets förvaltnings­organisation tillsammans upprätta en
leveransöverenskommelse där villkor och förutsättningar för leveransen
specificeras. Se mer om leveransförfarandet i Arkivhandboken, kapitel 8.

Dataelement med exempel

Övergripande information om XML-dokumentet

Kontroll är ett obligatoriskt element som beskriver själva XML-filen och
vad den innehåller. Den underlättare förståelsen av informationen, om
XML-filen skulle seprareras från arkivpaktetet.

[]{#_Tabell_1._Kontroll .anchor}Tabell 1. Kontroll

+------------+-------------+------------------------------------------+
| ID         | Element     |                                          |
+============+=============+==========================================+
| erms-svk   | Sc          |                                          |
|            | hemaversion |                                          |
+------------+-------------+------------------------------------------+
| erms-svk:1 | Id          | Identifierar ERMS-dokumentet             |
|            | entifikator |                                          |
| (ERMS1)    |             | Obligatoriskt. Elementet får upprepas.   |
|            |             |                                          |
|            |             | Två identifikatorer ska användas:        |
|            |             | arkivbildarens namn och ärendets nummer. |
|            |             | Se exempel nedan.                        |
|            |             |                                          |
|            |             | XML-element: identification\             |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| erms-svk:2 | Typ av      | Beskrivning av identifikatorn.           |
|            | id          |                                          |
| (ERMS2)    | entifikator | Obligatoriskt. Värdet välj från          |
|            |             | [SVK-värdelista                          |
|            |             | 1](#_SVK-VÄRDELISTA_1_–).                |
|            |             |                                          |
|            |             | XML-element:                             |
|            |             | identification/@identificationType\      |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| Exempel 1  |             |                                          |
| --         |             |                                          |
| Ide        |             |                                          |
| ntifikator |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| <control\> |             |                                          |
|            |             |                                          |
| \<iden     |             |                                          |
| tification |             |                                          |
| id         |             |                                          |
| entificati |             |                                          |
| onType=\"a |             |                                          |
| rkivbildar |             |                                          |
| e\"\>Sunne |             |                                          |
| pastora    |             |                                          |
| t\</identi |             |                                          |
| fication\> |             |                                          |
|            |             |                                          |
| \<iden     |             |                                          |
| tification |             |                                          |
| identifi   |             |                                          |
| cationType |             |                                          |
| =\"ärenden |             |                                          |
| ummer\"\>P |             |                                          |
| 2019-025   |             |                                          |
| 4\</identi |             |                                          |
| fication\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| /control\> |             |                                          |
+------------+-------------+------------------------------------------+
| erms-svk:3 | Information | Informationsklass som baseras på         |
|            | s-klassning | säkerhetsklassificering                  |
| (ERMS3)    |             |                                          |
|            |             | XML-element: informationClass\           |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| erms-svk:4 | Kl          | Den klassificeringsstruktur som har      |
|            | assificerin | använts vid klassificering av det        |
| (ERMS4,    | gs-struktur | aktuella ärendet.                        |
| ERMS5,     |             |                                          |
| ERMS6)     |             | Obligatoriskt. Värdet väljs från         |
|            |             | [SVK-värdelista                          |
|            |             | 2](#_SVK-VÄRDELISTA_2_–).                |
|            |             |                                          |
|            |             | XML-element: classificationSchema/\      |
|            |             | tex                                      |
|            |             | tualDescriptionOfClassificationSchema/p\ |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| Exempel 2  |             |                                          |
| --         |             |                                          |
| Kla        |             |                                          |
| ssificerin |             |                                          |
| gsstruktur |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| <control\> |             |                                          |
|            |             |                                          |
| \<cl       |             |                                          |
| assificati |             |                                          |
| onSchema\> |             |                                          |
|            |             |                                          |
| \<te       |             |                                          |
| xtualDescr |             |                                          |
| iptionOfCl |             |                                          |
| assificati |             |                                          |
| onSchema\> |             |                                          |
|            |             |                                          |
| \<p\       |             |                                          |
| >KlaSL2016 |             |                                          |
| _1.0\</p\> |             |                                          |
|            |             |                                          |
| \</te      |             |                                          |
| xtualDescr |             |                                          |
| iptionOfCl |             |                                          |
| assificati |             |                                          |
| onSchema\> |             |                                          |
|            |             |                                          |
| \</cl      |             |                                          |
| assificati |             |                                          |
| onSchema\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| /control\> |             |                                          |
+------------+-------------+------------------------------------------+
| erms-svk:5 | Säkerhe     | Säkerhetsklass.                          |
|            | ts­klassning |                                          |
| (ERMS8)    |             | XML-element: securityClass\              |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| erms-svk:6 | Underhåll   | Samlingselement för                      |
|            |             | underhållsinformation som används för    |
| (ERMS10)   |             | att beskriva XML-dokumentets tillkomst   |
|            |             | och eventuella ändringar.                |
|            |             |                                          |
|            |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: maintenanceInformation      |
+------------+-------------+------------------------------------------+
| erms-svk:7 | Status      | XML-dokumentets status.                  |
|            |             |                                          |
| (ERMS11)   |             | Obligatoriskt. Värdet väljs från         |
|            |             | värdelista [SVK-värdelista               |
|            |             | 3](#_SVK-VÄRDELISTA_3_–).                |
|            |             |                                          |
|            |             | För ett nyskapat dokument är värdet      |
|            |             | alltid "new".                            |
|            |             |                                          |
|            |             | XML-element: maintenanceStatus/@value\   |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| erms-svk:8 | Skapare     | Samlingselement med beskrivning av den   |
|            |             | instans som har skapat XML-dokumentet.   |
| (ERMS12)   |             |                                          |
|            |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: maintenanceAgency           |
+------------+-------------+------------------------------------------+
| erms-svk:9 | Skapare ID  | Identifierande kod för den instans som   |
|            |             | har skapat XML-dokumentet.               |
| (ERMS13)   |             |                                          |
|            |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: agencyCode\                 |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Typ av ID   | Beskriver vilken typ av kod som har      |
| rms-svk:10 |             | använts för att identifiera skaparen av  |
|            |             | XML-dokumentet.                          |
| (ERMS14)   |             |                                          |
|            |             | Obligatoriskt. Värdet väljs från         |
|            |             | värdelista [SVK-värdelista               |
|            |             | 4](#_SVK-VÄRDELISTA_4_–).                |
|            |             |                                          |
|            |             | XML-element: agencyCode/@type\           |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Alternativt | Ytterligare en identifierande kod som    |
| rms-svk:11 | ID          | kan användas vid behov.                  |
|            |             |                                          |
| (ERMS15)   |             | XML-element: otherAgencyCode\            |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Typ av      | Samma som ovan (erms-svk:10)             |
| rms-svk:12 | alternativt |                                          |
|            | ID          | Obligatoriskt om Alternativt ID används. |
| (ERMS16)   |             |                                          |
|            |             | XML-element: otherAgencyCode/@type\      |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Skapare     | Namn på den instans som har skapat       |
| rms-svk:13 | Namn        | XML-dokumentet.                          |
|            |             |                                          |
| (ERMS17)   |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: agencyName\                 |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Underhå     | Samlingselement för dokumentets          |
| rms-svk:14 | lls­historia | underhållshistoria.                      |
|            |             |                                          |
| (ERMS19)   |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: maintenanceHistory          |
+------------+-------------+------------------------------------------+
| e          | Underhå     | En händelse i dokumentets                |
| rms-svk:15 | lls­händelse | underhållshistoria.                      |
|            |             |                                          |
| (ERMS20)   |             | Obligatoriskt. Elementet kan upprepas.   |
|            |             |                                          |
|            |             | När XML-dokumentet skapas, får det en    |
|            |             | Underhållshändelse av typen "created".   |
|            |             |                                          |
|            |             | XML-element: maintenanceEvent            |
+------------+-------------+------------------------------------------+
| e          | Typ av      | Typ av underhållshändelse.               |
| rms-svk:16 | händelse    |                                          |
|            |             | Obligatoriskt. Värdet väljs från         |
| (ERMS21)   |             | värdelistan [SVK-värdelista              |
|            |             | 5](#_SVK-VÄRDELISTA_5_–).                |
|            |             |                                          |
|            |             | XML-element: eventType/@value\           |
|            |             | Datatyp: token                           |
+------------+-------------+------------------------------------------+
| e          | Datum för   | Datum då underhållshändelsen inträffade. |
| rms-svk:17 | händelse    |                                          |
|            |             | Obligatoriskt.                           |
| (ERMS22)   |             |                                          |
|            |             | XML-element: eventDateTime\              |
|            |             | Datatyp: dateTime                        |
+------------+-------------+------------------------------------------+
| e          | Utförare    | Den agent som har utfört handlingen.     |
| rms-svk:18 |             |                                          |
|            |             | Obligatoriskt.                           |
| (ERMS23)   |             |                                          |
|            |             | XML-element: agent                       |
+------------+-------------+------------------------------------------+
| e          | Typ av      | Anger vilken egenskap utföraren har i    |
| rms-svk:19 | utförare    | förhållande till den utförda handlingen. |
|            |             |                                          |
| (ERMS93)   |             | Värdet väljs från värdelistan            |
|            |             | [SVK-värdelista                          |
|            |             | 6](#_SVK-VÄRDELISTA_6_–).                |
|            |             |                                          |
|            |             | XML-element: agent/@agentType\           |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | Namn        | Namn på den person eller organisation    |
| rms-svk:20 |             | som har utfört handlingen.               |
|            |             |                                          |
| (ERMS95)   |             | Obligatoriskt.                           |
|            |             |                                          |
|            |             | XML-element: agent/name\                 |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| e          | O           | Organisationstillhörighet.               |
| rms-svk:21 | rganisation |                                          |
|            |             | Obligatoriskt om det är en person som är |
| (ERMS99)   |             | agent.                                   |
|            |             |                                          |
|            |             | XML-element: agent/organisation\         |
|            |             | Datatyp: string                          |
+------------+-------------+------------------------------------------+
| Exempel 3  |             |                                          |
| --         |             |                                          |
| Underhåll  |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| <control\> |             |                                          |
|            |             |                                          |
| \<main     |             |                                          |
| tenanceInf |             |                                          |
| ormation\> |             |                                          |
|            |             |                                          |
| \<mainten  |             |                                          |
| anceStatus |             |                                          |
| value=     |             |                                          |
| \"new\"/\> |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| <maintenan |             |                                          |
| ceAgency\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| agencyCode |             |                                          |
| type=      |             |                                          |
| \"organisa |             |                                          |
| tionsnumme |             |                                          |
| r\"\>12345 |             |                                          |
| 67876\</ag |             |                                          |
| encyCode\> |             |                                          |
|            |             |                                          |
| \<a        |             |                                          |
| gencyName\ |             |                                          |
| >Kyrkostyr |             |                                          |
| elsen\</ag |             |                                          |
| encyName\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| /maintenan |             |                                          |
| ceAgency\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| maintenanc |             |                                          |
| eHistory\> |             |                                          |
|            |             |                                          |
| \<maintena |             |                                          |
| nceEvent\> |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| <eventType |             |                                          |
| value=\"cr |             |                                          |
| eated\"/\> |             |                                          |
|            |             |                                          |
| \<ev       |             |                                          |
| entDateTim |             |                                          |
| e\>2001-12 |             |                                          |
| -17T09:30: |             |                                          |
| 47\</event |             |                                          |
| DateTime\> |             |                                          |
|            |             |                                          |
| \<agent    |             |                                          |
| agent      |             |                                          |
| Type=\"del |             |                                          |
| iverer\"\> |             |                                          |
|            |             |                                          |
| \<na       |             |                                          |
| me\>Public |             |                                          |
| 36         |             |                                          |
| 0\</name\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| organisati |             |                                          |
| on\>Tietoe |             |                                          |
| vry\</orga |             |                                          |
| nisation\> |             |                                          |
|            |             |                                          |
| \</agent\> |             |                                          |
|            |             |                                          |
| \          |             |                                          |
| </maintena |             |                                          |
| nceEvent\> |             |                                          |
|            |             |                                          |
| \</        |             |                                          |
| maintenanc |             |                                          |
| eHistory\> |             |                                          |
|            |             |                                          |
| \</main    |             |                                          |
| tenanceInf |             |                                          |
| ormation\> |             |                                          |
|            |             |                                          |
| \<         |             |                                          |
| /control\> |             |                                          |
+------------+-------------+------------------------------------------+

Information om ärendeakter

[]{#_Tabell_2._Ärendeakter .anchor}Tabell 2. Ärendeakter

+------------+------------+--------------------------------------------+
| ID         | Element    |                                            |
+============+============+============================================+
| e          | Ärendeakt  | Samlingsobjekt för ärendeakten med         |
| rms-svk:22 |            | ingående dokument och filer.               |
|            |            |                                            |
| (ERMS198)  |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Varje ärendeakt ska dokumenteras i en      |
|            |            | XML-fil, och ingen XML-fil får innehålla   |
|            |            | mer än en ärendeakt.                       |
|            |            |                                            |
|            |            | XML-element: aggregation                   |
+------------+------------+--------------------------------------------+
| e          | Ide        | Identifikator för ärendeakten i form av    |
| rms-svk:23 | ntifikator | UUID. Identifikatorn anges automatiskt     |
|            |            | redan i det levererande systemet eller vid |
| (ERMS199)  |            | överföring till e-arkivet.                 |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | XML-element:                               |
|            |            | aggregation/@systemIdentifier\             |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Typ av     | Typ av aggregation, vilket i den här       |
| rms-svk:24 | a          | specifikationen alltid är "caseFile", det  |
|            | ggre­gation | vill säga "ärendeakt".                     |
| (ERMS200)  |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | XML-element:                               |
|            |            | aggregation/@aggregationType="caseFile"\   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 4  |            |                                            |
| --         |            |                                            |
| Ärendeakt  |            |                                            |
|            |            |                                            |
| \<a        |            |                                            |
| ggregation |            |                                            |
| systemI    |            |                                            |
| dentifier= |            |                                            |
| \"3b9fbc5f |            |                                            |
| -3eaf-4521 |            |                                            |
| -9726-0f14 |            |                                            |
| 2feb04c3\" |            |                                            |
| aggregatio |            |                                            |
| nType=\"ca |            |                                            |
| seFile\"\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Är         | Ärendets officiella nummer,                |
| rms-svk:25 | ende­nummer | "diarienumret".                            |
|            |            |                                            |
| (ERMS218)  |            | Ärendenumret ska ha formatet \[diariekod\] |
|            |            | \[årtal\]-\[löpnummer\]. Diariekoden ska   |
|            |            | bestå av versaler. Löpnumret ska bestå av  |
|            |            | fyra siffror och fylls vid behov ut med    |
|            |            | nollor, t.ex. S 2019-0043.                 |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | XML-element: objectId\                     |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Intern     | Befintligt id i det levererande systemet   |
| rms-svk:26 | ide        |                                            |
|            | ntifi­kator | Om elementet Intern identifikator används, |
| (ERMS219)  |            | måste attributet extraIdType ha värdet     |
|            |            | "deliveringSystemId".                      |
|            |            |                                            |
|            |            | XML-element: extraId\                      |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 5  |            |                                            |
| --         |            |                                            |
| Är         |            |                                            |
| endenummer |            |                                            |
| och Intern |            |                                            |
| ide        |            |                                            |
| ntifikator |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<o        |            |                                            |
| bjectId\>F |            |                                            |
| 20         |            |                                            |
| 19-0032\</ |            |                                            |
| objectId\> |            |                                            |
|            |            |                                            |
| \<extraId  |            |                                            |
| ext        |            |                                            |
| raIdType=\ |            |                                            |
| "deliverin |            |                                            |
| gSystemId\ |            |                                            |
| "\>34565\< |            |                                            |
| /extraId\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | I          | Ärendets informationsklass.                |
| rms-svk:27 | nformation |                                            |
|            | s­klassning | XML-element: informationClass\             |
| (ERMS202)  |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Säkerhet   | Ärendets säkerhetsklass.                   |
| rms-svk:28 | s­klassning |                                            |
|            |            | XML-element: securityClass\                |
| (ERMS203)  |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Klas       | Namnet på den process i den officiella     |
| rms-svk:29 | sificering | klassificeringsstrukturen som har angivits |
|            |            | som klassificering av ärendet och de       |
| (ERMS208)  |            | ingående handlingarna.                     |
|            |            |                                            |
|            |            | XML-element: classification\               |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Klassifi   | Koden för den process som angivits under   |
| rms-svk:30 | ce­ringskod | Klassificering                             |
|            |            |                                            |
| (ERMS75)   |            | XML-element:                               |
|            |            | classification/@classificationCode\        |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 6  |            |                                            |
| --         |            |                                            |
| Klas       |            |                                            |
| sificering |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<clas     |            |                                            |
| sification |            |                                            |
| classifica |            |                                            |
| tionCode=\ |            |                                            |
| "2.7\"\>Ge |            |                                            |
| servic     |            |                                            |
| e\</classi |            |                                            |
| fication\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Nyckelord  | Samlingselement för enskilda nyckelord.    |
| rms-svk:31 |            |                                            |
|            |            | XML-element: keywords                      |
| (ERMS223)  |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Nyckelord  | Enskilt nyckelord.                         |
| rms-svk:32 |            |                                            |
|            |            | Elementet kan upprepas.                    |
| (ERMS224)  |            |                                            |
|            |            | XML-element: keyword\                      |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 7  |            |                                            |
| --         |            |                                            |
| Nyckelord  |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| keywords\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <keyword\> |            |                                            |
| församling |            |                                            |
| sordning\< |            |                                            |
| /keyword\> |            |                                            |
|            |            |                                            |
| \<k        |            |                                            |
| eyword\>ky |            |                                            |
| rkorådet\< |            |                                            |
| /keyword\> |            |                                            |
|            |            |                                            |
| \</        |            |                                            |
| keywords\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Är         | Ärendemening, ärendets titel.              |
| rms-svk:33 | endemening |                                            |
|            |            | Obligatoriskt.                             |
| (ERMS209)  |            |                                            |
|            |            | XML-element: title\                        |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Annan      | Används endast för Offentlig titel i       |
| rms-svk:34 | titel      | leveranser från Public 360°.               |
|            |            |                                            |
| (ERMS210)  |            | Om elementet Annan titel används måste     |
|            |            | attributet titleType ha värdet             |
|            |            | "publicTitle".                             |
|            |            |                                            |
|            |            | XML-element: otherTitle\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 8  |            |                                            |
| --         |            |                                            |
| Är         |            |                                            |
| endemening |            |                                            |
| och Annan  |            |                                            |
| titel      |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<title    |            |                                            |
| \>Ärendets |            |                                            |
| titel      |            |                                            |
| \</title\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| otherTitle |            |                                            |
| titleType  |            |                                            |
| =\"publicT |            |                                            |
| itle\"\>En |            |                                            |
| offentlig  |            |                                            |
| titel\</ot |            |                                            |
| herTitle\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Är         | Ärendets status.                           |
| rms-svk:35 | endestatus |                                            |
|            |            | Obligatoriskt. Värdet väljs från           |
| (ERMS239)  |            | värdelistan [SVK-värdelista                |
|            |            | 7](#_SVK-VÄRDELISTA_7_–).                  |
|            |            |                                            |
|            |            | Giltiga värden:"closed" (avslutat) eller   |
|            |            | "obliterated" (makulerat).                 |
|            |            |                                            |
|            |            | Exempel:                                   |
|            |            |                                            |
|            |            | \<aggregation\>                            |
|            |            |                                            |
|            |            | \<status                                   |
|            |            | []{.mark}value=\"[closed]{.mark}\"/\>      |
|            |            |                                            |
|            |            | \</aggregation\>                           |
|            |            |                                            |
|            |            | XML-element: status/@value\                |
|            |            | Datatype: string                           |
+------------+------------+--------------------------------------------+
| e          | Ären       | Referens till och/eller från annat ärende. |
| rms-svk:36 | dereferens |                                            |
|            |            | Om möjligt anges det andra ärendets        |
| (ERMS52,   |            | Ärendenummer enligt specifikationen i      |
| ERMS53)    |            | detta dokument, annars ärendenumret i      |
|            |            | annat format eller fritext.                |
|            |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Ärendereferens används, måste |
|            |            | attributet relationType ha värdet          |
|            |            | "reference".                               |
|            |            |                                            |
|            |            | XML-element: relation\                     |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 9  |            |                                            |
| --         |            |                                            |
| Ären       |            |                                            |
| dereferens |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<relation |            |                                            |
| relationT  |            |                                            |
| ype=\"refe |            |                                            |
| rence\"\>F |            |                                            |
| 20         |            |                                            |
| 19-0454\</ |            |                                            |
| relation\> |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Utökad     | Utökad XML-data är en del av Svenska       |
| rms-svk:37 | XML-data   | kyrkans anpassning av ERMS.                |
|            |            |                                            |
| (ERMS252,  |            | Se [Tabell 3](#_Tabell_3._Svenska).        |
|            |            |                                            |
| ERMS43)    |            | XML-element: additionalXMLData             |
+------------+------------+--------------------------------------------+
| e          | Sekretess  | Samlingselement för uppgift om sekretess.  |
| rms-svk:38 |            |                                            |
|            |            | Elementet kan upprepas.                    |
| (ERMS253,  |            |                                            |
| ERMS57)    |            | Om elementet Sekretess används måste       |
|            |            | attributet restrictionType ha värdet       |
|            |            | "confidential".                            |
|            |            |                                            |
|            |            | XML-element: restriction                   |
+------------+------------+--------------------------------------------+
| e          | F          | Fritext som beskriver sekretessen.         |
| rms-svk:39 | örklarande |                                            |
|            | text       | XML-element: explanatoryText\              |
| (ERMS58)   |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Lagrum     | Hänvisning till paragraf i kyrkoordningens |
| rms-svk:40 |            | 54 kapitel, till Offentlighets- och        |
|            |            | sekretesslagen eller till annat lagrum som |
| (ERMS59)   |            | stöder den angivna sekretessen.            |
|            |            |                                            |
|            |            | Obligatoriskt om elementet Sekretess       |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: regulation\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Sekr       | Datum då sekretessmarkeringen gjordes.     |
| rms-svk:41 | etess­datum |                                            |
|            |            | Om elementet Sekretessdatum används, måste |
|            |            | attributet dateTyp ha värdet "created"     |
|            |            |                                            |
|            |            | XML-element: dates/date\                   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 10 |            |                                            |
| --         |            |                                            |
| Sekretess  |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<r        |            |                                            |
| estriction |            |                                            |
| rest       |            |                                            |
| rictionTyp |            |                                            |
| e=\"confid |            |                                            |
| ential\"\> |            |                                            |
|            |            |                                            |
| \<explan   |            |                                            |
| atoryText\ |            |                                            |
| >Sekretess |            |                                            |
| enligt     |            |                                            |
| KO         |            |                                            |
| \</explana |            |                                            |
| toryText\> |            |                                            |
|            |            |                                            |
| \<regu     |            |                                            |
| lation\>KO |            |                                            |
| 54:2\</re  |            |                                            |
| gulation\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=\ |            |                                            |
| "created\" |            |                                            |
| \>2020-01- |            |                                            |
| 02T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \</dates\> |            |                                            |
|            |            |                                            |
| \</res     |            |                                            |
| triction\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Aktörer    | Samlingselement för alla agerande parter i |
| rms-svk:42 |            | ärendet.                                   |
|            |            |                                            |
| (ER        |            | XML-element: agents                        |
| MS230-235) |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Skapare    | Den som har skapat ärendet i systemet.     |
| rms-svk:43 |            |                                            |
|            |            | Om elementet Skapare används, måste        |
| (ERMS230)  |            | agentType ha värdet "creator".             |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| e          | H          | Ansvarig handläggare för ärendet.          |
| rms-svk:44 | andläggare |                                            |
|            |            | Om elementet Handläggare används, måste    |
|            |            | agentType ha värdet "responsible_person".  |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| e          | Medh       | Eventuella medhandläggare utöver den       |
| rms-svk:45 | and­läggare | ansvariga.                                 |
|            |            |                                            |
| (ERMS232)  |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Medhandläggare används, måste |
|            |            | agentType ha värdet "editor".              |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| e          | Ärendepart | Extern part i ärendet.                     |
| rms-svk:46 |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Ärendepart används, måste     |
|            |            | agentType ha värdet "counterpart".         |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| e          | Annan      | Annan typ av aktör eller kontakt kopplad   |
| rms-svk:47 | aktör      | till ärendet.                              |
|            |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Annan aktör används, måste    |
|            |            | agentType ha värdet "agent".               |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| e          | Avslutare  | Den som har avslutat eller makulerat       |
| rms-svk:48 |            | ärendet.                                   |
|            |            |                                            |
|            |            | Om elementet Avslutare används, måste      |
|            |            | agentType ha värdet "other" och            |
|            |            | otherAgentType värdet "closer".            |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| Exempel 11 |            |                                            |
| -- Aktörer |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<agents\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| age        |            |                                            |
| ntType=\"c |            |                                            |
| reator\"\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| name\>Anna |            |                                            |
| Andersso   |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \<idNumber |            |                                            |
| idNumbe    |            |                                            |
| rType=\"us |            |                                            |
| ername\"\> |            |                                            |
| svkanan\</ |            |                                            |
| idNumber\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agen       |            |                                            |
| tType=\"re |            |                                            |
| sponsible_ |            |                                            |
| person\"\> |            |                                            |
|            |            |                                            |
| \<n        |            |                                            |
| ame\>Johan |            |                                            |
| Göransso   |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \<idNumber |            |                                            |
| idNumbe    |            |                                            |
| rType=\"us |            |                                            |
| ername\"\> |            |                                            |
| svkjogo\</ |            |                                            |
| idNumber\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agentTy    |            |                                            |
| pe=\"count |            |                                            |
| erpart\"\> |            |                                            |
|            |            |                                            |
| \<na       |            |                                            |
| me\>Försäk |            |                                            |
| ringskassa |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agentType  |            |                                            |
| =\"other\" |            |                                            |
| otherAg    |            |                                            |
| entType=\" |            |                                            |
| closer\"\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| name\>Erik |            |                                            |
| Gustavsso  |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \<idNumber |            |                                            |
| idNumbe    |            |                                            |
| rType=\"us |            |                                            |
| ername\"\> |            |                                            |
| svkergu\</ |            |                                            |
| idNumber\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </agents\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | B          | En beskrivning av ärendet utöver           |
| rms-svk:49 | eskrivning | Ärendemening.                              |
|            |            |                                            |
| (ERMS211)  |            | XML-element: description\                  |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Datum      | Samlingselement för datum som gäller för   |
| rms-svk:50 |            | ärendet.                                   |
|            |            |                                            |
| E          |            | Alla datum har datatypen xs:dateTime i     |
| RMS204-206 |            | UTC-format, vilket betyder att både datum  |
|            |            | och klocklag ned till sekundnivå ska       |
|            |            | anges. Om klockslag saknas används         |
|            |            | noll-tecken. Tidszon anges inte men        |
|            |            | förutsätts vara Europe/Stockholm.          |
|            |            |                                            |
|            |            | \[År\]-\[Måna                              |
|            |            | d\]-\[Dag\]T\[Timme\]:\[Minut\]:\[Sekund\] |
|            |            |                                            |
|            |            | Exempel:\                                  |
|            |            | 2018-03-04T15:15:22\                       |
|            |            | 2020-09-17T00:00:00                        |
|            |            |                                            |
|            |            | XML-element: dates                         |
+------------+------------+--------------------------------------------+
| e          | Skapat     | Datum då ärendet skapades i systemet. Här  |
| rms-svk:51 |            | avses ett av systemet automatiskt satt     |
|            |            | datum.                                     |
| (ERMS232)  |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Om uppgiften saknas i diariesystemet,      |
|            |            | används samma datum som för Öppnat.        |
|            |            |                                            |
|            |            | Om elementet Skapat används, måste         |
|            |            | dateType ha värdet "created".              |
|            |            |                                            |
|            |            | XML-element: date/@dateType="created"\     |
|            |            | Datatyp: xs:dateTime                       |
+------------+------------+--------------------------------------------+
| e          | Öppnat     | Datum då ärendet officiellt öppnades       |
| rms-svk:52 |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Om elementet Öppnat används, måste         |
|            |            | dateType ha värdet "opened".               |
|            |            |                                            |
|            |            | XML-element: date/@dateType="opened"\      |
|            |            | Datatyp: xs:dateTime                       |
+------------+------------+--------------------------------------------+
| e          | Avslutat   | Datum då ärendet avslutades eller          |
| rms-svk:53 |            | makulerades.                               |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Om elementet Avslutat används, måste       |
|            |            | dateType ha värdet "closed".               |
|            |            |                                            |
|            |            | XML-element: date/@dateType="closed"\      |
|            |            | Datatyp: xs:dateTime                       |
+------------+------------+--------------------------------------------+
| Exempel 12 |            |                                            |
| -- Datum   |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=\ |            |                                            |
| "created\" |            |                                            |
| \>2020-05- |            |                                            |
| 20T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=  |            |                                            |
| \"opened\" |            |                                            |
| \>2020-05- |            |                                            |
| 22T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=  |            |                                            |
| \"closed\" |            |                                            |
| \>2020-05- |            |                                            |
| 30T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \</dates\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Beslut i   | Samlingselement som används för uppgifter  |
| rms-svk:54 | ärendet    | om beslut som har fattats i ärendet och    |
|            |            | som i diariesystemet har registrerats      |
| (ERMS240)  |            | separat och inte som en vanlig handling.   |
|            |            |                                            |
|            |            | Elementet kan upprepas                     |
|            |            |                                            |
|            |            | XML-element: action                        |
+------------+------------+--------------------------------------------+
| e          | B          | Beslutets lydelse samt ev. referens till   |
| rms-svk:55 | eslutstext | protokoll.                                 |
|            |            |                                            |
| (ERMS84)   |            | Om elementet Beslut i ärendet används, är  |
|            |            | detta element obligatoriskt.               |
|            |            |                                            |
|            |            | XML-element: actionText\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Typ av     | Obligatoriskt om elementet Beslut i        |
| rms-svk:56 | händelse   | ärendet används                            |
|            |            |                                            |
| (ERMS87)   |            | Elementet måste ha värdet "beslut".        |
|            |            |                                            |
|            |            | XML-element: actionType\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Be         | Datum då beslutet fattades.                |
| rms-svk:57 | slutsdatum |                                            |
|            |            | Om elementet Beslutsdatum används, måste   |
| (ERMS89,   |            | dateType ha värdet "decision_date".        |
| ERMS47)    |            |                                            |
|            |            | XML-element:                               |
|            |            | dates/date/@dateType="decision_date"\      |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| e          | Besl       | Namn på person eller organ som har fattat  |
| rms-svk:58 | utsfattare | beslutet                                   |
|            |            |                                            |
| (ERMS90,   |            | Underelementet agents används. Se exemplet |
| ERMS91,    |            | nedan.                                     |
| ERMS93)    |            |                                            |
|            |            | Om elementet Beslutsfattare används, måste |
|            |            | agentType ha värdet "other" och            |
|            |            | otherAgentType ha värdet "decisionMaker".  |
|            |            | Se exemplet nedan.                         |
|            |            |                                            |
|            |            | XML-element: agents/agent/name\            |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 13 |            |                                            |
| -- Beslut  |            |                                            |
| i ärendet  |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<action\> |            |                                            |
|            |            |                                            |
| \<a        |            |                                            |
| ctionText\ |            |                                            |
| >Beslutets |            |                                            |
| ly         |            |                                            |
| delse\</ac |            |                                            |
| tionText\> |            |                                            |
|            |            |                                            |
| \<act      |            |                                            |
| ionType\>b |            |                                            |
| eslut\</ac |            |                                            |
| tionType\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| actionDate |            |                                            |
| da         |            |                                            |
| teType=\"d |            |                                            |
| ecision_da |            |                                            |
| te\"\>2020 |            |                                            |
| -05-20T00: |            |                                            |
| 00:00\</ac |            |                                            |
| tionDate\> |            |                                            |
|            |            |                                            |
| \</dates\> |            |                                            |
|            |            |                                            |
| \<agents\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agentType  |            |                                            |
| =\"other\" |            |                                            |
| othe       |            |                                            |
| rAgentType |            |                                            |
| =\"decisio |            |                                            |
| nMaker\"\> |            |                                            |
|            |            |                                            |
| \<name\    |            |                                            |
| >Kyrkoråde |            |                                            |
| t\</name\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </agents\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </action\> |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Kommentar  | Kommentar till ärendet.                    |
| rms-svk:59 |            |                                            |
|            |            | Kommentaren utgörs av en enda              |
| (ERMS212,  |            | sammanhängande text och är inte möjlig att |
| ERMS50)    |            | upprepa. Se exemplet nedan.                |
|            |            |                                            |
|            |            | För upprepade kommentarer eller            |
|            |            | anteckningar används i stället elementet   |
|            |            | svkNotes, se [Tabell                       |
|            |            | 3](#_Tabell_3._Svenska)                    |
|            |            |                                            |
|            |            | Om elementet Kommentar används, måste      |
|            |            | noteType ha värdet "comment"               |
|            |            |                                            |
|            |            | XML-element: notes/note\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Datum för  | Datum då kommentaren skapades.             |
| rms-svk:60 | kommentar  |                                            |
|            |            | XML-element: notes/note/@noteDate\         |
| (ERMS51)   |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 14 |            |                                            |
| --         |            |                                            |
| Kommentar  |            |                                            |
|            |            |                                            |
| \<agg      |            |                                            |
| regation\> |            |                                            |
|            |            |                                            |
| \<notes\>  |            |                                            |
|            |            |                                            |
| \<note     |            |                                            |
| noteType=\ |            |                                            |
| "comment\" |            |                                            |
| noteDate=  |            |                                            |
| \"2019-02- |            |                                            |
| 21T00:00:0 |            |                                            |
| 0\"\>Detta |            |                                            |
| är en      |            |                                            |
| kommenta   |            |                                            |
| r\</note\> |            |                                            |
|            |            |                                            |
| \</notes\> |            |                                            |
|            |            |                                            |
| \</agg     |            |                                            |
| regation\> |            |                                            |
+------------+------------+--------------------------------------------+

[]{#_Tabell_3._Svenska .anchor}

Tabell 3. Svenska kyrkans tilläggsinformation om ärendeakter

+-----------+-----------+---------------------------------------------+
| ID        | Element   |                                             |
+===========+===========+=============================================+
| er        | T         | De element som inte ingår i ERMS utan är    |
| ms-svk:61 | illäggsin | tillägg i Svenska kyrkans anpassning är     |
|           | ­formation | samlade i elementet Tilläggsinformation.    |
|           |           |                                             |
|           |           | XML-element:                                |
|           |           | additionalInformation/additionalXMLData/\   |
|           |           | svk:ermsSvkArende/svk:ermsSvkAggregation    |
+-----------+-----------+---------------------------------------------+
| er        | Initiativ | Anger om initiativ till ärendets öppnande   |
| ms-svk:62 |           | är externt (genom en inkommande handling),  |
|           |           | eller om ärendet har öppnats på eget        |
|           |           | (internt) initiativ.                        |
|           |           |                                             |
|           |           | Värdet väljs från värdelistan               |
|           |           | [SVK-värdelista 9](#_SVK-VÄRDELISTA_9_–).   |
|           |           |                                             |
|           |           | Möjliga värden: "externt"eller "eget"       |
|           |           |                                             |
|           |           | XML-element: svk:initiative\                |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | R         | Samlingselement med referenser till projekt |
| ms-svk:63 | elaterade | som ärendet relaterar till.                 |
|           | projekt   |                                             |
|           |           | XML-element: svk:relatedProjects            |
+-----------+-----------+---------------------------------------------+
| er        | Relaterat | Referens till projekt som ärendet relaterar |
| ms-svk:64 | projekt   | till.                                       |
|           |           |                                             |
|           |           | Elementet kan upprepas.                     |
|           |           |                                             |
|           |           | XML-element: svk:relatedProject             |
+-----------+-----------+---------------------------------------------+
| er        | Pr        | Det relaterade projektets namn.             |
| ms-svk:65 | ojektnamn |                                             |
|           |           | Obligatoriskt om elementet Relaterat        |
|           |           | projekt används.                            |
|           |           |                                             |
|           |           | XML-element: svk:name\                      |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Iden      | Projektnummer eller annan identifikator för |
| ms-svk:66 | tifikator | projektet.                                  |
|           |           |                                             |
|           |           | Obligatoriskt om elementet Relaterat        |
|           |           | projekt används.                            |
|           |           |                                             |
|           |           | XML-element: svk:identificator\             |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Internt   | Projektets id-nummer i det levererande      |
| ms-svk:67 | ID        | systemet                                    |
|           |           |                                             |
|           |           | XML-element: svk:deliveringSystemId\        |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| Exempel   |           |                                             |
| 15 --     |           |                                             |
| Relaterat |           |                                             |
| projekt   |           |                                             |
|           |           |                                             |
| \<svk:er  |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
|           |           |                                             |
| \<svk     |           |                                             |
| :relatedP |           |                                             |
| rojects\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:related |           |                                             |
| Project\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:name\>O |           |                                             |
| mläggning |           |                                             |
| av        |           |                                             |
| kyrktaket |           |                                             |
| 2009\</s  |           |                                             |
| vk:name\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:identif |           |                                             |
| icator\>P |           |                                             |
| 2         |           |                                             |
| 009:1\</s |           |                                             |
| vk:identi |           |                                             |
| ficator\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:deliver |           |                                             |
| ingSystem |           |                                             |
| Id\>34958 |           |                                             |
| \</svk:de |           |                                             |
| liveringS |           |                                             |
| ystemId\> |           |                                             |
|           |           |                                             |
| \</sv     |           |                                             |
| k:related |           |                                             |
| Project\> |           |                                             |
|           |           |                                             |
| \</svk    |           |                                             |
| :relatedP |           |                                             |
| rojects\> |           |                                             |
|           |           |                                             |
| \</svk:er |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
+-----------+-----------+---------------------------------------------+
| er        | R         | Samlingselement med referenser till         |
| ms-svk:68 | elaterade | fastigheter eller byggnader som ärendet     |
|           | fa        | relaterar till.                             |
|           | stigheter |                                             |
|           |           | XML-element: svk:relatedRealEstates         |
+-----------+-----------+---------------------------------------------+
| er        | Relaterad | Referens till fastighet eller byggnad som   |
| ms-svk:69 | fastighet | ärendet relaterar till.                     |
|           |           |                                             |
|           |           | Elementet kan upprepas.                     |
|           |           |                                             |
|           |           | XML-element: svk:relatedRealEstate          |
+-----------+-----------+---------------------------------------------+
| er        | Fast      | Fastighetens eller byggnadens namn.         |
| ms-svk:70 | ighetsnam |                                             |
|           |           | Obligatoriskt om elementet Relaterad        |
|           |           | fastighet används.                          |
|           |           |                                             |
|           |           | XML-element: svk:name\                      |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Iden      | Fastighetsnummer eller annan identifikator  |
| ms-svk:71 | tifikator | för fastigheten eller byggnaden.            |
|           |           |                                             |
|           |           | XML-element: svk:identificator\             |
|           |           | Datatyp: token                              |
|           |           |                                             |
|           |           | Obligatoriskt om elementet Relaterad        |
|           |           | fastighet används.                          |
+-----------+-----------+---------------------------------------------+
| er        | Internt   | Fastighetens eller byggnadens id-nummer i   |
| ms-svk:72 | ID        | det levererande systemet.                   |
|           |           |                                             |
|           |           | XML-element: svk:deliveringSystemId\        |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| Exempel   |           |                                             |
| 16 --     |           |                                             |
| Relaterad |           |                                             |
| fastighet |           |                                             |
|           |           |                                             |
| \<svk:er  |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
|           |           |                                             |
| \<svk:re  |           |                                             |
| latedReal |           |                                             |
| Estates\> |           |                                             |
|           |           |                                             |
| \<svk:r   |           |                                             |
| elatedRea |           |                                             |
| lEstate\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:name\>O |           |                                             |
| mläggning |           |                                             |
| av        |           |                                             |
| kyrktaket |           |                                             |
| 2009\</s  |           |                                             |
| vk:name\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:identif |           |                                             |
| icator\>P |           |                                             |
| 2         |           |                                             |
| 009:1\</s |           |                                             |
| vk:identi |           |                                             |
| ficator\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:deliver |           |                                             |
| ingSystem |           |                                             |
| Id\>34958 |           |                                             |
| \</svk:de |           |                                             |
| liveringS |           |                                             |
| ystemId\> |           |                                             |
|           |           |                                             |
| \</svk:r  |           |                                             |
| elatedRea |           |                                             |
| lEstate\> |           |                                             |
|           |           |                                             |
| \</svk:re |           |                                             |
| latedReal |           |                                             |
| Estates\> |           |                                             |
|           |           |                                             |
| \</svk:er |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
+-----------+-----------+---------------------------------------------+
| er        | Ant       | Samlingselement för anteckningar kopplade   |
| ms-svk:73 | eckningar | till ett ärende.                            |
|           |           |                                             |
|           |           | XLM-element: svk:svkNotes                   |
+-----------+-----------+---------------------------------------------+
| er        | A         | Enskild anteckning kopplad till ärendet.    |
| ms-svk:74 | nteckning |                                             |
|           |           | Elementet kan upprepas.                     |
|           |           |                                             |
|           |           | XML-element: svk:svkNote                    |
+-----------+-----------+---------------------------------------------+
| er        | Typ av    | Obligatoriskt om elementet Anteckning       |
| ms-svk:75 | a         | används.                                    |
|           | nteckning |                                             |
|           |           | Värdet väljs från [SVK-värdelista           |
|           |           | 10](#_SVK-VÄRDELISTA_10_–).                 |
|           |           |                                             |
|           |           | XML-element: svk:svkNote/@typeOfNote\       |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Text      | Anteckningens lydelse.                      |
| ms-svk:76 |           |                                             |
|           |           | Obligatoriskt om elementet Anteckning       |
|           |           | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:noteText\                  |
|           |           | Datatyp: string                             |
+-----------+-----------+---------------------------------------------+
| er        | Skapare   | Person som har gjort anteckningen.          |
| ms-svk:77 | av        |                                             |
|           | a         | Obligatoriskt om elementet Anteckning       |
|           | nteckning | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:noteAuthor\                |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Datum för | Datum och tid när anteckningen gjordes.     |
| ms-svk:78 | a         |                                             |
|           | nteckning | Obligatoriskt om elementet Anteckning       |
|           |           | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:noteDate\                  |
|           |           | Datatyp: dateTime                           |
+-----------+-----------+---------------------------------------------+
| Exempel   |           |                                             |
| 17 --     |           |                                             |
| Ant       |           |                                             |
| eckningar |           |                                             |
|           |           |                                             |
| \<svk:er  |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
|           |           |                                             |
| \<svk:s   |           |                                             |
| vkNotes\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:svkNote |           |                                             |
| typ       |           |                                             |
| eOfNote=\ |           |                                             |
| "generell |           |                                             |
| antec     |           |                                             |
| kning\"\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:noteTe |           |                                             |
| xt\>Detta |           |                                             |
| är en     |           |                                             |
| antecknin |           |                                             |
| g\</svk:n |           |                                             |
| oteText\> |           |                                             |
|           |           |                                             |
| \<svk:    |           |                                             |
| noteAutho |           |                                             |
| r\>Jörgen |           |                                             |
| Persson\  |           |                                             |
| </svk:not |           |                                             |
| eAuthor\> |           |                                             |
|           |           |                                             |
| \<svk:n   |           |                                             |
| oteDate\> |           |                                             |
| 2019-02-2 |           |                                             |
| 3T00:00:0 |           |                                             |
| 0\</svk:n |           |                                             |
| oteDate\> |           |                                             |
|           |           |                                             |
| \</svk:   |           |                                             |
| svkNote\> |           |                                             |
|           |           |                                             |
| \</svk:s  |           |                                             |
| vkNotes\> |           |                                             |
|           |           |                                             |
| \</svk:er |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
+-----------+-----------+---------------------------------------------+
| er        | Änd       | Samlingselement för loggningsuppgifter.     |
| ms-svk:79 | ringslogg |                                             |
|           |           | XML-element: svk:auditLogEvents             |
+-----------+-----------+---------------------------------------------+
| er        | Händelse  | Enskild händelse i ändringsloggen.          |
| ms-svk:80 |           |                                             |
|           |           | Obligatoriskt om elementet Ändringslogg     |
|           |           | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:auditLogEvent              |
+-----------+-----------+---------------------------------------------+
| er        | Tid       | Datum och tid då ändringen gjordes.         |
| ms-svk:81 |           |                                             |
|           |           | Obligatoriskt om elementet Händelse         |
|           |           | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:time\                      |
|           |           | Datatyp: dateTime                           |
+-----------+-----------+---------------------------------------------+
| er        | Användare | Namn på personen som gjorde ändringen.      |
| ms-svk:82 |           |                                             |
|           |           | Obligatoriskt om elementet Händelse         |
|           |           | används.                                    |
|           |           |                                             |
|           |           | XML-element: svk:user\                      |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Tillämpni | Beskrivning av det som ändringen avser.     |
| ms-svk:83 | ngs­område |                                             |
|           |           | Obligatoriskt om elementet Händelse         |
|           |           | används.                                    |
|           |           |                                             |
|           |           | Värdet väljs från [SVK-värdelista           |
|           |           | 11](#_SVK-VÄRDELISTA_11_–).                 |
|           |           |                                             |
|           |           | XML-element: svk:scope\                     |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Händelse  | Beskrivning av ändringen.                   |
| ms-svk:84 |           |                                             |
|           |           | Obligatoriskt om elementet Händelse         |
|           |           | används.                                    |
|           |           |                                             |
|           |           | Värdet väljs från [SVK-värdelista           |
|           |           | 12](#_SVK-VÄRDELISTA_12_–).                 |
|           |           |                                             |
|           |           | XML-element: svk:action\                    |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Värde     | Om ett värde har ändrats, anges här         |
| ms-svk:85 | före      | lydelsen före ändringen.                    |
|           | ändring   |                                             |
|           |           | XML-element: svk:valueBeforeChange\         |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| er        | Värde     | Om ett värde har ändrats, anges här         |
| ms-svk:86 | efter     | lydelsen efter ändringen.                   |
|           | ändring   |                                             |
|           |           | XML-element: svk:valueAfterChange\          |
|           |           | Datatyp: token                              |
+-----------+-----------+---------------------------------------------+
| Exempel   |           |                                             |
| 18 --     |           |                                             |
| Änd       |           |                                             |
| ringslogg |           |                                             |
|           |           |                                             |
| \<svk:er  |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:auditLo |           |                                             |
| gEvents\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \<svk:ti  |           |                                             |
| me\>2009- |           |                                             |
| 09-22T11: |           |                                             |
| 47:00\</s |           |                                             |
| vk:time\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:user\> |           |                                             |
| Jörgen    |           |                                             |
| Pe        |           |                                             |
| rsson\</s |           |                                             |
| vk:user\> |           |                                             |
|           |           |                                             |
| \<svk:    |           |                                             |
| scope\>är |           |                                             |
| ende\</sv |           |                                             |
| k:scope\> |           |                                             |
|           |           |                                             |
| \<svk:ac  |           |                                             |
| tion\>cre |           |                                             |
| ate\</svk |           |                                             |
| :action\> |           |                                             |
|           |           |                                             |
| \</s      |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \<svk:ti  |           |                                             |
| me\>2009- |           |                                             |
| 09-22T11: |           |                                             |
| 52:00\</s |           |                                             |
| vk:time\> |           |                                             |
|           |           |                                             |
| \<svk:use |           |                                             |
| r\>Jörgen |           |                                             |
| Pe        |           |                                             |
| rsson\</s |           |                                             |
| vk:user\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:scope\ |           |                                             |
| >ärendeme |           |                                             |
| ning\</sv |           |                                             |
| k:scope\> |           |                                             |
|           |           |                                             |
| \<svk:ac  |           |                                             |
| tion\>upd |           |                                             |
| ate\</svk |           |                                             |
| :action\> |           |                                             |
|           |           |                                             |
| \<svk:val |           |                                             |
| ueBeforeC |           |                                             |
| hange\>Up |           |                                             |
| phandling |           |                                             |
| av        |           |                                             |
| frysboxa  |           |                                             |
| r\</svk:v |           |                                             |
| alueBefor |           |                                             |
| eChange\> |           |                                             |
|           |           |                                             |
| \<svk:va  |           |                                             |
| lueAfterC |           |                                             |
| hange\>Up |           |                                             |
| phandling |           |                                             |
| av        |           |                                             |
| kylsk     |           |                                             |
| åp\</svk: |           |                                             |
| valueAfte |           |                                             |
| rChange\> |           |                                             |
|           |           |                                             |
| \</s      |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \<svk:ti  |           |                                             |
| me\>2009- |           |                                             |
| 09-22T12: |           |                                             |
| 10:00\</s |           |                                             |
| vk:time\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:user\> |           |                                             |
| Jörgen    |           |                                             |
| Persson   |           |                                             |
| \</s      |           |                                             |
| vk:user\> |           |                                             |
|           |           |                                             |
| \<s       |           |                                             |
| vk:scope\ |           |                                             |
| >ärendest |           |                                             |
| atus\</sv |           |                                             |
| k:scope\> |           |                                             |
|           |           |                                             |
| \<svk:ac  |           |                                             |
| tion\>upd |           |                                             |
| ate\</svk |           |                                             |
| :action\> |           |                                             |
|           |           |                                             |
| \<        |           |                                             |
| svk:value |           |                                             |
| BeforeCha |           |                                             |
| nge\>Öppe |           |                                             |
| t\</svk:v |           |                                             |
| alueBefor |           |                                             |
| eChange\> |           |                                             |
|           |           |                                             |
| \<sv      |           |                                             |
| k:valueAf |           |                                             |
| terChange |           |                                             |
| \>Makuler |           |                                             |
| at\</svk: |           |                                             |
| valueAfte |           |                                             |
| rChange\> |           |                                             |
|           |           |                                             |
| \</s      |           |                                             |
| vk:auditL |           |                                             |
| ogEvent\> |           |                                             |
|           |           |                                             |
| \</sv     |           |                                             |
| k:auditLo |           |                                             |
| gEvents\> |           |                                             |
|           |           |                                             |
| \</svk:er |           |                                             |
| msSvkAggr |           |                                             |
| egation\> |           |                                             |
+-----------+-----------+---------------------------------------------+

Information om ärendehandlingar

[]{#_Tabell_4._Ärendehandlingar .anchor}Tabell 4. Ärendehandlingar

+------------+------------+--------------------------------------------+
| ID         | Element    |                                            |
+============+============+============================================+
| e          | Handling   | Samlingselement med information om en i    |
| rms-svk:87 |            | ärendet registrerad handling.              |
|            |            |                                            |
| (ERMS129)  |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | XML-element: record                        |
+------------+------------+--------------------------------------------+
| e          | Ide        | Identifikator för dokumentet i form av     |
| rms-svk:88 | ntifikator | UUID. Identifikatorn anges automatiskt     |
|            |            | redan i det levererande systemet eller vid |
| (ERMS130)  |            | överföring till e-arkivet.                 |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | XML-element: record/@systemIdentifier\     |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Ha         | Övergripande typ av handling. Motsvarar    |
| rms-svk:89 | ndlingstyp | inte handlingstyp i                        |
|            |            | arkivredovisning/dokumenthanteringsplan.   |
| (ERMS131)  |            |                                            |
|            |            | Obligatoriskt. Värdet väljs från           |
|            |            | [SVK-värdelista                            |
|            |            | 13](#_SVK-VÄRDELISTA_13_–).                |
|            |            |                                            |
|            |            | Oavsett handlingstyp kan värdet            |
|            |            | "ärendedokument" alltid användas.          |
|            |            |                                            |
|            |            | XML-element: record/@recordType\           |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Form       | Anger om handlingen bara finns i fysisk    |
| rms-svk:90 |            | form, bara i digital form eller både och.  |
|            |            |                                            |
| (ERMS132)  |            | Värdet väljs från [SVK-värdelista          |
|            |            | 14](#_SVK-VÄRDELISTA_14_–).                |
|            |            |                                            |
|            |            | XML-element: recordPhysicalOrDigital\      |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 19 |            |                                            |
| --         |            |                                            |
| Handling   |            |                                            |
|            |            |                                            |
| \<record\  |            |                                            |
| systemId   |            |                                            |
| entifier=\ |            |                                            |
| "8dbbdc56- |            |                                            |
| 8ada-4ad5- |            |                                            |
| a1ec-b8131 |            |                                            |
| a1086a2\"\ |            |                                            |
| record     |            |                                            |
| PhysicalOr |            |                                            |
| Digital=\" |            |                                            |
| digital\"\ |            |                                            |
| r          |            |                                            |
| ecordType= |            |                                            |
| \"ärendedo |            |                                            |
| kument\"\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Doku       | En kombination av Ärendenummer             |
| rms-svk:91 | ment­nummer | (erms-svk:25) och dokumentets löpnummer    |
|            |            | (erms-svk:102) med kolon emellan.          |
| (ERMS146)  |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Exempel: S 2010-0034:1                     |
|            |            |                                            |
|            |            | XML-element: objectId\                     |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Intern     | Befintligt id i det levererande systemet   |
| rms-svk:92 | ide        |                                            |
|            | ntifi­kator | Om elementet Intern identifikator används, |
| (ERMS148,  |            | måste attributet extraIdType ha värdet     |
| ERMS149)   |            | "deliveringSystemId".                      |
|            |            |                                            |
|            |            | XML-element: extraId\                      |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 20 |            |                                            |
| --         |            |                                            |
| Doku       |            |                                            |
| mentnummer |            |                                            |
| och Intern |            |                                            |
| ide        |            |                                            |
| ntifikator |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<o        |            |                                            |
| bjectId\>C |            |                                            |
| 1995       |            |                                            |
| -0032:1\</ |            |                                            |
| objectId\> |            |                                            |
|            |            |                                            |
| \<extraId  |            |                                            |
| ext        |            |                                            |
| raIdType=\ |            |                                            |
| "deliverin |            |                                            |
| gSystemId\ |            |                                            |
| "\>34565\< |            |                                            |
| /extraId\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | I          | Handlingens informationsklass.             |
| rms-svk:93 | nforma­tion |                                            |
|            | sklass­ning | XML-element: informationClass\             |
| (ERMS133)  |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Säkerhet   | Handlingens säkerhetsklass.                |
| rms-svk:94 | s­klassning |                                            |
|            |            | XML-element: securityClass\                |
| (ERMS134)  |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Klas       | Namnet på den process i den officiella     |
| rms-svk:95 | sificering | klassificeringsstrukturen som har angivits |
|            |            | som klassificering av ärendet och de       |
| (ERMS196)  |            | ingående handlingarna.                     |
|            |            |                                            |
|            |            | XML-element: classification\               |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| e          | Klassifi   | Koden för den process som angivits under   |
| rms-svk:96 | ce­ringskod | Klassificering                             |
|            |            |                                            |
| (ERMS75)   |            | XML-element:                               |
|            |            | classification/@classificationCode\        |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 21 |            |                                            |
| --         |            |                                            |
| Klas       |            |                                            |
| sificering |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<clas     |            |                                            |
| sification |            |                                            |
| classifica |            |                                            |
| tionCode=\ |            |                                            |
| "2.7\"\>Ge |            |                                            |
| servic     |            |                                            |
| e\</classi |            |                                            |
| fication\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Nyckelord  | Samlingselement för enskilda nyckelord.    |
| rms-svk:97 |            |                                            |
|            |            | XML-element: keywords                      |
| (ERMS152)  |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Nyckelord  | Enstaka nyckelord.                         |
| rms-svk:98 |            |                                            |
|            |            | Elementet kan upprepas.                    |
| (ERMS153)  |            |                                            |
|            |            | XML-element: keyword\                      |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 22 |            |                                            |
| --         |            |                                            |
| Nyckelord  |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| keywords\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <keyword\> |            |                                            |
| församling |            |                                            |
| sordning\< |            |                                            |
| /keyword\> |            |                                            |
|            |            |                                            |
| \<k        |            |                                            |
| eyword\>ky |            |                                            |
| rkorådet\< |            |                                            |
| /keyword\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| e          | Titel      | Titel eller en beskrivning av handlingen.  |
| rms-svk:99 |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | XML-element: title\                        |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Annan      | Används enbart för Offentlig titel i       |
| ms-svk:100 | titel      | leveranser från Public 360°.               |
|            |            |                                            |
|            |            | Om elementet Annan titel används måste     |
|            |            | attributet titleType ha värdet             |
|            |            | "publicTitle".                             |
|            |            |                                            |
|            |            | XML-element: otherTitle\                   |
|            |            | \@titleType="publicTitle"\                 |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 23 |            |                                            |
| -- Titel   |            |                                            |
| och Annan  |            |                                            |
| titel      |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<title\>H |            |                                            |
| andlingens |            |                                            |
| titel      |            |                                            |
| \</title\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| otherTitle |            |                                            |
| titleTy    |            |                                            |
| pe="public |            |                                            |
| Title"\>En |            |                                            |
| offentlig  |            |                                            |
| titel\</ot |            |                                            |
| herTitle\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Status     | Handlingens status.                        |
| ms-svk:101 |            |                                            |
|            |            | Obligatoriskt. Värdet väljs från           |
|            |            | [SVK-värdelista 7](#_SVK-VÄRDELISTA_7_–).  |
|            |            |                                            |
|            |            | Värdet kan vara antingen "closed", vilket  |
|            |            | innebär att dokumentet är registrerat som  |
|            |            | inkommet eller upprättat, eller            |
|            |            | "obliterated", vilket betyder att det är   |
|            |            | makulerat.                                 |
|            |            |                                            |
|            |            | Exempel:                                   |
|            |            |                                            |
|            |            | \<record\>                                 |
|            |            |                                            |
|            |            | \<status                                   |
|            |            | []{.mark}value="[closed]{.mark}"/\>        |
|            |            |                                            |
|            |            | \</record\>                                |
|            |            |                                            |
|            |            | XML-element: status/@value\                |
|            |            | Datatype: string                           |
+------------+------------+--------------------------------------------+
| er         | Löpnummer  | Handlingens löpnummer i ärendet.           |
| ms-svk:102 |            |                                            |
|            |            | Obligatoriskt. Måste vara unikt i          |
|            |            | respektive ärende.                         |
|            |            |                                            |
|            |            | XML-element: runningNumber\                |
|            |            | Datatyp: integer                           |
+------------+------------+--------------------------------------------+
| er         | Dokume     | Referens till och/eller från annan         |
| ms-svk:103 | nt­referens | handling.                                  |
|            |            |                                            |
|            |            | Om möjligt anges den andra handlingens     |
|            |            | Dokumentnummer enligt specifikationen i    |
|            |            | detta dokument, annars en hänvisning till  |
|            |            | dokumentet i annat format eller fritext.   |
|            |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Dokumentreferens används,     |
|            |            | måste attributet relationType ha värdet    |
|            |            | "reference".                               |
|            |            |                                            |
|            |            | XML-element: relation\                     |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 24 |            |                                            |
| --         |            |                                            |
| Dokume     |            |                                            |
| ntreferens |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<relation |            |                                            |
| relationT  |            |                                            |
| ype=\"refe |            |                                            |
| rence\"\>F |            |                                            |
| 2019       |            |                                            |
| -0454:4\</ |            |                                            |
| relation\> |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Sekretess  | Samlingselement för uppgift om sekretess.  |
| ms-svk:104 |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | Om elementet Sekretess används måste       |
|            |            | attributet restrictionType ha värdet       |
|            |            | "confidential".                            |
|            |            |                                            |
|            |            | XML-element: restriction                   |
+------------+------------+--------------------------------------------+
| er         | F          | Fritext som beskriver sekretessen.         |
| ms-svk:105 | örklarande |                                            |
|            | text       | XML-element: explanatoryText\              |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Lagrum     | Hänvisning till paragraf i kyrkoordningens |
| ms-svk:106 |            | 54 kapitel, till Offentlighets- och        |
|            |            | sekretesslagen eller till annat lagrum som |
|            |            | stöder den angivna sekretessen.            |
|            |            |                                            |
|            |            | Obligatoriskt om elementet Sekretess       |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: regulation\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Sekr       | Datum då sekretessmarkeringen gjordes.     |
| ms-svk:107 | etess­datum |                                            |
|            |            | Om elementet Sekretessdatum används, måste |
|            |            | attributet dateTyp ha värdet "created"     |
|            |            |                                            |
|            |            | XML-element: dates/date\                   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 25 |            |                                            |
| --         |            |                                            |
| Sekretess  |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<r        |            |                                            |
| estriction |            |                                            |
| rest       |            |                                            |
| rictionTyp |            |                                            |
| e=\"confid |            |                                            |
| ential\"\> |            |                                            |
|            |            |                                            |
| \<explan   |            |                                            |
| atoryText\ |            |                                            |
| >Sekretess |            |                                            |
| enligt     |            |                                            |
| KO         |            |                                            |
| \</explana |            |                                            |
| toryText\> |            |                                            |
|            |            |                                            |
| \<regu     |            |                                            |
| lation\>KO |            |                                            |
| 54:2\</re  |            |                                            |
| gulation\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=\ |            |                                            |
| "created\" |            |                                            |
| \>2020-01- |            |                                            |
| 02T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \</dates\> |            |                                            |
|            |            |                                            |
| \</res     |            |                                            |
| triction\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Riktning   | Anger dokumentets riktning.                |
| ms-svk:108 |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Värdet väljs från [SVK-värdelista          |
|            |            | 15](#_SVK-VÄRDELISTA_15_–).                |
|            |            |                                            |
|            |            | Kan vara något av värdena:                 |
|            |            |                                            |
|            |            | "incoming" -- en inkommen handling         |
|            |            |                                            |
|            |            | "outgoing" -- en genom expediering         |
|            |            | upprättad handling                         |
|            |            |                                            |
|            |            | "internal" -- en på annat sätt upprättad   |
|            |            | handling                                   |
|            |            |                                            |
|            |            | XML-element:                               |
|            |            | direction/@directionDefinition\            |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 26 |            |                                            |
| --         |            |                                            |
| Riktning   |            |                                            |
|            |            |                                            |
| 1\)        |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <direction |            |                                            |
| direc      |            |                                            |
| tionDefini |            |                                            |
| tion=\"inc |            |                                            |
| oming\"/\> |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| 2\)        |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <direction |            |                                            |
| direc      |            |                                            |
| tionDefini |            |                                            |
| tion=\"out |            |                                            |
| going\"/\> |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| 3\)        |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <direction |            |                                            |
| direction  |            |                                            |
| Definition |            |                                            |
| =\"other\" |            |                                            |
| otherDirec |            |                                            |
| tionDefini |            |                                            |
| tion=\"int |            |                                            |
| ernal\"/\> |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Aktörer    | Samlingselement för alla agerande parter.  |
| ms-svk:109 |            |                                            |
|            |            | XML-element: agents                        |
+------------+------------+--------------------------------------------+
| er         | Skapare    | Den som har skapat handlingen i systemet.  |
| ms-svk:110 |            |                                            |
|            |            | Om elementet Skapare används, måste        |
|            |            | agentType ha värdet "creator".             |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| er         | Ansvarig   | Den som ägde eller hade ansvar för         |
| ms-svk:111 |            | handlingen innan ärendet avslutades.       |
|            |            |                                            |
|            |            | Om elementet Ansvarig används, måste       |
|            |            | agentType ha värdet "responsible_person".  |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| er         | Avsändare  | Avsändare av en inkommen handling.         |
| ms-svk:112 |            |                                            |
|            |            | Obligatoriskt om Riktning har värdet       |
|            |            | "incoming"                                 |
|            |            |                                            |
|            |            | Elementet kan upprepas                     |
|            |            |                                            |
|            |            | Om elementet Avsändare används, måste      |
|            |            | agentType ha värdet "sender".              |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| er         | Mottagare  | Mottagare av en utgående handling.         |
| ms-svk:113 |            |                                            |
|            |            | Obligatoriskt om Riktning har värdet       |
|            |            | "outgoing"                                 |
|            |            |                                            |
|            |            | Elementet kan upprepas                     |
|            |            |                                            |
|            |            | Om elementet Mottagare används, måste      |
|            |            | agentType ha värdet "receiver".            |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| er         | Annan      | Annan typ av aktör än de ovan              |
| ms-svk:114 | aktör      | specificerade.                             |
|            |            |                                            |
|            |            | Elementet kan upprepas                     |
|            |            |                                            |
|            |            | Om elementet Annan aktör används, måste    |
|            |            | agentType ha värdet "agent".               |
|            |            |                                            |
|            |            | Namn och användarnamn anges i              |
|            |            | underelementen name (obligatoriskt) och    |
|            |            | idNumber (frivilligt). Se exemplet nedan.  |
|            |            |                                            |
|            |            | Om idNumber används hämtas värdet från     |
|            |            | [SVK-värdelista 8](#_SVK-VÄRDELISTA_8_–).  |
|            |            |                                            |
|            |            | XML-element: agent\                        |
|            |            | name (string)\                             |
|            |            | idNumber (string)                          |
+------------+------------+--------------------------------------------+
| Exempel 27 |            |                                            |
| -- Aktörer |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<agents\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| age        |            |                                            |
| ntType=\"c |            |                                            |
| reator\"\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| name\>Anna |            |                                            |
| Andersso   |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \<idNumber |            |                                            |
| idNumbe    |            |                                            |
| rType=\"us |            |                                            |
| ername\"\> |            |                                            |
| svkanan\</ |            |                                            |
| idNumber\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agen       |            |                                            |
| tType=\"re |            |                                            |
| sponsible_ |            |                                            |
| person\"\> |            |                                            |
|            |            |                                            |
| \<n        |            |                                            |
| ame\>Johan |            |                                            |
| Göransso   |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \<idNumber |            |                                            |
| idNumbe    |            |                                            |
| rType=\"us |            |                                            |
| ername\"\> |            |                                            |
| svkjogo\</ |            |                                            |
| idNumber\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| Om det är  |            |                                            |
| en         |            |                                            |
| inkommande |            |                                            |
| handling:  |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| ag         |            |                                            |
| entType=\" |            |                                            |
| sender\"\> |            |                                            |
|            |            |                                            |
| \<na       |            |                                            |
| me\>Försäk |            |                                            |
| ringskassa |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| Om det är  |            |                                            |
| en         |            |                                            |
| utgående   |            |                                            |
| handling:  |            |                                            |
|            |            |                                            |
| \<agent    |            |                                            |
| agen       |            |                                            |
| tType=\"re |            |                                            |
| ceiver\"\> |            |                                            |
|            |            |                                            |
| \<na       |            |                                            |
| me\>Försäk |            |                                            |
| ringskassa |            |                                            |
| n\</name\> |            |                                            |
|            |            |                                            |
| \</agent\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </agents\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </record\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | B          | Beskrivning av handlingen                  |
| ms-svk:115 | eskrivning |                                            |
|            |            | XML-element: description\                  |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Datum      | Samlingselement för alla datum som rör     |
| ms-svk:116 |            | handlingen                                 |
|            |            |                                            |
|            |            | Alla datum har datatypen xs:dateTime i     |
|            |            | UTC-format, vilket betyder att både datum  |
|            |            | och klocklag ned till sekundnivå ska       |
|            |            | anges. Om klockslag saknas används         |
|            |            | noll-tecken. Tidszon anges inte men        |
|            |            | förutsätts vara Europe/Stockholm.          |
|            |            |                                            |
|            |            | \[År\]-\[Måna                              |
|            |            | d\]-\[Dag\]T\[Timme\]:\[Minut\]:\[Sekund\] |
|            |            |                                            |
|            |            | Exempel:                                   |
|            |            |                                            |
|            |            | 2018-03-04T15:15:22\                       |
|            |            | 2020-09-17T00:00:00                        |
|            |            |                                            |
|            |            | XML-element: dates                         |
+------------+------------+--------------------------------------------+
| er         | Skapat     | Datum och tid då handlingen skapades i     |
| ms-svk:117 |            | systemet. Här avses ett av systemet        |
|            |            | automatiskt satt datum.                    |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Om uppgiften saknas i diariesystemet,      |
|            |            | används samma datum som i Registrerat.     |
|            |            |                                            |
|            |            | Om elementet Skapat används, måste         |
|            |            | dateType ha värdet "created".              |
|            |            |                                            |
|            |            | XML-element: date/@dateType="created"\     |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | R          | Datum och tid då handlingen registrerades  |
| ms-svk:118 | egistrerat | (diariefördes) som inkommen, utgående      |
|            |            | eller på annat sätt färdigställd.          |
|            |            |                                            |
|            |            | Obligatoriskt.                             |
|            |            |                                            |
|            |            | Uppgiften relaterar till elementet         |
|            |            | Riktning. Om Riktning t.ex. har värdet     |
|            |            | "outgoing", anges här datum för            |
|            |            | expediering. Om Riktning i stället har     |
|            |            | värdet "incoming", anges här datum då      |
|            |            | handlingen inkom.                          |
|            |            |                                            |
|            |            | Om elementet Registrerat används, måste    |
|            |            | dateType ha värdet "originated".           |
|            |            |                                            |
|            |            | XML-element: date/@dateType="originated\   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | An         | Datum då handlingen inkom, om annat än     |
| ms-svk:119 | komstdatum | Registrerat.                               |
|            |            |                                            |
|            |            | Om elementet Ankomstdatum används, måste   |
|            |            | dateType ha värdet "received".             |
|            |            |                                            |
|            |            | XML-element: date/@dateType="received"\    |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | Expedie    | Datum då handlingen expedierades, om annat |
| ms-svk:120 | rings­datum | än Registrerat.                            |
|            |            |                                            |
|            |            | Om elementet Expedieringsdatum används,    |
|            |            | måste dateType ha värdet "expedited".      |
|            |            |                                            |
|            |            | XML-element: date/@dateType="expedited"\   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 28 |            |                                            |
| -- Datum   |            |                                            |
|            |            |                                            |
| \<record\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType=\ |            |                                            |
| "created\" |            |                                            |
| \>2020-02- |            |                                            |
| 02T12:32:1 |            |                                            |
| 5\</date\> |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dat        |            |                                            |
| eType=\"or |            |                                            |
| iginated\" |            |                                            |
| \>2020-02- |            |                                            |
| 02T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| d          |            |                                            |
| ateType=\" |            |                                            |
| received\" |            |                                            |
| \>2020-01- |            |                                            |
| 14T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Kommentar  | Kommentar till handlingen.                 |
| ms-svk:121 |            |                                            |
|            |            | Kommentaren utgörs av en enda              |
|            |            | sammanhängande text och är inte möjlig att |
|            |            | upprepa. Se exemplet nedan.                |
|            |            |                                            |
|            |            | För upprepade kommentarer eller            |
|            |            | anteckningar används i stället elementet   |
|            |            | svkNotes, se [Tabell                       |
|            |            | 5](#_Tabell_5._Svenska).                   |
|            |            |                                            |
|            |            | Om elementet Kommentar används, måste      |
|            |            | noteType ha värdet "comment"               |
|            |            |                                            |
|            |            | XML-element: notes/note\                   |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Datum för  | Datum då kommentaren skapades.             |
| ms-svk:122 | kommentar  |                                            |
|            |            | XML-element: notes/note/@noteDate\         |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | Utökad     | Utökad XML-data är en del av Svenska       |
| ms-svk:123 | XML-data   | kyrkans anpassning av ERMS.                |
|            |            |                                            |
|            |            | Se [Tabell 5](#_Tabell_5._Svenska).        |
|            |            |                                            |
|            |            | XML-element: additionalXMLData             |
+------------+------------+--------------------------------------------+

[]{#_Tabell_5._Svenska .anchor}

Tabell 5. Svenska kyrkans tilläggsinformation om ärendehandlingar

+------------+------------+--------------------------------------------+
| ID         | Element    |                                            |
+============+============+============================================+
| er         | Tilläggs­i  | De element som inte ingår i ERMS utan är   |
| ms-svk:124 | nformation | tillägg i Svenska kyrkans anpassning är    |
|            |            | samlade i elementet Tilläggsinformation.   |
|            |            |                                            |
|            |            | XML-element:                               |
|            |            | additionalInformation/additionaXMLData/\   |
|            |            | svk:ermsSvkArende/svk:ermsSvkRecord        |
+------------+------------+--------------------------------------------+
| er         | Relaterade | Samlingselement med referenser till        |
| ms-svk:125 | projekt    | projekt som handlingen relaterar till.     |
|            |            |                                            |
|            |            | XML-element: svk:relatedProjects           |
+------------+------------+--------------------------------------------+
| er         | Relaterat  | Referens till projekt som handlingen       |
| ms-svk:126 | projekt    | relaterar till.                            |
|            |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | XML-element: svk:relatedProject            |
+------------+------------+--------------------------------------------+
| er         | P          | Det relaterade projektets namn.            |
| ms-svk:127 | rojektnamn |                                            |
|            |            | Obligatoriskt om elementet Relaterat       |
|            |            | projekt används.                           |
|            |            |                                            |
|            |            | XML-element: svk:name\                     |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Ide        | Projektnummer eller annan identifikator    |
| ms-svk:128 | ntifikator | för projektet.                             |
|            |            |                                            |
|            |            | Obligatoriskt om elementet Relaterat       |
|            |            | projekt används.                           |
|            |            |                                            |
|            |            | XML-element: svk:identificatory\           |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Internt ID | Projektets id-nummer i det levererande     |
| ms-svk:129 |            | systemet                                   |
|            |            |                                            |
|            |            | XML-element: svk:deliveringSystemId\       |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| Exempel 29 |            |                                            |
| --         |            |                                            |
| Relaterat  |            |                                            |
| projekt    |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
|            |            |                                            |
| \<s        |            |                                            |
| vk:related |            |                                            |
| Projects\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:relate |            |                                            |
| dProject\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:name\> |            |                                            |
| Omläggning |            |                                            |
| av         |            |                                            |
| kyrktaket  |            |                                            |
| 2009\</    |            |                                            |
| svk:name\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:identi |            |                                            |
| ficator\>P |            |                                            |
| 2009:1\<   |            |                                            |
| /svk:ident |            |                                            |
| ificator\> |            |                                            |
|            |            |                                            |
| \<svk:de   |            |                                            |
| liveringSy |            |                                            |
| stemId\>34 |            |                                            |
| 958\</svk: |            |                                            |
| delivering |            |                                            |
| SystemId\> |            |                                            |
|            |            |                                            |
| \</        |            |                                            |
| svk:relate |            |                                            |
| dProject\> |            |                                            |
|            |            |                                            |
| \</s       |            |                                            |
| vk:related |            |                                            |
| Projects\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Relaterade | Samlingselement med referenser till        |
| ms-svk:130 | f          | fastigheter eller byggnader som handlingen |
|            | astigheter | relaterar till.                            |
|            |            |                                            |
|            |            | XML-element: svk:relatedRealEstates        |
+------------+------------+--------------------------------------------+
| er         | Relaterad  | Referens till fastighet eller byggnad som  |
| ms-svk:131 | fastighet  | handlingen relaterar till.                 |
|            |            |                                            |
|            |            | Elementet kan upprepas.                    |
|            |            |                                            |
|            |            | XML-element: svk:relatedRealEstate         |
+------------+------------+--------------------------------------------+
| er         | Fas        | Fastighetens eller byggnadens namn.        |
| ms-svk:132 | tighetsnam |                                            |
|            |            | Obligatoriskt om elementet Relaterad       |
|            |            | fastighet används.                         |
|            |            |                                            |
|            |            | XML-element: svk:name\                     |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Ide        | Fastighetsnummer eller annan identifikator |
| ms-svk:133 | ntifikator | för fastigheten eller byggnaden.           |
|            |            |                                            |
|            |            | Obligatoriskt om elementet Relaterad       |
|            |            | fastighet används.                         |
|            |            |                                            |
|            |            | XML-element: svk:identificatory\           |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Internt ID | Fastighetens eller byggnadens id-nummer i  |
| ms-svk:134 |            | det levererande systemet.                  |
|            |            |                                            |
|            |            | XML-element: svk:deliveringSystemId\       |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| Exempel 30 |            |                                            |
| --         |            |                                            |
| Relaterad  |            |                                            |
| fastighet  |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
|            |            |                                            |
| \<svk:     |            |                                            |
| relatedRea |            |                                            |
| lEstates\> |            |                                            |
|            |            |                                            |
| \<svk      |            |                                            |
| :relatedRe |            |                                            |
| alEstate\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:name\> |            |                                            |
| Omläggning |            |                                            |
| av         |            |                                            |
| kyrktaket  |            |                                            |
| 2009\</    |            |                                            |
| svk:name\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:identi |            |                                            |
| ficator\>P |            |                                            |
| 2009:1\<   |            |                                            |
| /svk:ident |            |                                            |
| ificator\> |            |                                            |
|            |            |                                            |
| \<svk:de   |            |                                            |
| liveringSy |            |                                            |
| stemId\>34 |            |                                            |
| 958\</svk: |            |                                            |
| delivering |            |                                            |
| SystemId\> |            |                                            |
|            |            |                                            |
| \</svk     |            |                                            |
| :relatedRe |            |                                            |
| alEstate\> |            |                                            |
|            |            |                                            |
| \</svk:    |            |                                            |
| relatedRea |            |                                            |
| lEstates\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | An         | Samlingselement för anteckningar kopplade  |
| ms-svk:135 | teckningar | till en handling.                          |
|            |            |                                            |
|            |            | XLM-element: svk:svkNotes                  |
+------------+------------+--------------------------------------------+
| e          | Anteckning | Enskild anteckning kopplad till            |
| rms-svk136 |            | handlingen.                                |
|            |            |                                            |
|            |            | XML-element: svk:svkNote                   |
+------------+------------+--------------------------------------------+
| er         | Typ av     | Obligatoriskt om elementet Anteckning      |
| ms-svk:137 | anteckning | används.                                   |
|            |            |                                            |
|            |            | Värdet väljs från [SVK-värdelista          |
|            |            | 10](#_SVK-VÄRDELISTA_10_–).                |
|            |            |                                            |
|            |            | XML-element: svk:svkNote/@typeOfNote\      |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Text       | Anteckningens lydelse.                     |
| ms-svk:138 |            |                                            |
|            |            | Obligatoriskt om elementet Anteckning      |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-defintion: svk:noteText\               |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Skapare av | Namn på den person som har gjort           |
| ms-svk:139 | anteckning | anteckningen.                              |
|            |            |                                            |
|            |            | Obligatoriskt om elementet Anteckning      |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: svk:noteAuthor\               |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Datum för  | Datum och tid när anteckningen gjordes.    |
| ms-svk:140 | anteckning |                                            |
|            |            | Obligatoriskt om elementet Anteckning      |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: svk:noteDate\                 |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 31 |            |                                            |
| --         |            |                                            |
| An         |            |                                            |
| teckningar |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
|            |            |                                            |
| \<svk:     |            |                                            |
| svkNotes\> |            |                                            |
|            |            |                                            |
| \<s        |            |                                            |
| vk:svkNote |            |                                            |
| t          |            |                                            |
| ypeOfNote= |            |                                            |
| \"Generell |            |                                            |
| ante       |            |                                            |
| ckning\"\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:noteT |            |                                            |
| ext\>Detta |            |                                            |
| är en      |            |                                            |
| anteckn    |            |                                            |
| ing\</svk: |            |                                            |
| noteText\> |            |                                            |
|            |            |                                            |
| \<sv       |            |                                            |
| k:noteAuth |            |                                            |
| or\>Jörgen |            |                                            |
| Persso     |            |                                            |
| n\</svk:no |            |                                            |
| teAuthor\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:noteDa |            |                                            |
| te\>2019-0 |            |                                            |
| 2-23T00:00 |            |                                            |
| :00\</svk: |            |                                            |
| noteDate\> |            |                                            |
|            |            |                                            |
| \</svk     |            |                                            |
| :svkNote\> |            |                                            |
|            |            |                                            |
| \</svk:    |            |                                            |
| svkNotes\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Avtalsi    | Samlingselement för extra information om   |
| ms-svk:141 | nfor­mation | registrerade avtal.                        |
|            |            |                                            |
|            |            | XML-element: svk:contractInfo              |
+------------+------------+--------------------------------------------+
| er         | Avsändares | Referens till avtalspartners exemplar av   |
| ms-svk:142 | referens   | avtalsdokumentet.                          |
|            |            |                                            |
|            |            | XML-element: svk:externalReference         |
|            |            |                                            |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Avropat    | Avropat värde.                             |
| ms-svk:143 | värde      |                                            |
|            |            | Kan endast anges i heltal.                 |
|            |            |                                            |
|            |            | XML-element: svk:callOffValue\             |
|            |            | Datatyp: integer                           |
+------------+------------+--------------------------------------------+
| er         | Valuta     | Valutaslag för Avropat värde.              |
| ms-svk:144 |            |                                            |
|            |            | Valutakod enligt ISO 4217. "SEK" är        |
|            |            | förvalt värde och behöver inte anges       |
|            |            | specifikt.                                 |
|            |            |                                            |
|            |            | XML-element: svk:callOffValue/@currency\   |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Kont       | Kontraktsvärde.                            |
| ms-svk:145 | raktsvärde |                                            |
|            |            | Kan endast anges i heltal.                 |
|            |            |                                            |
|            |            | XML-element: svk:contractValue\            |
|            |            | Datatyp: integer                           |
+------------+------------+--------------------------------------------+
| er         | Valuta     | Valutaslag för Kontraktsvärde.             |
| ms-svk:146 |            |                                            |
|            |            | Valutakod enligt ISO 4217. "SEK" är        |
|            |            | förvalt värde och behöver inte anges       |
|            |            | specifikt.                                 |
|            |            |                                            |
|            |            | XML-element: svk:callOffValue/@currency\   |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Avtalstyp  | Typ av avtal.                              |
| ms-svk:147 |            |                                            |
|            |            | Värdet väljs från [SVK-värdelista          |
|            |            | 16](#_SVK-VÄRDELISTA_16_–).                |
|            |            |                                            |
|            |            | XML-element: svk:typeOfAgreement\          |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Giltigt    | Datum från vilket avtalet är giltigt.      |
| ms-svk:148 | från       |                                            |
|            |            | Om elementet Giltigt från används, måste   |
|            |            | attributet dateType ha värdet "start".     |
|            |            |                                            |
|            |            | XML-element: dates/date\                   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | Giltigt    | Datum till vilket avtalet är giltigt.      |
| ms-svk:149 | till       |                                            |
|            |            | Om elementet Giltigt till används, måste   |
|            |            | attributet dateType ha värdet "end".       |
|            |            |                                            |
|            |            | XML-element: dates/date\                   |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| Exempel 32 |            |                                            |
| --         |            |                                            |
| Avtalsi    |            |                                            |
| nformation |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
|            |            |                                            |
| \<svk:cont |            |                                            |
| ractInfo\> |            |                                            |
|            |            |                                            |
| \<svk:ex   |            |                                            |
| ternalRefe |            |                                            |
| rence\>ref |            |                                            |
| 3453\</svk |            |                                            |
| :externalR |            |                                            |
| eference\> |            |                                            |
|            |            |                                            |
| \<svk:ca   |            |                                            |
| llOffValue |            |                                            |
| curr       |            |                                            |
| ency=\"SEK |            |                                            |
| \"\>34000\ |            |                                            |
| </svk:call |            |                                            |
| OffValue\> |            |                                            |
|            |            |                                            |
| \<svk:con  |            |                                            |
| tractValue |            |                                            |
| curre      |            |                                            |
| ncy=\"SEK\ |            |                                            |
| "\>45000\< |            |                                            |
| /svk:contr |            |                                            |
| actValue\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:typeOf |            |                                            |
| Agreement\ |            |                                            |
| >Avtal\</s |            |                                            |
| vk:typeOfA |            |                                            |
| greement\> |            |                                            |
|            |            |                                            |
| \<dates\>  |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateType   |            |                                            |
| =\"start\" |            |                                            |
| \>2018-02- |            |                                            |
| 12T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \<date     |            |                                            |
| dateTy     |            |                                            |
| pe=\"end\" |            |                                            |
| \>2019-02- |            |                                            |
| 12T00:00:0 |            |                                            |
| 0\</date\> |            |                                            |
|            |            |                                            |
| \</dates\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| </svk:cont |            |                                            |
| ractInfo\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
+------------+------------+--------------------------------------------+
| er         | Bifogad    | Uppgifter om fil som är kopplad till den   |
| ms-svk:150 | fil        | registrerade handlingen.                   |
|            |            |                                            |
|            |            | Se [Tabell 6](#_Tabell_6._Bifogade).       |
+------------+------------+--------------------------------------------+
| er         | Än         | Samlingselement för loggningsuppgifter.    |
| ms-svk:151 | dringslogg |                                            |
|            |            | XML-element: svk:auditLogEvents            |
+------------+------------+--------------------------------------------+
| er         | Händelse   | Enskild händelse i ändringsloggen.         |
| ms-svk:152 |            |                                            |
|            |            | Obligatoriskt om elementet Ändringslogg    |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: svk:auditLogEvent             |
+------------+------------+--------------------------------------------+
| er         | Tid        | Datum och tid då ändringen gjordes.        |
| ms-svk:153 |            |                                            |
|            |            | Obligatoriskt om elementet Händelse        |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: svk:time\                     |
|            |            | Datatyp: dateTime                          |
+------------+------------+--------------------------------------------+
| er         | Användare  | Namn på den person som gjorde ändringen.   |
| ms-svk:154 |            |                                            |
|            |            | Obligatoriskt om elementet Händelse        |
|            |            | används.                                   |
|            |            |                                            |
|            |            | XML-element: svk:user\                     |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Tillämpn   | Beskrivning av det som ändringen avser.    |
| ms-svk:155 | ings­område |                                            |
|            |            | Obligatoriskt om elementet Händelse        |
|            |            | används.                                   |
|            |            |                                            |
|            |            | Värdet väljs från [SVK-värdelista          |
|            |            | 11](#_SVK-VÄRDELISTA_11_–).                |
|            |            |                                            |
|            |            | XML-element: svk:scope\                    |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Händelse   | Beskrivning av ändring.                    |
| ms-svk:156 |            |                                            |
|            |            | Obligatoriskt om elementet Händelse        |
|            |            | används.                                   |
|            |            |                                            |
|            |            | Värdet väljs från värdelistan              |
|            |            | [SVK-värdelista                            |
|            |            | 12](#_SVK-VÄRDELISTA_12_–).                |
|            |            |                                            |
|            |            | XML-element: svk:action\                   |
|            |            | Datatyp: token                             |
+------------+------------+--------------------------------------------+
| er         | Värde före | Om ett värde har ändrats, anges här        |
| ms-svk:157 | ändring    | lydelsen före ändringen.                   |
|            |            |                                            |
|            |            | XML-element: svk:valueBeforeChange\        |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| er         | Värde      | Om ett värde har ändrats, anges här        |
| ms-svk:158 | efter      | lydelsen efter ändringen.                  |
|            | ändring    |                                            |
|            |            | XML-element: svk:valueAfterChange\         |
|            |            | Datatyp: string                            |
+------------+------------+--------------------------------------------+
| Exempel 33 |            |                                            |
| --         |            |                                            |
| Än         |            |                                            |
| dringslogg |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:auditL |            |                                            |
| ogEvents\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \<sv       |            |                                            |
| k:time\>20 |            |                                            |
| 09-09-22T1 |            |                                            |
| 1:47:00\</ |            |                                            |
| svk:time\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:user\> |            |                                            |
| Jörgen     |            |                                            |
| Persson\</ |            |                                            |
| svk:user\> |            |                                            |
|            |            |                                            |
| \<s        |            |                                            |
| vk:scope\> |            |                                            |
| ärende\</s |            |                                            |
| vk:scope\> |            |                                            |
|            |            |                                            |
| \<svk      |            |                                            |
| :action\>c |            |                                            |
| reate\</sv |            |                                            |
| k:action\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \<sv       |            |                                            |
| k:time\>20 |            |                                            |
| 09-09-22T1 |            |                                            |
| 1:52:00\</ |            |                                            |
| svk:time\> |            |                                            |
|            |            |                                            |
| \<svk:us   |            |                                            |
| er\>Jörgen |            |                                            |
| Persson\</ |            |                                            |
| svk:user\> |            |                                            |
|            |            |                                            |
| \<svk:sco  |            |                                            |
| pe\>ärende |            |                                            |
| mening\</s |            |                                            |
| vk:scope\> |            |                                            |
|            |            |                                            |
| \<svk      |            |                                            |
| :action\>u |            |                                            |
| pdate\</sv |            |                                            |
| k:action\> |            |                                            |
|            |            |                                            |
| \<svk:     |            |                                            |
| valueBefor |            |                                            |
| eChange\>U |            |                                            |
| pphandling |            |                                            |
| av         |            |                                            |
| frysb      |            |                                            |
| oxar\</svk |            |                                            |
| :valueBefo |            |                                            |
| reChange\> |            |                                            |
|            |            |                                            |
| \<svk      |            |                                            |
| :valueAfte |            |                                            |
| rChange\>U |            |                                            |
| pphandling |            |                                            |
| av         |            |                                            |
| ky         |            |                                            |
| lskåp\</sv |            |                                            |
| k:valueAft |            |                                            |
| erChange\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \          |            |                                            |
| <svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \<sv       |            |                                            |
| k:time\>20 |            |                                            |
| 09-09-22T1 |            |                                            |
| 2:10:00\</ |            |                                            |
| svk:time\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| svk:user\> |            |                                            |
| Jörgen     |            |                                            |
| Persson    |            |                                            |
| \</        |            |                                            |
| svk:user\> |            |                                            |
|            |            |                                            |
| \<s        |            |                                            |
| vk:scope\> |            |                                            |
| status\</s |            |                                            |
| vk:scope\> |            |                                            |
|            |            |                                            |
| \<svk      |            |                                            |
| :action\>u |            |                                            |
| pdate\</sv |            |                                            |
| k:action\> |            |                                            |
|            |            |                                            |
| \<svk:     |            |                                            |
| valueBefor |            |                                            |
| eChange\>Ö |            |                                            |
| ppet\</svk |            |                                            |
| :valueBefo |            |                                            |
| reChange\> |            |                                            |
|            |            |                                            |
| \<svk:va   |            |                                            |
| lueAfterCh |            |                                            |
| ange\>Maku |            |                                            |
| lerat\</sv |            |                                            |
| k:valueAft |            |                                            |
| erChange\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:audit |            |                                            |
| LogEvent\> |            |                                            |
|            |            |                                            |
| \</        |            |                                            |
| svk:auditL |            |                                            |
| ogEvents\> |            |                                            |
|            |            |                                            |
| \<         |            |                                            |
| /svk:ermsS |            |                                            |
| vkRecord\> |            |                                            |
+------------+------------+--------------------------------------------+

Information om bifogade filer

I ERMS används för bifogade filer elementet
record/additionalInformation/appendix.

I Svenska kyrkans anpassning av ERMS används i stället tilläggselementet
record/additional­Information/additionalXMLData/ermsSvkRecord/svkAppendix.

[]{#_Tabell_6._Bifogade .anchor}Tabell 6. Bifogade filer

+-----------+-------------+--------------------------------------------+
| ID        | Element     |                                            |
+===========+=============+============================================+
| erm       | Bifogad fil | Samlingselement för uppgifter om en fil    |
| s-svk:159 |             | som är kopplad till en registrerad         |
|           |             | handling.                                  |
|           |             |                                            |
|           |             | XML-element:                               |
|           |             | svk:ermsSvkRecord/svk:svkAppendix          |
+-----------+-------------+--------------------------------------------+
| erm       | Appendix    | Samlingselement för den information om     |
| s-svk:160 |             | filen som följer ERMS-standard.            |
|           |             |                                            |
|           |             | XML-element: appendix                      |
+-----------+-------------+--------------------------------------------+
| erm       | G           | Med gallringsbar avses här att den         |
| s-svk:161 | allringsbar | bifogade filen kan gallras innan           |
|           |             | dokumentet i sig gallras. Kan gälla t.ex.  |
|           |             | filer som bevaras i produktionsformat      |
|           |             |                                            |
|           |             | Värdet kan vara: true, false, 1 (som       |
|           |             | motsvarar true) eller 0 (som motsvarar     |
|           |             | false).                                    |
|           |             |                                            |
|           |             | XML-element: appendix/@disposable\         |
|           |             | Datatyp: boolean                           |
+-----------+-------------+--------------------------------------------+
| erm       | Namn        | Filens namn.                               |
| s-svk:162 |             |                                            |
|           |             | Obligatoriskt.                             |
|           |             |                                            |
|           |             | XML-element: appendix/@name\               |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Beskrivning | Beskrivning av filen.                      |
| s-svk:163 |             |                                            |
|           |             | XML-element: appendix/@description\        |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Filformat   | Filens format.                             |
| s-svk:164 |             |                                            |
|           |             | Obligatoriskt.                             |
|           |             |                                            |
|           |             | Anges i form av filnamnsändelse (max fyra  |
|           |             | tecken) utan punkt och med små bokstäver.  |
|           |             |                                            |
|           |             | Exempel: pdf, png, txt                     |
|           |             |                                            |
|           |             | XML-element: appendix/@fileFormat\         |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Origin      | Om filen är konverterad till arkivformat,  |
| s-svk:165 | alfil­format | anges här originalfilens format.           |
|           |             |                                            |
|           |             | Anges i form av filnamnsändelse utan punkt |
|           |             | och med små bokstäver.                     |
|           |             |                                            |
|           |             | Exempel: docx, xlsx, msg                   |
|           |             |                                            |
|           |             | XML-element: appendix/@originalFileFormat\ |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Sökväg      | Relativ sökväg till filens placering i     |
| s-svk:166 |             | informationspaketet.                       |
|           |             |                                            |
|           |             | Obligatoriskt.                             |
|           |             |                                            |
|           |             | Exempel: files/document_01.pdf             |
|           |             |                                            |
|           |             | XML-element: appendix/@path\               |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Uppgift om  | Anger om det har funnits en e-signatur som |
| s-svk:167 | e-signatur  | gallrats före leverans.                    |
|           |             |                                            |
|           |             | Värdet kan vara: true, false, 1 (som       |
|           |             | motsvarar true) eller 0 (som motsvarar     |
|           |             | false).                                    |
|           |             |                                            |
|           |             | XML-element:                               |
|           |             | appendix/@eSignatureHasExisted\            |
|           |             | Datatyp: boolean                           |
+-----------+-------------+--------------------------------------------+
| erm       | E-signatur  | Samlingselement för information om         |
| s-svk:168 |             | befintlig e-signatur.                      |
|           |             |                                            |
|           |             | XML-element: eSignature                    |
+-----------+-------------+--------------------------------------------+
| erm       | E-signatur  | Anger om det finns en e-signatur.          |
| s-svk:169 | finns       |                                            |
|           |             | Obligatoriskt om elementent E-signatur     |
|           |             | används.                                   |
|           |             |                                            |
|           |             | Värdet kan vara: true, false, 1 (som       |
|           |             | motsvarar true) eller 0 (som motsvarar     |
|           |             | false).                                    |
|           |             |                                            |
|           |             | XML-element: eSignature/@present\          |
|           |             | Datatyp: boolean                           |
+-----------+-------------+--------------------------------------------+
| erm       | Verifik     | Datum och tid då e-signaturen senast       |
| s-svk:170 | ations­datum | verifierades.                              |
|           |             |                                            |
|           |             | XML-element:                               |
|           |             | eSignature/@dateSignatureIsVerified\       |
|           |             | Datatyp: dateTime                          |
+-----------+-------------+--------------------------------------------+
| erm       | Signatur    | Element för filens e-signatur med dess     |
| s-svk:171 |             | eget XML-schema.                           |
|           |             |                                            |
|           |             | Leveransöverenskommelsen ska innehålla     |
|           |             | information om hur e-signaturer lagras och |
|           |             | om vilket schema som används.              |
|           |             |                                            |
|           |             | XML-element: signature                     |
+-----------+-------------+--------------------------------------------+
| Exempel   |             |                                            |
| 34 --     |             |                                            |
| Bifogad   |             |                                            |
| fil       |             |                                            |
|           |             |                                            |
| \         |             |                                            |
| <svk:svkA |             |                                            |
| ppendix\> |             |                                            |
|           |             |                                            |
| \<svk     |             |                                            |
| :appendix |             |                                            |
| name=\"   |             |                                            |
| ansökan\" |             |                                            |
| path=\"f  |             |                                            |
| iler/ansö |             |                                            |
| kan.pdf\" |             |                                            |
| fi        |             |                                            |
| leFormat= |             |                                            |
| \"pdf\"\> |             |                                            |
|           |             |                                            |
| \<e       |             |                                            |
| Signature |             |                                            |
| present   |             |                                            |
| =\"true\" |             |                                            |
| datee     |             |                                            |
| Signature |             |                                            |
| IsVerifie |             |                                            |
| d=\"2020- |             |                                            |
| 03-04T00: |             |                                            |
| 00:00\"\> |             |                                            |
|           |             |                                            |
| \<si      |             |                                            |
| gnature\> |             |                                            |
|           |             |                                            |
| \<        |             |                                            |
| Signature |             |                                            |
| xmlns=\"h |             |                                            |
| ttp://www |             |                                            |
| .w3.org/2 |             |                                            |
| 000/09/xm |             |                                            |
| ldsig#\"\ |             |                                            |
| xs        |             |                                            |
| i:schemaL |             |                                            |
| ocation=\ |             |                                            |
| "http://w |             |                                            |
| ww.w3.org |             |                                            |
| /2000/09/ |             |                                            |
| xmldsig#\ |             |                                            |
| https://  |             |                                            |
| www.w3.or |             |                                            |
| g/TR/2002 |             |                                            |
| /REC-xmld |             |                                            |
| sig-core- |             |                                            |
| 20020212/ |             |                                            |
| xmldsig-c |             |                                            |
| ore-schem |             |                                            |
| a.xsd\"\> |             |                                            |
|           |             |                                            |
| \<Sig     |             |                                            |
| nedInfo\> |             |                                            |
|           |             |                                            |
| \<Cano    |             |                                            |
| nicalizat |             |                                            |
| ionMethod |             |                                            |
| Algori    |             |                                            |
| thm=\"htt |             |                                            |
| p://www.w |             |                                            |
| 3.org/TR/ |             |                                            |
| 2001/REC- |             |                                            |
| xml-c14n- |             |                                            |
| 2001      |             |                                            |
| 0315\"/\> |             |                                            |
|           |             |                                            |
| \<Signat  |             |                                            |
| ureMethod |             |                                            |
| Algor     |             |                                            |
| ithm=\"ht |             |                                            |
| tp://www. |             |                                            |
| w3.org/20 |             |                                            |
| 00/09/xml |             |                                            |
| dsig#rsa- |             |                                            |
| sha1\"/\> |             |                                            |
|           |             |                                            |
| \<        |             |                                            |
| Reference |             |                                            |
| URI=\"#o  |             |                                            |
| bject\"\> |             |                                            |
|           |             |                                            |
| \<Dig     |             |                                            |
| estMethod |             |                                            |
| A         |             |                                            |
| lgorithm= |             |                                            |
| \"http:// |             |                                            |
| www.w3.or |             |                                            |
| g/2000/09 |             |                                            |
| /xmldsig# |             |                                            |
| sha1\"/\> |             |                                            |
|           |             |                                            |
| \<Dig     |             |                                            |
| estValue\ |             |                                            |
| >OPnpF/ZN |             |                                            |
| LDxJ/I+1F |             |                                            |
| 3iHhlmSwg |             |                                            |
| o=\</Dige |             |                                            |
| stValue\> |             |                                            |
|           |             |                                            |
| \</Re     |             |                                            |
| ference\> |             |                                            |
|           |             |                                            |
| \</Sig    |             |                                            |
| nedInfo\> |             |                                            |
|           |             |                                            |
| \         |             |                                            |
| <Signatur |             |                                            |
| eValue\>n |             |                                            |
| ihUFQg4mD |             |                                            |
| hLgecvhIc |             |                                            |
| Kb9Gz8VRT |             |                                            |
| Olw+adiZO |             |                                            |
| BBXgK4Jod |             |                                            |
| Ee5aFfCqm |             |                                            |
| 8WcRIT8GL |             |                                            |
|           |             |                                            |
| L         |             |                                            |
| XSk8PsUP4 |             |                                            |
| //SsKqUBQ |             |                                            |
| kpotcAqQA |             |                                            |
| htz2v9kCW |             |                                            |
| doUDnAOtF |             |                                            |
| Zkd/CnsZ1 |             |                                            |
| sge0ndha4 |             |                                            |
|           |             |                                            |
| 0wWDV+nOW |             |                                            |
| yJxkYgicv |             |                                            |
| B8POYtSml |             |                                            |
| dLLepPGMz |             |                                            |
| +J7/Uws=\ |             |                                            |
| </Signatu |             |                                            |
| reValue\> |             |                                            |
|           |             |                                            |
| \<        |             |                                            |
| KeyInfo\> |             |                                            |
|           |             |                                            |
| \<K       |             |                                            |
| eyValue\> |             |                                            |
|           |             |                                            |
| \<RSAK    |             |                                            |
| eyValue\> |             |                                            |
|           |             |                                            |
| \<Modul   |             |                                            |
| us\>4IlzO |             |                                            |
| Y3Y9fXoh3 |             |                                            |
| Y5f06wBbt |             |                                            |
| Tg94Pt6vc |             |                                            |
| fcd1KQ0FL |             |                                            |
| m0S36aGJt |             |                                            |
|           |             |                                            |
| TSb       |             |                                            |
| 6pYKfyX7P |             |                                            |
| qCUQ8wgL6 |             |                                            |
| xUJ5GRPEs |             |                                            |
| u9gyz8Zob |             |                                            |
| wfZsGCsvu |             |                                            |
| 40CWoT9fc |             |                                            |
| FBZPfXro1 |             |                                            |
|           |             |                                            |
| Vtlh/     |             |                                            |
| xl/yYHm+G |             |                                            |
| zqh0Bw76x |             |                                            |
| tLHSfLfpV |             |                                            |
| OrmZdwKmS |             |                                            |
| FKMTvNXOF |             |                                            |
| d0V18=\</ |             |                                            |
| Modulus\> |             |                                            |
|           |             |                                            |
| \<        |             |                                            |
| Exponent\ |             |                                            |
| >AQAB\</E |             |                                            |
| xponent\> |             |                                            |
|           |             |                                            |
| \</RSAK   |             |                                            |
| eyValue\> |             |                                            |
|           |             |                                            |
| \</K      |             |                                            |
| eyValue\> |             |                                            |
|           |             |                                            |
| \</       |             |                                            |
| KeyInfo\> |             |                                            |
|           |             |                                            |
| \<Object  |             |                                            |
| I         |             |                                            |
| d=\"objec |             |                                            |
| t\"\>some |             |                                            |
| text      |             |                                            |
|           |             |                                            |
| with      |             |                                            |
| spaces    |             |                                            |
| and       |             |                                            |
| CR-LF.\<  |             |                                            |
| /Object\> |             |                                            |
|           |             |                                            |
| \</Si     |             |                                            |
| gnature\> |             |                                            |
|           |             |                                            |
| \</si     |             |                                            |
| gnature\> |             |                                            |
|           |             |                                            |
| \</eSi    |             |                                            |
| gnature\> |             |                                            |
|           |             |                                            |
| \</svk:a  |             |                                            |
| ppendix\> |             |                                            |
|           |             |                                            |
| \<        |             |                                            |
| /svk:svkA |             |                                            |
| ppendix\> |             |                                            |
+-----------+-------------+--------------------------------------------+
| erm       | Fil         | Samlingselement för utökad information om  |
| s-svk:172 | information | filen.                                     |
|           |             |                                            |
|           |             | (Tillägg till ERMS-standard)               |
|           |             |                                            |
|           |             | XML-element: svk:fileInfo                  |
+-----------+-------------+--------------------------------------------+
| erm       | Skapad      | Datum och tid då filen skapades            |
| s-svk:173 |             | (systeminformation).                       |
|           |             |                                            |
|           |             | XML-element: svk:dateCreated\              |
|           |             | Datatyp: dateTime                          |
+-----------+-------------+--------------------------------------------+
| erm       | Senast      | Datum och tid då filen senast ändrades     |
| s-svk:174 | ändrad      | (systeminformation).                       |
|           |             |                                            |
|           |             | XML-element: svk:dateLastEdited\           |
|           |             | Datatyp: dateTime                          |
+-----------+-------------+--------------------------------------------+
| erm       | Ver         | Om flera versioner av samma fil är         |
| s-svk:175 | sions­nummer | kopplade till handlingen, anges unikt      |
|           |             | versionsnummer här.                        |
|           |             |                                            |
|           |             | Versionsnumreringen kan enbart anges med   |
|           |             | heltal.                                    |
|           |             |                                            |
|           |             | XML-element: svk:versionNumber\            |
|           |             | Datatyp: integer                           |
+-----------+-------------+--------------------------------------------+
| erm       | Variant     | Om flera varianter av samma version är     |
| s-svk:176 |             | kopplade till handlingen, anges unik       |
|           |             | variant här.                               |
|           |             |                                            |
|           |             | Värdet väljs från värdelistan              |
|           |             | [SVK-värdelista                            |
|           |             | 17](#_SVK-VÄRDELISTA_17_–).                |
|           |             |                                            |
|           |             | XML-element: svk:variant\                  |
|           |             | Datatyp: token                             |
+-----------+-------------+--------------------------------------------+
| Exempel   |             |                                            |
| 35 --     |             |                                            |
| Filin     |             |                                            |
| formation |             |                                            |
|           |             |                                            |
| \         |             |                                            |
| <svk:svkA |             |                                            |
| ppendix\> |             |                                            |
|           |             |                                            |
| \<svk:f   |             |                                            |
| ileInfo\> |             |                                            |
|           |             |                                            |
| \<sv      |             |                                            |
| k:dateCre |             |                                            |
| ated\>201 |             |                                            |
| 0-02-01T0 |             |                                            |
| 0:00:00\< |             |                                            |
| /svk:date |             |                                            |
| Created\> |             |                                            |
|           |             |                                            |
| \         |             |                                            |
| <svk:date |             |                                            |
| LastEdite |             |                                            |
| d\>2010-0 |             |                                            |
| 2-01T00:0 |             |                                            |
| 0:00\</sv |             |                                            |
| k:dateLas |             |                                            |
| tEdited\> |             |                                            |
|           |             |                                            |
| \<svk:ve  |             |                                            |
| rsionNumb |             |                                            |
| er\>1\</s |             |                                            |
| vk:versio |             |                                            |
| nNumber\> |             |                                            |
|           |             |                                            |
| \<svk:v   |             |                                            |
| ariant\>p |             |                                            |
| reservati |             |                                            |
| on\</svk: |             |                                            |
| variant\> |             |                                            |
|           |             |                                            |
| \</svk:f  |             |                                            |
| ileInfo\> |             |                                            |
+-----------+-------------+--------------------------------------------+
| erm       | Ä           | Samlingselement för loggningsuppgifter.    |
| s-svk:177 | ndringslogg |                                            |
|           |             | XML-element: svk:auditLogEvents            |
+-----------+-------------+--------------------------------------------+
| erm       | Händelse    | Enskild händelse i ändringsloggen.         |
| s-svk:178 |             |                                            |
|           |             | Obligatorisk om elementet Ändringslogg     |
|           |             | används.                                   |
|           |             |                                            |
|           |             | XML-element: svk:auditLogEvent             |
+-----------+-------------+--------------------------------------------+
| erm       | Tid         | Datum och tid då ändringen gjordes.        |
| s-svk:179 |             |                                            |
|           |             | Obligatorisk om elementet Händelse         |
|           |             | används.                                   |
|           |             |                                            |
|           |             | XML-element: svk:time\                     |
|           |             | Datatyp: dateTime                          |
+-----------+-------------+--------------------------------------------+
| erm       | Användare   | Namn på personen som gjorde ändringen.     |
| s-svk:180 |             |                                            |
|           |             | Obligatorisk om elementet Händelse         |
|           |             | används.                                   |
|           |             |                                            |
|           |             | XML-element: svk:user\                     |
|           |             | Datatyp: token                             |
+-----------+-------------+--------------------------------------------+
| erm       | Tillämp     | Beskrivning av det som ändringen avser.    |
| s-svk:181 | nings­område |                                            |
|           |             | Obligatorisk om elementet Händelse         |
|           |             | används.                                   |
|           |             |                                            |
|           |             | Värdet väljs från [SVK-värdelista          |
|           |             | 11](#_SVK-VÄRDELISTA_11_–).                |
|           |             |                                            |
|           |             | XML-element: svk:scope\                    |
|           |             | Datatyp: token                             |
+-----------+-------------+--------------------------------------------+
| erm       | Händelse    | Beskrivning av ändring.                    |
| s-svk:182 |             |                                            |
|           |             | Obligatorisk om elementet Händelse         |
|           |             | används.                                   |
|           |             |                                            |
|           |             | Värdet väljs från värdelistan              |
|           |             | [SVK-värdelista                            |
|           |             | 12](#_SVK-VÄRDELISTA_12_–).                |
|           |             |                                            |
|           |             | XML-element: svk:action\                   |
|           |             | Datatype: token                            |
+-----------+-------------+--------------------------------------------+
| erm       | Värde före  | Om ett värde har ändrats, anges här        |
| s-svk:183 | ändring     | lydelsen före ändringen.                   |
|           |             |                                            |
|           |             | XML-element: svk:valueBeforeChange\        |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+
| erm       | Värde efter | Om ett värde har ändrats, anges här        |
| s-svk:184 | ändring     | lydelsen efter ändringen.                  |
|           |             |                                            |
|           |             | XML-element: svk:valueAfterChange\         |
|           |             | Datatyp: string                            |
+-----------+-------------+--------------------------------------------+

[]{#_Värdelistor .anchor}Värdelistor

[]{#_SVK-VÄRDELISTA_1_– .anchor}SVK-värdelista 1 -- Typ av identifikator
(erms-svk:2)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  aid                   ArkivbildarID                       ERMS-SVK

  arkivbildare          Arkivbildarens namn                 ERMS-SVK

  organisationsnummer   Tio siffror utan bindestreck.       ERMS-SVK

  ärendenummer          Ärendets beteckning (t.ex. F        ERMS-SVK
                        2020-0435)                          
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_2_– .anchor}SVK-värdelista 2 --
Klassificeringsstruktur (erms-svk:4)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  KlaSL2016_1.0         Klassificeringsstruktur för lokal   ERMS-SVK
                        nivå 1.0                            

  KlaSN2018_1.0         Klassificeringsstruktur för         ERMS-SVK
                        nationell nivå 1.0                  

  KlaSS2016_1.0         Klassificeringsstruktur för         ERMS-SVK
                        regional nivå 1.0                   
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_3_– .anchor}SVK-värdelista 3 -- XML-dokumentets
status (erms-svk:7)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  cancelled                                                 ERMS

  created                                                   ERMS

  deleted                                                   ERMS

  derived                                                   ERMS

  new                                                       ERMS

  revised                                                   ERMS

  unknown                                                   ERMS

  updated                                                   ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_4_– .anchor}SVK-värdelista 4 -- Typ av ID
(erms-svk:10)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  aid                   ArkivbildarID                       ERMS-SVK

  organisationsnummer                                       ERMS-SVK
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_5_– .anchor}SVK-värdelista 5 -- Typ av
underhållshändelse (erms-svk:16)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  cancelled                                                 ERMS

  created                                                   ERMS

  deleted                                                   ERMS

  derived                                                   ERMS

  revised                                                   ERMS

  unknown                                                   ERMS

  updated                                                   ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_6_– .anchor}SVK-värdelista 6 -- Typ av
utförare/aktör, agentType (erms-svk:19 m.fl. )

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  agent                 Används i betydelsen "Annan aktör". ERMS

  closer                Den som avslutar ett ärende.        ERMS-SVK

  counterpart           Ärendepart, extern part i ett       ERMS
                        ärende.                             

  creator               Skapare av ERMS-fil eller post i    ERMS
                        diariesystem.                       

  deliverer             Ansvarig för leverans till          ERMS
                        e-arkivet.                          

  editor                Används i betydelsen                ERMS
                        "Medhandläggare".                   

  receiver              Mottagare av en utgående handling.  ERMS

  responsible_person    Ansvarig för ett ärende eller       ERMS
                        handling.                           

  sender                Avsändare av en inkommen handling.  ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_7_– .anchor}SVK-värdelista 7 -- Ärende- och
handlingsstatus (erms-svk:35, erms-svk:101)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  closed                Om ärende: avslutat, stängt. Om     ERMS
                        handling: registrerad i betydelsen  
                        inkommen eller upprättad.           

  obliterated           Makulerad.                          ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_8_– .anchor}SVK-värdelista 8 -- Typ av idNumber
(erms-svk :3--48, erms-svk:110--114)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  användarnamn                                              ERMS-SVK

  organisationsnummer                                       ERMS-SVK

  personnummer                                              ERMS-SVK
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_9_– .anchor}SVK-värdelista 9 -- Initiativ
(erms-svk:62)

  ------------------------------------------------------------------------
  Giltiga värden        Kommentar                           Källa
  --------------------- ----------------------------------- --------------
  eget                                                      ERMS-SVK

  externt                                                   ERMS-SVK
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_10_– .anchor}SVK-värdelista 10 -- Typ av anteckning
(erms-svk:75, erms-svk:137)

  --------------------------------------------------------------------------
  Giltiga värden           Kommentar                          Källa
  ------------------------ ---------------------------------- --------------
  arkivanteckning                                             ERMS-SVK

  generell anteckning                                         ERMS-SVK

  intern anteckning                                           ERMS-SVK

  expedieringsanteckning                                      ERMS-SVK

  chattanteckning                                             ERMS-SVK
  --------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_11_– .anchor}

SVK-värdelista 11 -- Tillämpningsområde (erms-svk:83, erms-svk:155,
erms-svk:181)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  ankomstdatum                                              ERMS-SVK

  ansvarig                                                  ERMS-SVK

  anteckning                                                ERMS-SVK

  avsändare                                                 ERMS-SVK

  beskrivning                                               ERMS-SVK

  beslut                                                    ERMS-SVK

  dokumentnummer                                            ERMS-SVK

  dokumentreferens                                          ERMS-SVK

  dokumentstatus                                            ERMS-SVK

  dokumenttitel                                             ERMS-SVK

  expedieringsdatum                                         ERMS-SVK

  fastighet                                                 ERMS-SVK

  fil                                                       ERMS-SVK

  form                                                      ERMS-SVK

  handling                                                  ERMS-SVK

  handlingstyp                                              ERMS-SVK

  initiativ                                                 ERMS-SVK

  klassificering                                            ERMS-SVK

  kommentar                                                 ERMS-SVK

  medhandläggare                                            ERMS-SVK

  mottagare                                                 ERMS-SVK

  nyckelord                                                 ERMS-SVK

  projekt                                                   ERMS-SVK

  riktning                                                  ERMS-SVK

  sekretess                                                 ERMS-SVK

  ärende                                                    ERMS-SVK

  ärendemening                                              ERMS-SVK

  ärendenummer                                              ERMS-SVK

  ärendepart                                                ERMS-SVK

  ärendereferens                                            ERMS-SVK

  ärendestatus                                              ERMS-SVK
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_12_– .anchor}SVK-värdelista 12 -- Händelse
(erms-svk:84, erms-svk:156, svk-erms:182)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  create                                                    ERMS-SVK

  read                                                      ERMS-SVK

  update                                                    ERMS-SVK

  delete                                                    ERMS-SVK
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_13_– .anchor}

SVK-värdelista 13 -- Handlingstyp (erms-svk:89)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  ärendedokument                                            ERMS-SVK

  avtalsdokument                                            ERMS-SVK

                                                            
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_14_– .anchor}SVK-värdelista 14 -- Form (erms-svk:90)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  physical                                                  ERMS

  digital                                                   ERMS

  physical_and_digital                                      ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_15_– .anchor}SVK-värdelista 15 -- Riktning
(erms-svk:108)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  incoming               Om inkommen handling.              ERMS

  outgoing               Om handling som upprättats genom   ERMS
                         expediering.                       

  internal               Om handling som upprättats på      SVK-ERMS
                         annat sätt.                        
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_16_– .anchor}SVK-värdelista 16 -- Avtalstyp
(erms-svk:147)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  avtal                                                     SVK-ERMS

  kontrakt                                                  SVK-ERMS

  licens                                                    SVK-ERMS

  uppgörelse                                                SVK-ERMS

  överenskommelse                                           SVK-ERMS
  ------------------------------------------------------------------------

[]{#_SVK-VÄRDELISTA_17_– .anchor}SVK-värdelista 17 -- Variant
(erms-svk:147)

  ------------------------------------------------------------------------
  Giltiga värden         Kommentar                          Källa
  ---------------------- ---------------------------------- --------------
  arkivformat                                               

  offentligt format                                         

  produktionsformat                                         

  signerat dokument                                         

  visningsformat                                            
  ------------------------------------------------------------------------

Appendix

[]{#_XML-schema_ERMS-SVK-ARENDE.xsd .anchor}XML-schema
ERMS-SVK-ARENDE.xsd

[]{#_XML-schema:_ERMS-SVK-ARENDE-element .anchor}XML-schema:
ERMS-SVK-ARENDE-element.xsd

[]{#_Schematron:_ERMS-SVK-ARENDE.sch .anchor}Schematron:
ERMS-SVK-ARENDE.sch

Exempel på XML-fil

Arkivhandboken, kapitel 8. Om leverans till e-arkivet
