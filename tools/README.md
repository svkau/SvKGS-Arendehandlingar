# Verktyg för validering och test

Kräver [uv](https://docs.astral.sh/uv/). Kör från repots rot.

| Kommando | Vad det gör |
|----------|-------------|
| `uv run --project tools tools/validate.py fil.xml [...]` | Validerar XML-dokument mot ERMS_v3.xsd, ERMS-SVK-ARENDE.xsd och (i v2) ERMS-SVK-ARENDE.sch. Lägg till `--erms-sch` för att även köra DILCIS erms_v3.sch. |
| `uv run --project tools tools/check_spec.py` | Kontrollerar att specens XML-exempel validerar, att interna länkar fungerar och att värdelistorna stämmer med XSD:erna. |
| `uv run --project tools tools/test_schematron.py` | Mutationstester för ERMS-SVK-ARENDE.sch: varje regel ska slå till för ett känt fel och inte för exempel.xml. |

## Scheman

- `ERMS-SVK-ARENDE.xsd` och `ERMS-SVK-ARENDE.sch` tas från repot, inte från webbservern.
- `ERMS-SVK-element.xsd` (v1) tas från syskonrepot `../erms-svk/`. En annan sökväg anges med
  miljövariabeln `ERMS_SVK_ELEMENT`.
- `ERMS_v3.xsd`, `erms_v3.sch` och SchXslt (Schematron-kompilator, från Maven Central med
  kontrollsumma) hämtas första gången och sparas i `tools/.cache/`.

Schematron körs med Saxon HE (`saxonche`) eftersom schemat använder XSLT 2.0.
