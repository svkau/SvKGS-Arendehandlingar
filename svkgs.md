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

<img src="media/image1.png" style="width:2.55208in;height:2.48208in"
alt="En bild som visar svart, mörker Automatiskt genererad beskrivning" />

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

<img src="media/image2.png" style="width:2.79656in;height:3.68056in"
alt="En bild som visar text, skärmbild, Teckensnitt, linje Automatiskt genererad beskrivning" />

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

<span id="_Scheman" class="anchor"></span>Scheman

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
kombination med detta. I elementet
<span class="mark">addit­ionalXMLData</span> tillåter ERMS att man
använder element från en annan namnrymd, och detta ut­nyttjas i
ERMS-SVK-ARENDE.xsd där element från ERMS-SVK-ARENDEN-element.xsd
import­eras.

ERMS-SVK-ARENDE.sch innehåller de regler som finns i ERMS.sch samt de
regler som är Svenska kyrkans anpassningar av element som ingår i ERMS.

Anpassningar som består av tillagda element regleras alltså i
ERMS-SVK-ARENDEN-element.xsd, och anpassningar som närmare definierar
befintliga element eller värdelistor regleras i ERMS-SVK-ARENDE.sch

De frivilliga element i ERMS som formellt inte ingår i SvKGS
Ärendehandlingar har inte tagits bort i ERMS-SVK-ARENDE.xsd, eftersom
det har varit önskvärt att detta schema ska vara överens­stämmande med
ERMS.xsd.

En särskild anmärkning om elementet <span class="mark">appendix</span> i
ERMS-SVK-ARENDE.xsd behöver göras. Ef­tersom det har funnits behov av att
utöka detta element med flera underelement, och då det inte finns något
element <span class="mark">additionalXMLData</span> här, används inte
<span class="mark">appendix</span> utan i stället ett eget element
<span class="mark">svkAppendix</span> som definieras i
ERMS-SVK-ARENDEN-element.xsd.

Elementet <span class="mark">appendix</span> finns fortfarande kvar i
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

<img src="media/image3.png" style="width:1.81563in;height:1.47653in" />

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

<span id="_Tabell_1._Kontroll" class="anchor"></span>Tabell 1. Kontroll

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 20%" />
<col style="width: 60%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>erms-svk</td>
<td>Schemaversion</td>
<td></td>
</tr>
<tr class="even">
<td><p>erms-svk:1</p>
<p>(ERMS1)</p></td>
<td>Identifikator</td>
<td><p>Identifierar ERMS-dokumentet</p>
<p>Obligatoriskt. Elementet får upprepas.</p>
<p>Två identifikatorer ska användas: arkivbildarens namn och ärendets
nummer. Se exempel nedan.</p>
<p>XML-element: identification<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:2</p>
<p>(ERMS2)</p></td>
<td>Typ av identifikator</td>
<td><p>Beskrivning av identifikatorn.</p>
<p>Obligatoriskt. Värdet välj från <a
href="#_SVK-VÄRDELISTA_1_–">SVK-värdelista 1</a>.</p>
<p>XML-element: identification/@identificationType<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 1 – Identifikator</p>
<p>&lt;control&gt;</p>
<p>&lt;identification identificationType="arkivbildare"&gt;Sunne
pastorat&lt;/identification&gt;</p>
<p>&lt;identification identificationType="ärendenummer"&gt;P
2019-0254&lt;/identification&gt;</p>
<p>&lt;/control&gt;</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:3</p>
<p>(ERMS3)</p></td>
<td>Informations-klassning</td>
<td><p>Informationsklass som baseras på säkerhetsklassificering</p>
<p>XML-element: informationClass<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:4</p>
<p>(ERMS4, ERMS5, ERMS6)</p></td>
<td>Klassificerings-struktur</td>
<td><p>Den klassificeringsstruktur som har använts vid klassificering av
det aktuella ärendet.</p>
<p>Obligatoriskt. Värdet väljs från <a
href="#_SVK-VÄRDELISTA_2_–">SVK-värdelista 2</a>.</p>
<p>XML-element: classificationSchema/<br />
textualDescriptionOfClassificationSchema/p<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 2 – Klassificeringsstruktur</p>
<p>&lt;control&gt;</p>
<p>&lt;classificationSchema&gt;</p>
<p>&lt;textualDescriptionOfClassificationSchema&gt;</p>
<p>&lt;p&gt;KlaSL2016_1.0&lt;/p&gt;</p>
<p>&lt;/textualDescriptionOfClassificationSchema&gt;</p>
<p>&lt;/classificationSchema&gt;</p>
<p>&lt;/control&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:5</p>
<p>(ERMS8)</p></td>
<td>Säkerhets­klassning</td>
<td><p>Säkerhetsklass.</p>
<p>XML-element: securityClass<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:6</p>
<p>(ERMS10)</p></td>
<td>Underhåll</td>
<td><p>Samlingselement för underhållsinformation som används för att
beskriva XML-dokumentets tillkomst och eventuella ändringar.</p>
<p>Obligatoriskt.</p>
<p>XML-element: maintenanceInformation</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:7</p>
<p>(ERMS11)</p></td>
<td>Status</td>
<td><p>XML-dokumentets status.</p>
<p>Obligatoriskt. Värdet väljs från värdelista <a
href="#_SVK-VÄRDELISTA_3_–">SVK-värdelista 3</a>.</p>
<p>För ett nyskapat dokument är värdet alltid ”new”.</p>
<p>XML-element: maintenanceStatus/@value<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:8</p>
<p>(ERMS12)</p></td>
<td>Skapare</td>
<td><p>Samlingselement med beskrivning av den instans som har skapat
XML-dokumentet.</p>
<p>Obligatoriskt.</p>
<p>XML-element: maintenanceAgency</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:9</p>
<p>(ERMS13)</p></td>
<td>Skapare ID</td>
<td><p>Identifierande kod för den instans som har skapat
XML-dokumentet.</p>
<p>Obligatoriskt.</p>
<p>XML-element: agencyCode<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:10</p>
<p>(ERMS14)</p></td>
<td>Typ av ID</td>
<td><p>Beskriver vilken typ av kod som har använts för att identifiera
skaparen av XML-dokumentet.</p>
<p>Obligatoriskt. Värdet väljs från värdelista <a
href="#_SVK-VÄRDELISTA_4_–">SVK-värdelista 4</a>.</p>
<p>XML-element: agencyCode/@type<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:11</p>
<p>(ERMS15)</p></td>
<td>Alternativt ID</td>
<td><p>Ytterligare en identifierande kod som kan användas vid behov.</p>
<p>XML-element: otherAgencyCode<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:12</p>
<p>(ERMS16)</p></td>
<td>Typ av alternativt ID</td>
<td><p>Samma som ovan (erms-svk:10)</p>
<p>Obligatoriskt om Alternativt ID används.</p>
<p>XML-element: otherAgencyCode/@type<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:13</p>
<p>(ERMS17)</p></td>
<td>Skapare Namn</td>
<td><p>Namn på den instans som har skapat XML-dokumentet.</p>
<p>Obligatoriskt.</p>
<p>XML-element: agencyName<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:14</p>
<p>(ERMS19)</p></td>
<td>Underhålls­historia</td>
<td><p>Samlingselement för dokumentets underhållshistoria.</p>
<p>Obligatoriskt.</p>
<p>XML-element: maintenanceHistory</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:15</p>
<p>(ERMS20)</p></td>
<td>Underhålls­händelse</td>
<td><p>En händelse i dokumentets underhållshistoria.</p>
<p>Obligatoriskt. Elementet kan upprepas.</p>
<p>När XML-dokumentet skapas, får det en Underhållshändelse av typen
”created”.</p>
<p>XML-element: maintenanceEvent</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:16</p>
<p>(ERMS21)</p></td>
<td>Typ av händelse</td>
<td><p>Typ av underhållshändelse.</p>
<p>Obligatoriskt. Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_5_–">SVK-värdelista 5</a>.</p>
<p>XML-element: eventType/@value<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:17</p>
<p>(ERMS22)</p></td>
<td>Datum för händelse</td>
<td><p>Datum då underhållshändelsen inträffade.</p>
<p>Obligatoriskt.</p>
<p>XML-element: eventDateTime<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:18</p>
<p>(ERMS23)</p></td>
<td>Utförare</td>
<td><p>Den agent som har utfört handlingen.</p>
<p>Obligatoriskt.</p>
<p>XML-element: agent</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:19</p>
<p>(ERMS93)</p></td>
<td>Typ av utförare</td>
<td><p>Anger vilken egenskap utföraren har i förhållande till den
utförda handlingen.</p>
<p>Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_6_–">SVK-värdelista 6</a>.</p>
<p>XML-element: agent/@agentType<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:20</p>
<p>(ERMS95)</p></td>
<td>Namn</td>
<td><p>Namn på den person eller organisation som har utfört
handlingen.</p>
<p>Obligatoriskt.</p>
<p>XML-element: agent/name<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:21</p>
<p>(ERMS99)</p></td>
<td>Organisation</td>
<td><p>Organisationstillhörighet.</p>
<p>Obligatoriskt om det är en person som är agent.</p>
<p>XML-element: agent/organisation<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 3 – Underhåll</p>
<p>&lt;control&gt;</p>
<p>&lt;maintenanceInformation&gt;</p>
<p>&lt;maintenanceStatus value="new"/&gt;</p>
<p>&lt;maintenanceAgency&gt;</p>
<p>&lt;agencyCode
type="organisationsnummer"&gt;1234567876&lt;/agencyCode&gt;</p>
<p>&lt;agencyName&gt;Kyrkostyrelsen&lt;/agencyName&gt;</p>
<p>&lt;/maintenanceAgency&gt;</p>
<p>&lt;maintenanceHistory&gt;</p>
<p>&lt;maintenanceEvent&gt;</p>
<p>&lt;eventType value="created"/&gt;</p>
<p>&lt;eventDateTime&gt;2001-12-17T09:30:47&lt;/eventDateTime&gt;</p>
<p>&lt;agent agentType="deliverer"&gt;</p>
<p>&lt;name&gt;Public 360&lt;/name&gt;</p>
<p>&lt;organisation&gt;Tietoevry&lt;/organisation&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;/maintenanceEvent&gt;</p>
<p>&lt;/maintenanceHistory&gt;</p>
<p>&lt;/maintenanceInformation&gt;</p>
<p>&lt;/control&gt;</p></td>
</tr>
</tbody>
</table>

Information om ärendeakter

<span id="_Tabell_2._Ärendeakter" class="anchor"></span>Tabell 2.
Ärendeakter

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 18%" />
<col style="width: 62%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>erms-svk:22</p>
<p>(ERMS198)</p></td>
<td>Ärendeakt</td>
<td><p>Samlingsobjekt för ärendeakten med ingående dokument och
filer.</p>
<p>Obligatoriskt.</p>
<p>Varje ärendeakt ska dokumenteras i en XML-fil, och ingen XML-fil får
innehålla mer än en ärendeakt.</p>
<p>XML-element: aggregation</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:23</p>
<p>(ERMS199)</p></td>
<td>Identifikator</td>
<td><p>Identifikator för ärendeakten i form av UUID. Identifikatorn
anges automatiskt redan i det levererande systemet eller vid överföring
till e-arkivet.</p>
<p>Obligatoriskt.</p>
<p>XML-element: aggregation/@systemIdentifier<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:24</p>
<p>(ERMS200)</p></td>
<td>Typ av aggre­gation</td>
<td><p>Typ av aggregation, vilket i den här specifikationen alltid är
”caseFile”, det vill säga ”ärendeakt”.</p>
<p>Obligatoriskt.</p>
<p>XML-element: aggregation/@aggregationType=”caseFile”<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 4 – Ärendeakt</p>
<p>&lt;aggregation
systemIdentifier="3b9fbc5f-3eaf-4521-9726-0f142feb04c3"
aggregationType="caseFile"&gt;</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:25</p>
<p>(ERMS218)</p></td>
<td>Ärende­nummer</td>
<td><p>Ärendets officiella nummer, ”diarienumret”.</p>
<p>Ärendenumret ska ha formatet [diariekod] [årtal]-[löpnummer].
Diariekoden ska bestå av versaler. Löpnumret ska bestå av fyra siffror
och fylls vid behov ut med nollor, t.ex. S 2019-0043.</p>
<p>Obligatoriskt.</p>
<p>XML-element: objectId<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:26</p>
<p>(ERMS219)</p></td>
<td>Intern identifi­kator</td>
<td><p>Befintligt id i det levererande systemet</p>
<p>Om elementet Intern identifikator används, måste attributet
extraIdType ha värdet ”deliveringSystemId”.</p>
<p>XML-element: extraId<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 5 – Ärendenummer och Intern identifikator</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;objectId&gt;F 2019-0032&lt;/objectId&gt;</p>
<p>&lt;extraId
extraIdType="deliveringSystemId"&gt;34565&lt;/extraId&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:27</p>
<p>(ERMS202)</p></td>
<td>Informations­klassning</td>
<td><p>Ärendets informationsklass.</p>
<p>XML-element: informationClass<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:28</p>
<p>(ERMS203)</p></td>
<td>Säkerhets­klassning</td>
<td><p>Ärendets säkerhetsklass.</p>
<p>XML-element: securityClass<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:29</p>
<p>(ERMS208)</p></td>
<td>Klassificering</td>
<td><p>Namnet på den process i den officiella klassificeringsstrukturen
som har angivits som klassificering av ärendet och de ingående
handlingarna.</p>
<p>XML-element: classification<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:30</p>
<p>(ERMS75)</p></td>
<td>Klassifice­ringskod</td>
<td><p>Koden för den process som angivits under Klassificering</p>
<p>XML-element: classification/@classificationCode<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 6 – Klassificering</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;classification classificationCode="2.7"&gt;Ge
service&lt;/classification&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:31</p>
<p>(ERMS223)</p></td>
<td>Nyckelord</td>
<td><p>Samlingselement för enskilda nyckelord.</p>
<p>XML-element: keywords</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:32</p>
<p>(ERMS224)</p></td>
<td>Nyckelord</td>
<td><p>Enskilt nyckelord.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: keyword<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 7 – Nyckelord</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;keywords&gt;</p>
<p>&lt;keyword&gt;församlingsordning&lt;/keyword&gt;</p>
<p>&lt;keyword&gt;kyrkorådet&lt;/keyword&gt;</p>
<p>&lt;/keywords&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:33</p>
<p>(ERMS209)</p></td>
<td>Ärendemening</td>
<td><p>Ärendemening, ärendets titel.</p>
<p>Obligatoriskt.</p>
<p>XML-element: title<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:34</p>
<p>(ERMS210)</p></td>
<td>Annan titel</td>
<td><p>Används endast för Offentlig titel i leveranser från Public
360°.</p>
<p>Om elementet Annan titel används måste attributet titleType ha värdet
”publicTitle”.</p>
<p>XML-element: otherTitle<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 8 – Ärendemening och Annan titel</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;title&gt;Ärendets titel&lt;/title&gt;</p>
<p>&lt;otherTitle titleType="publicTitle"&gt;En offentlig
titel&lt;/otherTitle&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:35</p>
<p>(ERMS239)</p></td>
<td>Ärendestatus</td>
<td><p>Ärendets status.</p>
<p>Obligatoriskt. Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_7_–">SVK-värdelista 7</a>.</p>
<p>Giltiga värden:”closed” (avslutat) eller ”obliterated”
(makulerat).</p>
<p>Exempel:</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;status <mark></mark>value="<mark>closed</mark>"/&gt;</p>
<p>&lt;/aggregation&gt;</p>
<p>XML-element: status/@value<br />
Datatype: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:36</p>
<p>(ERMS52, ERMS53)</p></td>
<td>Ärendereferens</td>
<td><p>Referens till och/eller från annat ärende.</p>
<p>Om möjligt anges det andra ärendets Ärendenummer enligt
specifikationen i detta dokument, annars ärendenumret i annat format
eller fritext.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Ärendereferens används, måste attributet relationType ha
värdet ”reference”.</p>
<p>XML-element: relation<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 9 – Ärendereferens</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;relation relationType="reference"&gt;F
2019-0454&lt;/relation&gt;</p>
<p>&lt;aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:37</p>
<p>(ERMS252,</p>
<p>ERMS43)</p></td>
<td>Utökad XML-data</td>
<td><p>Utökad XML-data är en del av Svenska kyrkans anpassning av
ERMS.</p>
<p>Se <a href="#_Tabell_3._Svenska">Tabell 3</a>.</p>
<p>XML-element: additionalXMLData</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:38</p>
<p>(ERMS253, ERMS57)</p></td>
<td>Sekretess</td>
<td><p>Samlingselement för uppgift om sekretess.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Sekretess används måste attributet restrictionType ha
värdet ”confidential”.</p>
<p>XML-element: restriction</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:39</p>
<p>(ERMS58)</p></td>
<td>Förklarande text</td>
<td><p>Fritext som beskriver sekretessen.</p>
<p>XML-element: explanatoryText<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:40</p>
<p>(ERMS59)</p></td>
<td>Lagrum</td>
<td><p>Hänvisning till paragraf i kyrkoordningens 54 kapitel, till
Offentlighets- och sekretesslagen eller till annat lagrum som stöder den
angivna sekretessen.</p>
<p>Obligatoriskt om elementet Sekretess används.</p>
<p>XML-element: regulation<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:41</td>
<td>Sekretess­datum</td>
<td><p>Datum då sekretessmarkeringen gjordes.</p>
<p>Om elementet Sekretessdatum används, måste attributet dateTyp ha
värdet ”created”</p>
<p>XML-element: dates/date<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 10 – Sekretess</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;restriction restrictionType="confidential"&gt;</p>
<p>&lt;explanatoryText&gt;Sekretess enligt
KO&lt;/explanatoryText&gt;</p>
<p>&lt;regulation&gt;KO 54:2&lt;/regulation&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;date dateType="created"&gt;2020-01-02T00:00:00&lt;/date&gt;</p>
<p>&lt;/dates&gt;</p>
<p>&lt;/restriction&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:42</p>
<p>(ERMS230-235)</p></td>
<td>Aktörer</td>
<td><p>Samlingselement för alla agerande parter i ärendet.</p>
<p>XML-element: agents</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:43</p>
<p>(ERMS230)</p></td>
<td>Skapare</td>
<td><p>Den som har skapat ärendet i systemet.</p>
<p>Om elementet Skapare används, måste agentType ha värdet
”creator”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="even">
<td>erms-svk:44</td>
<td>Handläggare</td>
<td><p>Ansvarig handläggare för ärendet.</p>
<p>Om elementet Handläggare används, måste agentType ha värdet
”responsible_person”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:45</p>
<p>(ERMS232)</p></td>
<td>Medhand­läggare</td>
<td><p>Eventuella medhandläggare utöver den ansvariga.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Medhandläggare används, måste agentType ha värdet
”editor”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="even">
<td>erms-svk:46</td>
<td>Ärendepart</td>
<td><p>Extern part i ärendet.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Ärendepart används, måste agentType ha värdet
”counterpart”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td>erms-svk:47</td>
<td>Annan aktör</td>
<td><p>Annan typ av aktör eller kontakt kopplad till ärendet.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Annan aktör används, måste agentType ha värdet
”agent”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="even">
<td>erms-svk:48</td>
<td>Avslutare</td>
<td><p>Den som har avslutat eller makulerat ärendet.</p>
<p>Om elementet Avslutare används, måste agentType ha värdet ”other” och
otherAgentType värdet ”closer”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 11 – Aktörer</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;agents&gt;</p>
<p>&lt;agent agentType="creator"&gt;</p>
<p>&lt;name&gt;Anna Andersson&lt;/name&gt;</p>
<p>&lt;idNumber idNumberType="username"&gt;svkanan&lt;/idNumber&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;agent agentType="responsible_person"&gt;</p>
<p>&lt;name&gt;Johan Göransson&lt;/name&gt;</p>
<p>&lt;idNumber idNumberType="username"&gt;svkjogo&lt;/idNumber&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;agent agentType="counterpart"&gt;</p>
<p>&lt;name&gt;Försäkringskassan&lt;/name&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;agent agentType="other" otherAgentType="closer"&gt;</p>
<p>&lt;name&gt;Erik Gustavsson&lt;/name&gt;</p>
<p>&lt;idNumber idNumberType="username"&gt;svkergu&lt;/idNumber&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;/agents&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:49</p>
<p>(ERMS211)</p></td>
<td>Beskrivning</td>
<td><p>En beskrivning av ärendet utöver Ärendemening.</p>
<p>XML-element: description<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:50</p>
<p>ERMS204-206</p></td>
<td>Datum</td>
<td><p>Samlingselement för datum som gäller för ärendet.</p>
<p>Alla datum har datatypen xs:dateTime i UTC-format, vilket betyder att
både datum och klocklag ned till sekundnivå ska anges. Om klockslag
saknas används noll-tecken. Tidszon anges inte men förutsätts vara
Europe/Stockholm.</p>
<p>[År]-[Månad]-[Dag]T[Timme]:[Minut]:[Sekund]</p>
<p>Exempel:<br />
2018-03-04T15:15:22<br />
2020-09-17T00:00:00</p>
<p>XML-element: dates</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:51</p>
<p>(ERMS232)</p></td>
<td>Skapat</td>
<td><p>Datum då ärendet skapades i systemet. Här avses ett av systemet
automatiskt satt datum.</p>
<p>Obligatoriskt.</p>
<p>Om uppgiften saknas i diariesystemet, används samma datum som för
Öppnat.</p>
<p>Om elementet Skapat används, måste dateType ha värdet ”created”.</p>
<p>XML-element: date/@dateType=”created”<br />
Datatyp: xs:dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:52</td>
<td>Öppnat</td>
<td><p>Datum då ärendet officiellt öppnades</p>
<p>Obligatoriskt.</p>
<p>Om elementet Öppnat används, måste dateType ha värdet ”opened”.</p>
<p>XML-element: date/@dateType=”opened”<br />
Datatyp: xs:dateTime</p></td>
</tr>
<tr class="even">
<td>erms-svk:53</td>
<td>Avslutat</td>
<td><p>Datum då ärendet avslutades eller makulerades.</p>
<p>Obligatoriskt.</p>
<p>Om elementet Avslutat används, måste dateType ha värdet ”closed”.</p>
<p>XML-element: date/@dateType=”closed”<br />
Datatyp: xs:dateTime</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 12 – Datum</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;date dateType="created"&gt;2020-05-20T00:00:00&lt;/date&gt;</p>
<p>&lt;date dateType="opened"&gt;2020-05-22T00:00:00&lt;/date&gt;</p>
<p>&lt;date dateType="closed"&gt;2020-05-30T00:00:00&lt;/date&gt;</p>
<p>&lt;/dates&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:54</p>
<p>(ERMS240)</p></td>
<td>Beslut i ärendet</td>
<td><p>Samlingselement som används för uppgifter om beslut som har
fattats i ärendet och som i diariesystemet har registrerats separat och
inte som en vanlig handling.</p>
<p>Elementet kan upprepas</p>
<p>XML-element: action</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:55</p>
<p>(ERMS84)</p></td>
<td>Beslutstext</td>
<td><p>Beslutets lydelse samt ev. referens till protokoll.</p>
<p>Om elementet Beslut i ärendet används, är detta element
obligatoriskt.</p>
<p>XML-element: actionText<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:56</p>
<p>(ERMS87)</p></td>
<td>Typ av händelse</td>
<td><p>Obligatoriskt om elementet Beslut i ärendet används</p>
<p>Elementet måste ha värdet ”beslut”.</p>
<p>XML-element: actionType<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:57</p>
<p>(ERMS89, ERMS47)</p></td>
<td>Beslutsdatum</td>
<td><p>Datum då beslutet fattades.</p>
<p>Om elementet Beslutsdatum används, måste dateType ha värdet
”decision_date”.</p>
<p>XML-element: dates/date/@dateType=”decision_date”<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:58</p>
<p>(ERMS90, ERMS91, ERMS93)</p></td>
<td>Beslutsfattare</td>
<td><p>Namn på person eller organ som har fattat beslutet</p>
<p>Underelementet agents används. Se exemplet nedan.</p>
<p>Om elementet Beslutsfattare används, måste agentType ha värdet
”other” och otherAgentType ha värdet ”decisionMaker”. Se exemplet
nedan.</p>
<p>XML-element: agents/agent/name<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 13 – Beslut i ärendet</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;action&gt;</p>
<p>&lt;actionText&gt;Beslutets lydelse&lt;/actionText&gt;</p>
<p>&lt;actionType&gt;beslut&lt;/actionType&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;actionDate
dateType="decision_date"&gt;2020-05-20T00:00:00&lt;/actionDate&gt;</p>
<p>&lt;/dates&gt;</p>
<p>&lt;agents&gt;</p>
<p>&lt;agent agentType="other" otherAgentType="decisionMaker"&gt;</p>
<p>&lt;name&gt;Kyrkorådet&lt;/name&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;/agents&gt;</p>
<p>&lt;/action&gt;</p>
<p>&lt;aggregation&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:59</p>
<p>(ERMS212, ERMS50)</p></td>
<td>Kommentar</td>
<td><p>Kommentar till ärendet.</p>
<p>Kommentaren utgörs av en enda sammanhängande text och är inte möjlig
att upprepa. Se exemplet nedan.</p>
<p>För upprepade kommentarer eller anteckningar används i stället
elementet svkNotes, se <a href="#_Tabell_3._Svenska">Tabell 3</a></p>
<p>Om elementet Kommentar används, måste noteType ha värdet
”comment”</p>
<p>XML-element: notes/note<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:60</p>
<p>(ERMS51)</p></td>
<td>Datum för kommentar</td>
<td><p>Datum då kommentaren skapades.</p>
<p>XML-element: notes/note/@noteDate<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 14 – Kommentar</p>
<p>&lt;aggregation&gt;</p>
<p>&lt;notes&gt;</p>
<p>&lt;note noteType="comment" noteDate="2019-02-21T00:00:00"&gt;Detta
är en kommentar&lt;/note&gt;</p>
<p>&lt;/notes&gt;</p>
<p>&lt;/aggregation&gt;</p></td>
</tr>
</tbody>
</table>

<span id="_Tabell_3._Svenska" class="anchor"></span>

Tabell 3. Svenska kyrkans tilläggsinformation om ärendeakter

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 64%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>erms-svk:61</td>
<td>Tilläggsin­formation</td>
<td><p>De element som inte ingår i ERMS utan är tillägg i Svenska
kyrkans anpassning är samlade i elementet Tilläggsinformation.</p>
<p>XML-element: additionalInformation/additionalXMLData/<br />
svk:ermsSvkArende/svk:ermsSvkAggregation</p></td>
</tr>
<tr class="even">
<td>erms-svk:62</td>
<td>Initiativ</td>
<td><p>Anger om initiativ till ärendets öppnande är externt (genom en
inkommande handling), eller om ärendet har öppnats på eget (internt)
initiativ.</p>
<p>Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_9_–">SVK-värdelista 9</a>.</p>
<p>Möjliga värden: ”externt”eller ”eget”</p>
<p>XML-element: svk:initiative<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:63</td>
<td>Relaterade projekt</td>
<td><p>Samlingselement med referenser till projekt som ärendet relaterar
till.</p>
<p>XML-element: svk:relatedProjects</p></td>
</tr>
<tr class="even">
<td>erms-svk:64</td>
<td>Relaterat projekt</td>
<td><p>Referens till projekt som ärendet relaterar till.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: svk:relatedProject</p></td>
</tr>
<tr class="odd">
<td>erms-svk:65</td>
<td>Projektnamn</td>
<td><p>Det relaterade projektets namn.</p>
<p>Obligatoriskt om elementet Relaterat projekt används.</p>
<p>XML-element: svk:name<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:66</td>
<td>Identifikator</td>
<td><p>Projektnummer eller annan identifikator för projektet.</p>
<p>Obligatoriskt om elementet Relaterat projekt används.</p>
<p>XML-element: svk:identificator<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:67</td>
<td>Internt ID</td>
<td><p>Projektets id-nummer i det levererande systemet</p>
<p>XML-element: svk:deliveringSystemId<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 15 – Relaterat projekt</p>
<p>&lt;svk:ermsSvkAggregation&gt;</p>
<p>&lt;svk:relatedProjects&gt;</p>
<p>&lt;svk:relatedProject&gt;</p>
<p>&lt;svk:name&gt;Omläggning av kyrktaket 2009&lt;/svk:name&gt;</p>
<p>&lt;svk:identificator&gt;P 2009:1&lt;/svk:identificator&gt;</p>
<p>&lt;svk:deliveringSystemId&gt;34958&lt;/svk:deliveringSystemId&gt;</p>
<p>&lt;/svk:relatedProject&gt;</p>
<p>&lt;/svk:relatedProjects&gt;</p>
<p>&lt;/svk:ermsSvkAggregation&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:68</td>
<td>Relaterade fastigheter</td>
<td><p>Samlingselement med referenser till fastigheter eller byggnader
som ärendet relaterar till.</p>
<p>XML-element: svk:relatedRealEstates</p></td>
</tr>
<tr class="even">
<td>erms-svk:69</td>
<td>Relaterad fastighet</td>
<td><p>Referens till fastighet eller byggnad som ärendet relaterar
till.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: svk:relatedRealEstate</p></td>
</tr>
<tr class="odd">
<td>erms-svk:70</td>
<td>Fastighetsnam</td>
<td><p>Fastighetens eller byggnadens namn.</p>
<p>Obligatoriskt om elementet Relaterad fastighet används.</p>
<p>XML-element: svk:name<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:71</td>
<td>Identifikator</td>
<td><p>Fastighetsnummer eller annan identifikator för fastigheten eller
byggnaden.</p>
<p>XML-element: svk:identificator<br />
Datatyp: token</p>
<p>Obligatoriskt om elementet Relaterad fastighet används.</p></td>
</tr>
<tr class="odd">
<td>erms-svk:72</td>
<td>Internt ID</td>
<td><p>Fastighetens eller byggnadens id-nummer i det levererande
systemet.</p>
<p>XML-element: svk:deliveringSystemId<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 16 – Relaterad fastighet</p>
<p>&lt;svk:ermsSvkAggregation&gt;</p>
<p>&lt;svk:relatedRealEstates&gt;</p>
<p>&lt;svk:relatedRealEstate&gt;</p>
<p>&lt;svk:name&gt;Omläggning av kyrktaket 2009&lt;/svk:name&gt;</p>
<p>&lt;svk:identificator&gt;P 2009:1&lt;/svk:identificator&gt;</p>
<p>&lt;svk:deliveringSystemId&gt;34958&lt;/svk:deliveringSystemId&gt;</p>
<p>&lt;/svk:relatedRealEstate&gt;</p>
<p>&lt;/svk:relatedRealEstates&gt;</p>
<p>&lt;/svk:ermsSvkAggregation&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:73</td>
<td>Anteckningar</td>
<td><p>Samlingselement för anteckningar kopplade till ett ärende.</p>
<p>XLM-element: svk:svkNotes</p></td>
</tr>
<tr class="even">
<td>erms-svk:74</td>
<td>Anteckning</td>
<td><p>Enskild anteckning kopplad till ärendet.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: svk:svkNote</p></td>
</tr>
<tr class="odd">
<td>erms-svk:75</td>
<td>Typ av anteckning</td>
<td><p>Obligatoriskt om elementet Anteckning används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_10_–">SVK-värdelista
10</a>.</p>
<p>XML-element: svk:svkNote/@typeOfNote<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:76</td>
<td>Text</td>
<td><p>Anteckningens lydelse.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-element: svk:noteText<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:77</td>
<td>Skapare av anteckning</td>
<td><p>Person som har gjort anteckningen.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-element: svk:noteAuthor<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:78</td>
<td>Datum för anteckning</td>
<td><p>Datum och tid när anteckningen gjordes.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-element: svk:noteDate<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 17 – Anteckningar</p>
<p>&lt;svk:ermsSvkAggregation&gt;</p>
<p>&lt;svk:svkNotes&gt;</p>
<p>&lt;svk:svkNote typeOfNote="generell anteckning"&gt;</p>
<p>&lt;svk:noteText&gt;Detta är en anteckning&lt;/svk:noteText&gt;</p>
<p>&lt;svk:noteAuthor&gt;Jörgen Persson&lt;/svk:noteAuthor&gt;</p>
<p>&lt;svk:noteDate&gt;2019-02-23T00:00:00&lt;/svk:noteDate&gt;</p>
<p>&lt;/svk:svkNote&gt;</p>
<p>&lt;/svk:svkNotes&gt;</p>
<p>&lt;/svk:ermsSvkAggregation&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:79</td>
<td>Ändringslogg</td>
<td><p>Samlingselement för loggningsuppgifter.</p>
<p>XML-element: svk:auditLogEvents</p></td>
</tr>
<tr class="odd">
<td>erms-svk:80</td>
<td>Händelse</td>
<td><p>Enskild händelse i ändringsloggen.</p>
<p>Obligatoriskt om elementet Ändringslogg används.</p>
<p>XML-element: svk:auditLogEvent</p></td>
</tr>
<tr class="even">
<td>erms-svk:81</td>
<td>Tid</td>
<td><p>Datum och tid då ändringen gjordes.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>XML-element: svk:time<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:82</td>
<td>Användare</td>
<td><p>Namn på personen som gjorde ändringen.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>XML-element: svk:user<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:83</td>
<td>Tillämpnings­område</td>
<td><p>Beskrivning av det som ändringen avser.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_11_–">SVK-värdelista
11</a>.</p>
<p>XML-element: svk:scope<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:84</td>
<td>Händelse</td>
<td><p>Beskrivning av ändringen.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_12_–">SVK-värdelista
12</a>.</p>
<p>XML-element: svk:action<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:85</td>
<td>Värde före ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen före ändringen.</p>
<p>XML-element: svk:valueBeforeChange<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:86</td>
<td>Värde efter ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen efter ändringen.</p>
<p>XML-element: svk:valueAfterChange<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 18 – Ändringslogg</p>
<p>&lt;svk:ermsSvkAggregation&gt;</p>
<p>&lt;svk:auditLogEvents&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T11:47:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt; Jörgen Persson&lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;ärende&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;create&lt;/svk:action&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T11:52:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt;Jörgen Persson&lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;ärendemening&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;update&lt;/svk:action&gt;</p>
<p>&lt;svk:valueBeforeChange&gt;Upphandling av
frysboxar&lt;/svk:valueBeforeChange&gt;</p>
<p>&lt;svk:valueAfterChange&gt;Upphandling av
kylskåp&lt;/svk:valueAfterChange&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T12:10:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt; Jörgen Persson &lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;ärendestatus&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;update&lt;/svk:action&gt;</p>
<p>&lt;svk:valueBeforeChange&gt;Öppet&lt;/svk:valueBeforeChange&gt;</p>
<p>&lt;svk:valueAfterChange&gt;Makulerat&lt;/svk:valueAfterChange&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;/svk:auditLogEvents&gt;</p>
<p>&lt;/svk:ermsSvkAggregation&gt;</p></td>
</tr>
</tbody>
</table>

Information om ärendehandlingar

<span id="_Tabell_4._Ärendehandlingar" class="anchor"></span>Tabell 4.
Ärendehandlingar

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 18%" />
<col style="width: 62%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>erms-svk:87</p>
<p>(ERMS129)</p></td>
<td>Handling</td>
<td><p>Samlingselement med information om en i ärendet registrerad
handling.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: record</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:88</p>
<p>(ERMS130)</p></td>
<td>Identifikator</td>
<td><p>Identifikator för dokumentet i form av UUID. Identifikatorn anges
automatiskt redan i det levererande systemet eller vid överföring till
e-arkivet.</p>
<p>Obligatoriskt.</p>
<p>XML-element: record/@systemIdentifier<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:89</p>
<p>(ERMS131)</p></td>
<td>Handlingstyp</td>
<td><p>Övergripande typ av handling. Motsvarar inte handlingstyp i
arkivredovisning/dokumenthanteringsplan.</p>
<p>Obligatoriskt. Värdet väljs från <a
href="#_SVK-VÄRDELISTA_13_–">SVK-värdelista 13</a>.</p>
<p>Oavsett handlingstyp kan värdet ”ärendedokument” alltid användas.</p>
<p>XML-element: record/@recordType<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:90</p>
<p>(ERMS132)</p></td>
<td>Form</td>
<td><p>Anger om handlingen bara finns i fysisk form, bara i digital form
eller både och.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_14_–">SVK-värdelista
14</a>.</p>
<p>XML-element: recordPhysicalOrDigital<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 19 – Handling</p>
<p>&lt;record<br />
systemIdentifier="8dbbdc56-8ada-4ad5-a1ec-b8131a1086a2"<br />
recordPhysicalOrDigital="digital"<br />
recordType="ärendedokument"&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:91</p>
<p>(ERMS146)</p></td>
<td>Dokument­nummer</td>
<td><p>En kombination av Ärendenummer (erms-svk:25) och dokumentets
löpnummer (erms-svk:102) med kolon emellan.</p>
<p>Obligatoriskt.</p>
<p>Exempel: S 2010-0034:1</p>
<p>XML-element: objectId<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:92</p>
<p>(ERMS148, ERMS149)</p></td>
<td>Intern identifi­kator</td>
<td><p>Befintligt id i det levererande systemet</p>
<p>Om elementet Intern identifikator används, måste attributet
extraIdType ha värdet ”deliveringSystemId”.</p>
<p>XML-element: extraId<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 20 – Dokumentnummer och Intern
identifikator</p>
<p>&lt;record&gt;</p>
<p>&lt;objectId&gt;C 1995-0032:1&lt;/objectId&gt;</p>
<p>&lt;extraId
extraIdType="deliveringSystemId"&gt;34565&lt;/extraId&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:93</p>
<p>(ERMS133)</p></td>
<td>Informa­tionsklass­ning</td>
<td><p>Handlingens informationsklass.</p>
<p>XML-element: informationClass<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:94</p>
<p>(ERMS134)</p></td>
<td>Säkerhets­klassning</td>
<td><p>Handlingens säkerhetsklass.</p>
<p>XML-element: securityClass<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:95</p>
<p>(ERMS196)</p></td>
<td>Klassificering</td>
<td><p>Namnet på den process i den officiella klassificeringsstrukturen
som har angivits som klassificering av ärendet och de ingående
handlingarna.</p>
<p>XML-element: classification<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:96</p>
<p>(ERMS75)</p></td>
<td>Klassifice­ringskod</td>
<td><p>Koden för den process som angivits under Klassificering</p>
<p>XML-element: classification/@classificationCode<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 21 – Klassificering</p>
<p>&lt;record&gt;</p>
<p>&lt;classification classificationCode="2.7"&gt;Ge
service&lt;/classification&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="even">
<td><p>erms-svk:97</p>
<p>(ERMS152)</p></td>
<td>Nyckelord</td>
<td><p>Samlingselement för enskilda nyckelord.</p>
<p>XML-element: keywords</p></td>
</tr>
<tr class="odd">
<td><p>erms-svk:98</p>
<p>(ERMS153)</p></td>
<td>Nyckelord</td>
<td><p>Enstaka nyckelord.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: keyword<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 22 – Nyckelord</p>
<p>&lt;record&gt;</p>
<p>&lt;keywords&gt;</p>
<p>&lt;keyword&gt;församlingsordning&lt;/keyword&gt;</p>
<p>&lt;keyword&gt;kyrkorådet&lt;/keyword&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:99</td>
<td>Titel</td>
<td><p>Titel eller en beskrivning av handlingen.</p>
<p>Obligatoriskt.</p>
<p>XML-element: title<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:100</td>
<td>Annan titel</td>
<td><p>Används enbart för Offentlig titel i leveranser från Public
360°.</p>
<p>Om elementet Annan titel används måste attributet titleType ha värdet
”publicTitle”.</p>
<p>XML-element: otherTitle<br />
@titleType=”publicTitle”<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 23 – Titel och Annan titel</p>
<p>&lt;record&gt;</p>
<p>&lt;title&gt;Handlingens titel&lt;/title&gt;</p>
<p>&lt;otherTitle titleType=”publicTitle”&gt;En offentlig
titel&lt;/otherTitle&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:101</td>
<td>Status</td>
<td><p>Handlingens status.</p>
<p>Obligatoriskt. Värdet väljs från <a
href="#_SVK-VÄRDELISTA_7_–">SVK-värdelista 7</a>.</p>
<p>Värdet kan vara antingen ”closed”, vilket innebär att dokumentet är
registrerat som inkommet eller upprättat, eller ”obliterated”, vilket
betyder att det är makulerat.</p>
<p>Exempel:</p>
<p>&lt;record&gt;</p>
<p>&lt;status <mark></mark>value=”<mark>closed</mark>”/&gt;</p>
<p>&lt;/record&gt;</p>
<p>XML-element: status/@value<br />
Datatype: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:102</td>
<td>Löpnummer</td>
<td><p>Handlingens löpnummer i ärendet.</p>
<p>Obligatoriskt. Måste vara unikt i respektive ärende.</p>
<p>XML-element: runningNumber<br />
Datatyp: integer</p></td>
</tr>
<tr class="even">
<td>erms-svk:103</td>
<td>Dokument­referens</td>
<td><p>Referens till och/eller från annan handling.</p>
<p>Om möjligt anges den andra handlingens Dokumentnummer enligt
specifikationen i detta dokument, annars en hänvisning till dokumentet i
annat format eller fritext.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Dokumentreferens används, måste attributet relationType
ha värdet ”reference”.</p>
<p>XML-element: relation<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 24 – Dokumentreferens</p>
<p>&lt;record&gt;</p>
<p>&lt;relation relationType="reference"&gt;F
2019-0454:4&lt;/relation&gt;</p>
<p>&lt;record&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:104</td>
<td>Sekretess</td>
<td><p>Samlingselement för uppgift om sekretess.</p>
<p>Elementet kan upprepas.</p>
<p>Om elementet Sekretess används måste attributet restrictionType ha
värdet ”confidential”.</p>
<p>XML-element: restriction</p></td>
</tr>
<tr class="odd">
<td>erms-svk:105</td>
<td>Förklarande text</td>
<td><p>Fritext som beskriver sekretessen.</p>
<p>XML-element: explanatoryText<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:106</td>
<td>Lagrum</td>
<td><p>Hänvisning till paragraf i kyrkoordningens 54 kapitel, till
Offentlighets- och sekretesslagen eller till annat lagrum som stöder den
angivna sekretessen.</p>
<p>Obligatoriskt om elementet Sekretess används.</p>
<p>XML-element: regulation<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:107</td>
<td>Sekretess­datum</td>
<td><p>Datum då sekretessmarkeringen gjordes.</p>
<p>Om elementet Sekretessdatum används, måste attributet dateTyp ha
värdet ”created”</p>
<p>XML-element: dates/date<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 25 – Sekretess</p>
<p>&lt;record&gt;</p>
<p>&lt;restriction restrictionType="confidential"&gt;</p>
<p>&lt;explanatoryText&gt;Sekretess enligt
KO&lt;/explanatoryText&gt;</p>
<p>&lt;regulation&gt;KO 54:2&lt;/regulation&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;date dateType="created"&gt;2020-01-02T00:00:00&lt;/date&gt;</p>
<p>&lt;/dates&gt;</p>
<p>&lt;/restriction&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:108</td>
<td>Riktning</td>
<td><p>Anger dokumentets riktning.</p>
<p>Obligatoriskt.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_15_–">SVK-värdelista
15</a>.</p>
<p>Kan vara något av värdena:</p>
<p>”incoming” – en inkommen handling</p>
<p>”outgoing” – en genom expediering upprättad handling</p>
<p>”internal” – en på annat sätt upprättad handling</p>
<p>XML-element: direction/@directionDefinition<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 26 – Riktning</p>
<p>1)</p>
<p>&lt;record&gt;</p>
<p>&lt;direction directionDefinition="incoming"/&gt;</p>
<p>&lt;record&gt;</p>
<p>2)</p>
<p>&lt;record&gt;</p>
<p>&lt;direction directionDefinition="outgoing"/&gt;</p>
<p>&lt;record&gt;</p>
<p>3)</p>
<p>&lt;record&gt;</p>
<p>&lt;direction directionDefinition="other"
otherDirectionDefinition="internal"/&gt;</p>
<p>&lt;record&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:109</td>
<td>Aktörer</td>
<td><p>Samlingselement för alla agerande parter.</p>
<p>XML-element: agents</p></td>
</tr>
<tr class="even">
<td>erms-svk:110</td>
<td>Skapare</td>
<td><p>Den som har skapat handlingen i systemet.</p>
<p>Om elementet Skapare används, måste agentType ha värdet
”creator”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td>erms-svk:111</td>
<td>Ansvarig</td>
<td><p>Den som ägde eller hade ansvar för handlingen innan ärendet
avslutades.</p>
<p>Om elementet Ansvarig används, måste agentType ha värdet
”responsible_person”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="even">
<td>erms-svk:112</td>
<td>Avsändare</td>
<td><p>Avsändare av en inkommen handling.</p>
<p>Obligatoriskt om Riktning har värdet ”incoming”</p>
<p>Elementet kan upprepas</p>
<p>Om elementet Avsändare används, måste agentType ha värdet
”sender”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td>erms-svk:113</td>
<td>Mottagare</td>
<td><p>Mottagare av en utgående handling.</p>
<p>Obligatoriskt om Riktning har värdet ”outgoing”</p>
<p>Elementet kan upprepas</p>
<p>Om elementet Mottagare används, måste agentType ha värdet
”receiver”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="even">
<td>erms-svk:114</td>
<td>Annan aktör</td>
<td><p>Annan typ av aktör än de ovan specificerade.</p>
<p>Elementet kan upprepas</p>
<p>Om elementet Annan aktör används, måste agentType ha värdet
”agent”.</p>
<p>Namn och användarnamn anges i underelementen name (obligatoriskt) och
idNumber (frivilligt). Se exemplet nedan.</p>
<p>Om idNumber används hämtas värdet från <a
href="#_SVK-VÄRDELISTA_8_–">SVK-värdelista 8</a>.</p>
<p>XML-element: agent<br />
name (string)<br />
idNumber (string)</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 27 – Aktörer</p>
<p>&lt;record&gt;</p>
<p>&lt;agents&gt;</p>
<p>&lt;agent agentType="creator"&gt;</p>
<p>&lt;name&gt;Anna Andersson&lt;/name&gt;</p>
<p>&lt;idNumber idNumberType="username"&gt;svkanan&lt;/idNumber&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;agent agentType="responsible_person"&gt;</p>
<p>&lt;name&gt;Johan Göransson&lt;/name&gt;</p>
<p>&lt;idNumber idNumberType="username"&gt;svkjogo&lt;/idNumber&gt;</p>
<p>&lt;/agent&gt;</p>
<p>Om det är en inkommande handling:</p>
<p>&lt;agent agentType="sender"&gt;</p>
<p>&lt;name&gt;Försäkringskassan&lt;/name&gt;</p>
<p>&lt;/agent&gt;</p>
<p>Om det är en utgående handling:</p>
<p>&lt;agent agentType="receiver"&gt;</p>
<p>&lt;name&gt;Försäkringskassan&lt;/name&gt;</p>
<p>&lt;/agent&gt;</p>
<p>&lt;/agents&gt;</p>
<p>&lt;/record&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:115</td>
<td>Beskrivning</td>
<td><p>Beskrivning av handlingen</p>
<p>XML-element: description<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:116</td>
<td>Datum</td>
<td><p>Samlingselement för alla datum som rör handlingen</p>
<p>Alla datum har datatypen xs:dateTime i UTC-format, vilket betyder att
både datum och klocklag ned till sekundnivå ska anges. Om klockslag
saknas används noll-tecken. Tidszon anges inte men förutsätts vara
Europe/Stockholm.</p>
<p>[År]-[Månad]-[Dag]T[Timme]:[Minut]:[Sekund]</p>
<p>Exempel:</p>
<p>2018-03-04T15:15:22<br />
2020-09-17T00:00:00</p>
<p>XML-element: dates</p></td>
</tr>
<tr class="even">
<td>erms-svk:117</td>
<td>Skapat</td>
<td><p>Datum och tid då handlingen skapades i systemet. Här avses ett av
systemet automatiskt satt datum.</p>
<p>Obligatoriskt.</p>
<p>Om uppgiften saknas i diariesystemet, används samma datum som i
Registrerat.</p>
<p>Om elementet Skapat används, måste dateType ha värdet ”created”.</p>
<p>XML-element: date/@dateType=”created”<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:118</td>
<td>Registrerat</td>
<td><p>Datum och tid då handlingen registrerades (diariefördes) som
inkommen, utgående eller på annat sätt färdigställd.</p>
<p>Obligatoriskt.</p>
<p>Uppgiften relaterar till elementet Riktning. Om Riktning t.ex. har
värdet ”outgoing”, anges här datum för expediering. Om Riktning i
stället har värdet ”incoming”, anges här datum då handlingen inkom.</p>
<p>Om elementet Registrerat används, måste dateType ha värdet
”originated”.</p>
<p>XML-element: date/@dateType=”originated<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td>erms-svk:119</td>
<td>Ankomstdatum</td>
<td><p>Datum då handlingen inkom, om annat än Registrerat.</p>
<p>Om elementet Ankomstdatum används, måste dateType ha värdet
”received”.</p>
<p>XML-element: date/@dateType=”received”<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:120</td>
<td>Expedierings­datum</td>
<td><p>Datum då handlingen expedierades, om annat än Registrerat.</p>
<p>Om elementet Expedieringsdatum används, måste dateType ha värdet
”expedited”.</p>
<p>XML-element: date/@dateType=”expedited”<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 28 – Datum</p>
<p>&lt;record&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;date dateType="created"&gt;2020-02-02T12:32:15&lt;/date&gt;</p>
<p>&lt;date
dateType="originated"&gt;2020-02-02T00:00:00&lt;/date&gt;</p>
<p>&lt;date
dateType="received"&gt;2020-01-14T00:00:00&lt;/date&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:121</td>
<td>Kommentar</td>
<td><p>Kommentar till handlingen.</p>
<p>Kommentaren utgörs av en enda sammanhängande text och är inte möjlig
att upprepa. Se exemplet nedan.</p>
<p>För upprepade kommentarer eller anteckningar används i stället
elementet svkNotes, se <a href="#_Tabell_5._Svenska">Tabell 5</a>.</p>
<p>Om elementet Kommentar används, måste noteType ha värdet
”comment”</p>
<p>XML-element: notes/note<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:122</td>
<td>Datum för kommentar</td>
<td><p>Datum då kommentaren skapades.</p>
<p>XML-element: notes/note/@noteDate<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:123</td>
<td>Utökad XML-data</td>
<td><p>Utökad XML-data är en del av Svenska kyrkans anpassning av
ERMS.</p>
<p>Se <a href="#_Tabell_5._Svenska">Tabell 5</a>.</p>
<p>XML-element: additionalXMLData</p></td>
</tr>
</tbody>
</table>

<span id="_Tabell_5._Svenska" class="anchor"></span>

Tabell 5. Svenska kyrkans tilläggsinformation om ärendehandlingar

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 18%" />
<col style="width: 62%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>erms-svk:124</td>
<td>Tilläggs­information</td>
<td><p>De element som inte ingår i ERMS utan är tillägg i Svenska
kyrkans anpassning är samlade i elementet Tilläggsinformation.</p>
<p>XML-element: additionalInformation/additionaXMLData/<br />
svk:ermsSvkArende/svk:ermsSvkRecord</p></td>
</tr>
<tr class="even">
<td>erms-svk:125</td>
<td>Relaterade projekt</td>
<td><p>Samlingselement med referenser till projekt som handlingen
relaterar till.</p>
<p>XML-element: svk:relatedProjects</p></td>
</tr>
<tr class="odd">
<td>erms-svk:126</td>
<td>Relaterat projekt</td>
<td><p>Referens till projekt som handlingen relaterar till.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: svk:relatedProject</p></td>
</tr>
<tr class="even">
<td>erms-svk:127</td>
<td>Projektnamn</td>
<td><p>Det relaterade projektets namn.</p>
<p>Obligatoriskt om elementet Relaterat projekt används.</p>
<p>XML-element: svk:name<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:128</td>
<td>Identifikator</td>
<td><p>Projektnummer eller annan identifikator för projektet.</p>
<p>Obligatoriskt om elementet Relaterat projekt används.</p>
<p>XML-element: svk:identificatory<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:129</td>
<td>Internt ID</td>
<td><p>Projektets id-nummer i det levererande systemet</p>
<p>XML-element: svk:deliveringSystemId<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 29 – Relaterat projekt</p>
<p>&lt;svk:ermsSvkRecord&gt;</p>
<p>&lt;svk:relatedProjects&gt;</p>
<p>&lt;svk:relatedProject&gt;</p>
<p>&lt;svk:name&gt;Omläggning av kyrktaket 2009&lt;/svk:name&gt;</p>
<p>&lt;svk:identificator&gt;P 2009:1&lt;/svk:identificator&gt;</p>
<p>&lt;svk:deliveringSystemId&gt;34958&lt;/svk:deliveringSystemId&gt;</p>
<p>&lt;/svk:relatedProject&gt;</p>
<p>&lt;/svk:relatedProjects&gt;</p>
<p>&lt;/svk:ermsSvkRecord&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:130</td>
<td>Relaterade fastigheter</td>
<td><p>Samlingselement med referenser till fastigheter eller byggnader
som handlingen relaterar till.</p>
<p>XML-element: svk:relatedRealEstates</p></td>
</tr>
<tr class="odd">
<td>erms-svk:131</td>
<td>Relaterad fastighet</td>
<td><p>Referens till fastighet eller byggnad som handlingen relaterar
till.</p>
<p>Elementet kan upprepas.</p>
<p>XML-element: svk:relatedRealEstate</p></td>
</tr>
<tr class="even">
<td>erms-svk:132</td>
<td>Fastighetsnam</td>
<td><p>Fastighetens eller byggnadens namn.</p>
<p>Obligatoriskt om elementet Relaterad fastighet används.</p>
<p>XML-element: svk:name<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:133</td>
<td>Identifikator</td>
<td><p>Fastighetsnummer eller annan identifikator för fastigheten eller
byggnaden.</p>
<p>Obligatoriskt om elementet Relaterad fastighet används.</p>
<p>XML-element: svk:identificatory<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:134</td>
<td>Internt ID</td>
<td><p>Fastighetens eller byggnadens id-nummer i det levererande
systemet.</p>
<p>XML-element: svk:deliveringSystemId<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td colspan="3"><p>Exempel 30 – Relaterad fastighet</p>
<p>&lt;svk:ermsSvkRecord&gt;</p>
<p>&lt;svk:relatedRealEstates&gt;</p>
<p>&lt;svk:relatedRealEstate&gt;</p>
<p>&lt;svk:name&gt;Omläggning av kyrktaket 2009&lt;/svk:name&gt;</p>
<p>&lt;svk:identificator&gt;P 2009:1&lt;/svk:identificator&gt;</p>
<p>&lt;svk:deliveringSystemId&gt;34958&lt;/svk:deliveringSystemId&gt;</p>
<p>&lt;/svk:relatedRealEstate&gt;</p>
<p>&lt;/svk:relatedRealEstates&gt;</p>
<p>&lt;/svk:ermsSvkRecord&gt;</p></td>
</tr>
<tr class="even">
<td>erms-svk:135</td>
<td>Anteckningar</td>
<td><p>Samlingselement för anteckningar kopplade till en handling.</p>
<p>XLM-element: svk:svkNotes</p></td>
</tr>
<tr class="odd">
<td>erms-svk136</td>
<td>Anteckning</td>
<td><p>Enskild anteckning kopplad till handlingen.</p>
<p>XML-element: svk:svkNote</p></td>
</tr>
<tr class="even">
<td>erms-svk:137</td>
<td>Typ av anteckning</td>
<td><p>Obligatoriskt om elementet Anteckning används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_10_–">SVK-värdelista
10</a>.</p>
<p>XML-element: svk:svkNote/@typeOfNote<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:138</td>
<td>Text</td>
<td><p>Anteckningens lydelse.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-defintion: svk:noteText<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:139</td>
<td>Skapare av anteckning</td>
<td><p>Namn på den person som har gjort anteckningen.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-element: svk:noteAuthor<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:140</td>
<td>Datum för anteckning</td>
<td><p>Datum och tid när anteckningen gjordes.</p>
<p>Obligatoriskt om elementet Anteckning används.</p>
<p>XML-element: svk:noteDate<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 31 – Anteckningar</p>
<p>&lt;svk:ermsSvkRecord&gt;</p>
<p>&lt;svk:svkNotes&gt;</p>
<p>&lt;svk:svkNote typeOfNote="Generell anteckning"&gt;</p>
<p>&lt;svk:noteText&gt;Detta är en anteckning&lt;/svk:noteText&gt;</p>
<p>&lt;svk:noteAuthor&gt;Jörgen Persson&lt;/svk:noteAuthor&gt;</p>
<p>&lt;svk:noteDate&gt;2019-02-23T00:00:00&lt;/svk:noteDate&gt;</p>
<p>&lt;/svk:svkNote&gt;</p>
<p>&lt;/svk:svkNotes&gt;</p>
<p>&lt;/svk:ermsSvkRecord&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:141</td>
<td>Avtalsinfor­mation</td>
<td><p>Samlingselement för extra information om registrerade avtal.</p>
<p>XML-element: svk:contractInfo</p></td>
</tr>
<tr class="even">
<td>erms-svk:142</td>
<td>Avsändares referens</td>
<td><p>Referens till avtalspartners exemplar av avtalsdokumentet.</p>
<p>XML-element: svk:externalReference</p>
<p>Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:143</td>
<td>Avropat värde</td>
<td><p>Avropat värde.</p>
<p>Kan endast anges i heltal.</p>
<p>XML-element: svk:callOffValue<br />
Datatyp: integer</p></td>
</tr>
<tr class="even">
<td>erms-svk:144</td>
<td>Valuta</td>
<td><p>Valutaslag för Avropat värde.</p>
<p>Valutakod enligt ISO 4217. ”SEK” är förvalt värde och behöver inte
anges specifikt.</p>
<p>XML-element: svk:callOffValue/@currency<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:145</td>
<td>Kontraktsvärde</td>
<td><p>Kontraktsvärde.</p>
<p>Kan endast anges i heltal.</p>
<p>XML-element: svk:contractValue<br />
Datatyp: integer</p></td>
</tr>
<tr class="even">
<td>erms-svk:146</td>
<td>Valuta</td>
<td><p>Valutaslag för Kontraktsvärde.</p>
<p>Valutakod enligt ISO 4217. ”SEK” är förvalt värde och behöver inte
anges specifikt.</p>
<p>XML-element: svk:callOffValue/@currency<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:147</td>
<td>Avtalstyp</td>
<td><p>Typ av avtal.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_16_–">SVK-värdelista
16</a>.</p>
<p>XML-element: svk:typeOfAgreement<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:148</td>
<td>Giltigt från</td>
<td><p>Datum från vilket avtalet är giltigt.</p>
<p>Om elementet Giltigt från används, måste attributet dateType ha
värdet ”start”.</p>
<p>XML-element: dates/date<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:149</td>
<td>Giltigt till</td>
<td><p>Datum till vilket avtalet är giltigt.</p>
<p>Om elementet Giltigt till används, måste attributet dateType ha
värdet ”end”.</p>
<p>XML-element: dates/date<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 32 – Avtalsinformation</p>
<p>&lt;svk:ermsSvkRecord&gt;</p>
<p>&lt;svk:contractInfo&gt;</p>
<p>&lt;svk:externalReference&gt;ref3453&lt;/svk:externalReference&gt;</p>
<p>&lt;svk:callOffValue
currency="SEK"&gt;34000&lt;/svk:callOffValue&gt;</p>
<p>&lt;svk:contractValue
currency="SEK"&gt;45000&lt;/svk:contractValue&gt;</p>
<p>&lt;svk:typeOfAgreement&gt;Avtal&lt;/svk:typeOfAgreement&gt;</p>
<p>&lt;dates&gt;</p>
<p>&lt;date dateType="start"&gt;2018-02-12T00:00:00&lt;/date&gt;</p>
<p>&lt;date dateType="end"&gt;2019-02-12T00:00:00&lt;/date&gt;</p>
<p>&lt;/dates&gt;</p>
<p>&lt;/svk:contractInfo&gt;</p>
<p>&lt;/svk:ermsSvkRecord&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:150</td>
<td>Bifogad fil</td>
<td><p>Uppgifter om fil som är kopplad till den registrerade
handlingen.</p>
<p>Se <a href="#_Tabell_6._Bifogade">Tabell 6</a>.</p></td>
</tr>
<tr class="even">
<td>erms-svk:151</td>
<td>Ändringslogg</td>
<td><p>Samlingselement för loggningsuppgifter.</p>
<p>XML-element: svk:auditLogEvents</p></td>
</tr>
<tr class="odd">
<td>erms-svk:152</td>
<td>Händelse</td>
<td><p>Enskild händelse i ändringsloggen.</p>
<p>Obligatoriskt om elementet Ändringslogg används.</p>
<p>XML-element: svk:auditLogEvent</p></td>
</tr>
<tr class="even">
<td>erms-svk:153</td>
<td>Tid</td>
<td><p>Datum och tid då ändringen gjordes.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>XML-element: svk:time<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:154</td>
<td>Användare</td>
<td><p>Namn på den person som gjorde ändringen.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>XML-element: svk:user<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:155</td>
<td>Tillämpnings­område</td>
<td><p>Beskrivning av det som ändringen avser.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_11_–">SVK-värdelista
11</a>.</p>
<p>XML-element: svk:scope<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:156</td>
<td>Händelse</td>
<td><p>Beskrivning av ändring.</p>
<p>Obligatoriskt om elementet Händelse används.</p>
<p>Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_12_–">SVK-värdelista 12</a>.</p>
<p>XML-element: svk:action<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:157</td>
<td>Värde före ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen före ändringen.</p>
<p>XML-element: svk:valueBeforeChange<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:158</td>
<td>Värde efter ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen efter ändringen.</p>
<p>XML-element: svk:valueAfterChange<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 33 – Ändringslogg</p>
<p>&lt;svk:ermsSvkRecord&gt;</p>
<p>&lt;svk:auditLogEvents&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T11:47:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt; Jörgen Persson&lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;ärende&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;create&lt;/svk:action&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T11:52:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt;Jörgen Persson&lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;ärendemening&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;update&lt;/svk:action&gt;</p>
<p>&lt;svk:valueBeforeChange&gt;Upphandling av
frysboxar&lt;/svk:valueBeforeChange&gt;</p>
<p>&lt;svk:valueAfterChange&gt;Upphandling av
kylskåp&lt;/svk:valueAfterChange&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;svk:auditLogEvent&gt;</p>
<p>&lt;svk:time&gt;2009-09-22T12:10:00&lt;/svk:time&gt;</p>
<p>&lt;svk:user&gt; Jörgen Persson &lt;/svk:user&gt;</p>
<p>&lt;svk:scope&gt;status&lt;/svk:scope&gt;</p>
<p>&lt;svk:action&gt;update&lt;/svk:action&gt;</p>
<p>&lt;svk:valueBeforeChange&gt;Öppet&lt;/svk:valueBeforeChange&gt;</p>
<p>&lt;svk:valueAfterChange&gt;Makulerat&lt;/svk:valueAfterChange&gt;</p>
<p>&lt;/svk:auditLogEvent&gt;</p>
<p>&lt;/svk:auditLogEvents&gt;</p>
<p>&lt;/svk:ermsSvkRecord&gt;</p></td>
</tr>
</tbody>
</table>

Information om bifogade filer

I ERMS används för bifogade filer elementet
record/additionalInformation/appendix.

I Svenska kyrkans anpassning av ERMS används i stället tilläggselementet
record/additional­Information/additionalXMLData/ermsSvkRecord/svkAppendix.

<span id="_Tabell_6._Bifogade" class="anchor"></span>Tabell 6. Bifogade
filer

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 20%" />
<col style="width: 62%" />
</colgroup>
<thead>
<tr class="header">
<th>ID</th>
<th>Element</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>erms-svk:159</td>
<td>Bifogad fil</td>
<td><p>Samlingselement för uppgifter om en fil som är kopplad till en
registrerad handling.</p>
<p>XML-element: svk:ermsSvkRecord/svk:svkAppendix</p></td>
</tr>
<tr class="even">
<td>erms-svk:160</td>
<td>Appendix</td>
<td><p>Samlingselement för den information om filen som följer
ERMS-standard.</p>
<p>XML-element: appendix</p></td>
</tr>
<tr class="odd">
<td>erms-svk:161</td>
<td>Gallringsbar</td>
<td><p>Med gallringsbar avses här att den bifogade filen kan gallras
innan dokumentet i sig gallras. Kan gälla t.ex. filer som bevaras i
produktionsformat</p>
<p>Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som
motsvarar false).</p>
<p>XML-element: appendix/@disposable<br />
Datatyp: boolean</p></td>
</tr>
<tr class="even">
<td>erms-svk:162</td>
<td>Namn</td>
<td><p>Filens namn.</p>
<p>Obligatoriskt.</p>
<p>XML-element: appendix/@name<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:163</td>
<td>Beskrivning</td>
<td><p>Beskrivning av filen.</p>
<p>XML-element: appendix/@description<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:164</td>
<td>Filformat</td>
<td><p>Filens format.</p>
<p>Obligatoriskt.</p>
<p>Anges i form av filnamnsändelse (max fyra tecken) utan punkt och med
små bokstäver.</p>
<p>Exempel: pdf, png, txt</p>
<p>XML-element: appendix/@fileFormat<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:165</td>
<td>Originalfil­format</td>
<td><p>Om filen är konverterad till arkivformat, anges här
originalfilens format.</p>
<p>Anges i form av filnamnsändelse utan punkt och med små bokstäver.</p>
<p>Exempel: docx, xlsx, msg</p>
<p>XML-element: appendix/@originalFileFormat<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:166</td>
<td>Sökväg</td>
<td><p>Relativ sökväg till filens placering i informationspaketet.</p>
<p>Obligatoriskt.</p>
<p>Exempel: files/document_01.pdf</p>
<p>XML-element: appendix/@path<br />
Datatyp: string</p></td>
</tr>
<tr class="odd">
<td>erms-svk:167</td>
<td>Uppgift om e-signatur</td>
<td><p>Anger om det har funnits en e-signatur som gallrats före
leverans.</p>
<p>Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som
motsvarar false).</p>
<p>XML-element: appendix/@eSignatureHasExisted<br />
Datatyp: boolean</p></td>
</tr>
<tr class="even">
<td>erms-svk:168</td>
<td>E-signatur</td>
<td><p>Samlingselement för information om befintlig e-signatur.</p>
<p>XML-element: eSignature</p></td>
</tr>
<tr class="odd">
<td>erms-svk:169</td>
<td>E-signatur finns</td>
<td><p>Anger om det finns en e-signatur.</p>
<p>Obligatoriskt om elementent E-signatur används.</p>
<p>Värdet kan vara: true, false, 1 (som motsvarar true) eller 0 (som
motsvarar false).</p>
<p>XML-element: eSignature/@present<br />
Datatyp: boolean</p></td>
</tr>
<tr class="even">
<td>erms-svk:170</td>
<td>Verifikations­datum</td>
<td><p>Datum och tid då e-signaturen senast verifierades.</p>
<p>XML-element: eSignature/@dateSignatureIsVerified<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:171</td>
<td>Signatur</td>
<td><p>Element för filens e-signatur med dess eget XML-schema.</p>
<p>Leveransöverenskommelsen ska innehålla information om hur
e-signaturer lagras och om vilket schema som används.</p>
<p>XML-element: signature</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 34 – Bifogad fil</p>
<p>&lt;svk:svkAppendix&gt;</p>
<p>&lt;svk:appendix name="ansökan" path="filer/ansökan.pdf"
fileFormat="pdf"&gt;</p>
<p>&lt;eSignature present="true"
dateeSignatureIsVerified="2020-03-04T00:00:00"&gt;</p>
<p>&lt;signature&gt;</p>
<p>&lt;Signature xmlns="http://www.w3.org/2000/09/xmldsig#"<br />
xsi:schemaLocation="http://www.w3.org/2000/09/xmldsig#<br />
https://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd"&gt;</p>
<p>&lt;SignedInfo&gt;</p>
<p>&lt;CanonicalizationMethod
Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n- 20010315"/&gt;</p>
<p>&lt;SignatureMethod
Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/&gt;</p>
<p>&lt;Reference URI="#object"&gt;</p>
<p>&lt;DigestMethod
Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/&gt;</p>
<p>&lt;DigestValue&gt;OPnpF/ZNLDxJ/I+1F3iHhlmSwgo=&lt;/DigestValue&gt;</p>
<p>&lt;/Reference&gt;</p>
<p>&lt;/SignedInfo&gt;</p>
<p>&lt;SignatureValue&gt;nihUFQg4mDhLgecvhIcKb9Gz8VRTOlw+adiZOBBXgK4JodEe5aFfCqm8WcRIT8GL</p>
<p>LXSk8PsUP4//SsKqUBQkpotcAqQAhtz2v9kCWdoUDnAOtFZkd/CnsZ1sge0ndha4</p>
<p>0wWDV+nOWyJxkYgicvB8POYtSmldLLepPGMz+J7/Uws=&lt;/SignatureValue&gt;</p>
<p>&lt;KeyInfo&gt;</p>
<p>&lt;KeyValue&gt;</p>
<p>&lt;RSAKeyValue&gt;</p>
<p>&lt;Modulus&gt;4IlzOY3Y9fXoh3Y5f06wBbtTg94Pt6vcfcd1KQ0FLm0S36aGJt</p>
<p>TSb6pYKfyX7PqCUQ8wgL6xUJ5GRPEsu9gyz8ZobwfZsGCsvu40CWoT9fcFBZPfXro1</p>
<p>Vtlh/xl/yYHm+Gzqh0Bw76xtLHSfLfpVOrmZdwKmSFKMTvNXOFd0V18=&lt;/Modulus&gt;</p>
<p>&lt;Exponent&gt;AQAB&lt;/Exponent&gt;</p>
<p>&lt;/RSAKeyValue&gt;</p>
<p>&lt;/KeyValue&gt;</p>
<p>&lt;/KeyInfo&gt;</p>
<p>&lt;Object Id="object"&gt;some text</p>
<p>with spaces and CR-LF.&lt;/Object&gt;</p>
<p>&lt;/Signature&gt;</p>
<p>&lt;/signature&gt;</p>
<p>&lt;/eSignature&gt;</p>
<p>&lt;/svk:appendix&gt;</p>
<p>&lt;/svk:svkAppendix&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:172</td>
<td>Filinformation</td>
<td><p>Samlingselement för utökad information om filen.</p>
<p>(Tillägg till ERMS-standard)</p>
<p>XML-element: svk:fileInfo</p></td>
</tr>
<tr class="even">
<td>erms-svk:173</td>
<td>Skapad</td>
<td><p>Datum och tid då filen skapades (systeminformation).</p>
<p>XML-element: svk:dateCreated<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="odd">
<td>erms-svk:174</td>
<td>Senast ändrad</td>
<td><p>Datum och tid då filen senast ändrades (systeminformation).</p>
<p>XML-element: svk:dateLastEdited<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td>erms-svk:175</td>
<td>Versions­nummer</td>
<td><p>Om flera versioner av samma fil är kopplade till handlingen,
anges unikt versionsnummer här.</p>
<p>Versionsnumreringen kan enbart anges med heltal.</p>
<p>XML-element: svk:versionNumber<br />
Datatyp: integer</p></td>
</tr>
<tr class="odd">
<td>erms-svk:176</td>
<td>Variant</td>
<td><p>Om flera varianter av samma version är kopplade till handlingen,
anges unik variant här.</p>
<p>Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_17_–">SVK-värdelista 17</a>.</p>
<p>XML-element: svk:variant<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td colspan="3"><p>Exempel 35 – Filinformation</p>
<p>&lt;svk:svkAppendix&gt;</p>
<p>&lt;svk:fileInfo&gt;</p>
<p>&lt;svk:dateCreated&gt;2010-02-01T00:00:00&lt;/svk:dateCreated&gt;</p>
<p>&lt;svk:dateLastEdited&gt;2010-02-01T00:00:00&lt;/svk:dateLastEdited&gt;</p>
<p>&lt;svk:versionNumber&gt;1&lt;/svk:versionNumber&gt;</p>
<p>&lt;svk:variant&gt;preservation&lt;/svk:variant&gt;</p>
<p>&lt;/svk:fileInfo&gt;</p></td>
</tr>
<tr class="odd">
<td>erms-svk:177</td>
<td>Ändringslogg</td>
<td><p>Samlingselement för loggningsuppgifter.</p>
<p>XML-element: svk:auditLogEvents</p></td>
</tr>
<tr class="even">
<td>erms-svk:178</td>
<td>Händelse</td>
<td><p>Enskild händelse i ändringsloggen.</p>
<p>Obligatorisk om elementet Ändringslogg används.</p>
<p>XML-element: svk:auditLogEvent</p></td>
</tr>
<tr class="odd">
<td>erms-svk:179</td>
<td>Tid</td>
<td><p>Datum och tid då ändringen gjordes.</p>
<p>Obligatorisk om elementet Händelse används.</p>
<p>XML-element: svk:time<br />
Datatyp: dateTime</p></td>
</tr>
<tr class="even">
<td>erms-svk:180</td>
<td>Användare</td>
<td><p>Namn på personen som gjorde ändringen.</p>
<p>Obligatorisk om elementet Händelse används.</p>
<p>XML-element: svk:user<br />
Datatyp: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:181</td>
<td>Tillämpnings­område</td>
<td><p>Beskrivning av det som ändringen avser.</p>
<p>Obligatorisk om elementet Händelse används.</p>
<p>Värdet väljs från <a href="#_SVK-VÄRDELISTA_11_–">SVK-värdelista
11</a>.</p>
<p>XML-element: svk:scope<br />
Datatyp: token</p></td>
</tr>
<tr class="even">
<td>erms-svk:182</td>
<td>Händelse</td>
<td><p>Beskrivning av ändring.</p>
<p>Obligatorisk om elementet Händelse används.</p>
<p>Värdet väljs från värdelistan <a
href="#_SVK-VÄRDELISTA_12_–">SVK-värdelista 12</a>.</p>
<p>XML-element: svk:action<br />
Datatype: token</p></td>
</tr>
<tr class="odd">
<td>erms-svk:183</td>
<td>Värde före ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen före ändringen.</p>
<p>XML-element: svk:valueBeforeChange<br />
Datatyp: string</p></td>
</tr>
<tr class="even">
<td>erms-svk:184</td>
<td>Värde efter ändring</td>
<td><p>Om ett värde har ändrats, anges här lydelsen efter ändringen.</p>
<p>XML-element: svk:valueAfterChange<br />
Datatyp: string</p></td>
</tr>
</tbody>
</table>

<span id="_Värdelistor" class="anchor"></span>Värdelistor

<span id="_SVK-VÄRDELISTA_1_–" class="anchor"></span>SVK-värdelista 1 –
Typ av identifikator (erms-svk:2)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>aid</td>
<td>ArkivbildarID</td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>arkivbildare</td>
<td>Arkivbildarens namn</td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>organisationsnummer</td>
<td>Tio siffror utan bindestreck.</td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>ärendenummer</td>
<td>Ärendets beteckning (t.ex. F 2020-0435)</td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_2_–" class="anchor"></span>SVK-värdelista 2 –
Klassificeringsstruktur (erms-svk:4)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>KlaSL2016_1.0</td>
<td>Klassificeringsstruktur för lokal nivå 1.0</td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>KlaSN2018_1.0</td>
<td>Klassificeringsstruktur för nationell nivå 1.0</td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>KlaSS2016_1.0</td>
<td>Klassificeringsstruktur för regional nivå 1.0</td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_3_–" class="anchor"></span>SVK-värdelista 3 –
XML-dokumentets status (erms-svk:7)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>cancelled</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>created</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>deleted</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>derived</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>new</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>revised</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>unknown</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>updated</td>
<td></td>
<td>ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_4_–" class="anchor"></span>SVK-värdelista 4 –
Typ av ID (erms-svk:10)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>aid</td>
<td>ArkivbildarID</td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>organisationsnummer</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_5_–" class="anchor"></span>SVK-värdelista 5 –
Typ av underhållshändelse (erms-svk:16)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>cancelled</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>created</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>deleted</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>derived</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>revised</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>unknown</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>updated</td>
<td></td>
<td>ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_6_–" class="anchor"></span>SVK-värdelista 6 –
Typ av utförare/aktör, agentType (erms-svk:19 m.fl. )

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>agent</td>
<td>Används i betydelsen ”Annan aktör”.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>closer</td>
<td>Den som avslutar ett ärende.</td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>counterpart</td>
<td>Ärendepart, extern part i ett ärende.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>creator</td>
<td>Skapare av ERMS-fil eller post i diariesystem.</td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>deliverer</td>
<td>Ansvarig för leverans till e-arkivet.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>editor</td>
<td>Används i betydelsen “Medhandläggare”.</td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>receiver</td>
<td>Mottagare av en utgående handling.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>responsible_person</td>
<td>Ansvarig för ett ärende eller handling.</td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>sender</td>
<td>Avsändare av en inkommen handling.</td>
<td>ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_7_–" class="anchor"></span>SVK-värdelista 7 –
Ärende- och handlingsstatus (erms-svk:35, erms-svk:101)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>closed</td>
<td>Om ärende: avslutat, stängt. Om handling: registrerad i betydelsen
inkommen eller upprättad.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>obliterated</td>
<td>Makulerad.</td>
<td>ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_8_–" class="anchor"></span>SVK-värdelista 8 –
Typ av idNumber (erms-svk :3–48, erms-svk:110–114)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>användarnamn</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>organisationsnummer</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>personnummer</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_9_–" class="anchor"></span>SVK-värdelista 9 –
Initiativ (erms-svk:62)

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 50%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>eget</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>externt</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_10_–" class="anchor"></span>SVK-värdelista 10
– Typ av anteckning (erms-svk:75, erms-svk:137)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>arkivanteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>generell anteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>intern anteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>expedieringsanteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>chattanteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_11_–" class="anchor"></span>

SVK-värdelista 11 – Tillämpningsområde (erms-svk:83, erms-svk:155,
erms-svk:181)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ankomstdatum</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>ansvarig</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>anteckning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>avsändare</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>beskrivning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>beslut</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>dokumentnummer</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>dokumentreferens</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>dokumentstatus</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>dokumenttitel</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>expedieringsdatum</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>fastighet</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>fil</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>form</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>handling</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>handlingstyp</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>initiativ</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>klassificering</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>kommentar</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>medhandläggare</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>mottagare</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>nyckelord</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>projekt</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>riktning</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>sekretess</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>ärende</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>ärendemening</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>ärendenummer</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>ärendepart</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>ärendereferens</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>ärendestatus</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_12_–" class="anchor"></span>SVK-värdelista 12
– Händelse (erms-svk:84, erms-svk:156, svk-erms:182)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>create</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>read</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td>update</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>delete</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_13_–" class="anchor"></span>

SVK-värdelista 13 – Handlingstyp (erms-svk:89)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ärendedokument</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="even">
<td>avtalsdokument</td>
<td></td>
<td>ERMS-SVK</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_14_–" class="anchor"></span>SVK-värdelista 14
– Form (erms-svk:90)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>physical</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>digital</td>
<td></td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>physical_and_digital</td>
<td></td>
<td>ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_15_–" class="anchor"></span>SVK-värdelista 15
– Riktning (erms-svk:108)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>incoming</td>
<td>Om inkommen handling.</td>
<td>ERMS</td>
</tr>
<tr class="even">
<td>outgoing</td>
<td>Om handling som upprättats genom expediering.</td>
<td>ERMS</td>
</tr>
<tr class="odd">
<td>internal</td>
<td>Om handling som upprättats på annat sätt.</td>
<td>SVK-ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_16_–" class="anchor"></span>SVK-värdelista 16
– Avtalstyp (erms-svk:147)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>avtal</td>
<td></td>
<td>SVK-ERMS</td>
</tr>
<tr class="even">
<td>kontrakt</td>
<td></td>
<td>SVK-ERMS</td>
</tr>
<tr class="odd">
<td>licens</td>
<td></td>
<td>SVK-ERMS</td>
</tr>
<tr class="even">
<td>uppgörelse</td>
<td></td>
<td>SVK-ERMS</td>
</tr>
<tr class="odd">
<td>överenskommelse</td>
<td></td>
<td>SVK-ERMS</td>
</tr>
</tbody>
</table>

<span id="_SVK-VÄRDELISTA_17_–" class="anchor"></span>SVK-värdelista 17
– Variant (erms-svk:147)

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 48%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th>Giltiga värden</th>
<th>Kommentar</th>
<th>Källa</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>arkivformat</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>offentligt format</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>produktionsformat</td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td>signerat dokument</td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>visningsformat</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

Appendix

<span id="_XML-schema_ERMS-SVK-ARENDE.xsd"
class="anchor"></span>XML-schema ERMS-SVK-ARENDE.xsd

<span id="_XML-schema:_ERMS-SVK-ARENDE-element"
class="anchor"></span>XML-schema: ERMS-SVK-ARENDE-element.xsd

<span id="_Schematron:_ERMS-SVK-ARENDE.sch"
class="anchor"></span>Schematron: ERMS-SVK-ARENDE.sch

Exempel på XML-fil

Arkivhandboken, kapitel 8. Om leverans till e-arkivet
