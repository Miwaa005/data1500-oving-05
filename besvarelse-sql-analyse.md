# Besvarelse: SQL-Analyse

## Oppgave 1: Grunnleggende Spørringer
1.  `SELECT * FROM Vare;`
2.  `SELECT VNr, Betegnelse FROM Vare;`
3.  `SELECT DISTINCT KatNr FROM Vare;`
4.  `SELECT Fornavn, Etternavn, Stilling AS Jobbtittel FROM Ansatt;`

1.  **Forklaring:** SELECT * FROM Vare henter alle rader fra tabellen vare, altså alt innhold i tabellen.

2.  **Forklaring:** SELECT VNr, Betegnelse FROM Vare skiller ut sånn at kun kolonnene VNr og Betegnelse fra tabellen Vare blir vist

3.  **Forklaring:** SELECT DISTINCT KatNr FROM Vare henter ut alle verdier i kolonnen KatNr, men skiller ut duplikater slik at man kun får verdier 1 gang.

4.  **Forklaring:** SELECT Fornavn, Etternavn, Stilling AS Jobbtittel FROM Ansatt viser bare verdier fra kolonnene Fornavn, Etternavn og Stilling i Ansatt, men stilling omdøpes til Jobbtittel i spørringen. Resultatet blir kolonnene Fornavn, Etternavn og Jobbtittel.

## Oppgave 2: WHERE-klausulen
1.  `SELECT * FROM Vare WHERE Pris > 500;`
2.  `SELECT * FROM Ansatt WHERE Stilling = 'Salgssjef' AND Årslønn > 600000;`
3.  `SELECT Fornavn, Etternavn FROM Kunde WHERE PostNr = '0001' OR PostNr = '0002';`
4.  `SELECT Betegnelse FROM Vare WHERE NOT KatNr = 1;`

1.  **Forklaring:** SELECT * FROM Vare WHERE Pris > 500 henter alle rader fra tabellen Vare hvor verdien i pris-kolonnen er større enn 500

2.  **Forklaring:** SELECT * FROM Ansatt WHERE Stilling = 'Kundebehandler' AND Årslønn > 480000 AND Kjønn = 'K' henter alle rader i Ansatt-tabellen hvor verdien i Stilling-kolonnen er kundebehandler og årslønnen er mer enn 480000 og verdien i kjønn-kolonnen er K. Dvs. tre ulike betingelser som må være true.

3.  **Forklaring:** SELECT Fornavn, Etternavn FROM Kunde WHERE PostNr = '0015' OR PostNr = '0952' henter Fornavn og Etternavn fra Kunde-tabellen som har enten 0015 eller 0952 som postnr.

4.  **Forklaring:** SELECT Betegnelse FROM Vare WHERE NOT KatNr = 1 henter alle rader fra Betegnelse-kolonnnen i tabellen hvor KatNr ikke er 1.

## Oppgave 3: Gruppering og Sortering
1.  `SELECT * FROM Vare ORDER BY Pris DESC;`
2.  `SELECT KatNr, COUNT(*) FROM Vare GROUP BY KatNr;`
3.  `SELECT Stilling, AVG(Årslønn) FROM Ansatt GROUP BY Stilling;`
4.  `SELECT KatNr, SUM(Antall) FROM Vare GROUP BY KatNr HAVING SUM(Antall) > 500;`

1.  **Forklaring:** Henter alle rader i tabellen Vare og sorterer radene synkende basert på pris

2.  **Forklaring:** Henter kategorinummer og teller opp antall rader tabellen Vare. Grupperer resultatet på kategorinummer sånn at man får antall varer per kategori.

3.  **Forklaring:** Henter Stilling og beregner gjennomsnittslønn i Ansatt-tabellen. Grupperer gjennomsnittet etter Stilling, sånn at man får gjennomsnittslønnen per stilling.

4.  **Forklaring:** Henter Kategorinummer og summerer antall fra Vare-tabellen. Grupperer summen etter kategorinummer sånn at man får antall varer per katnr. Deretter filtreres resultatet slik det kun vises kategorinumre der summen av antall er større enn 500

## Oppgave 4: Spørringer mot Flere Tabeller
1.  `SELECT V.Betegnelse, K.Navn FROM Vare V JOIN Kategori K ON V.KatNr = K.KatNr;`
2.  `SELECT O.OrdreNr, K.Fornavn, K.Etternavn FROM Ordre O LEFT JOIN Kunde K ON O.KNr = K.KNr;`
3.  `SELECT A1.Fornavn, A2.Fornavn FROM Ansatt A1, Ansatt A2 WHERE A1.PostNr = A2.PostNr AND A1.AnsNr < A2.AnsNr;`
4.  `SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);`

1.  **Forklaring:** Viser Betegnelse fra Vare og Navn fra Kategori, tabellene kobles der KatNr er lik i begge tabellene.

2.  **Forklaring:** Viser ordrenr fra ordre, fornavn og etternavn fra kunde. Tabellene kobles basert på KNr. Alt fra venstre tabell, men kun matcher fra høyre tabell blir vist (resten blir NULL)

3.  **Forklaring:** Self-join på ansatt-tabellen som sammenligner ansatte med likt postnr og hvor AnsNr i tabell1 er mindre enn AnsNr i tabell2. Det gjør at hver parkombinasjon kun vises 1 gang.

4.  **Forklaring:** Kombinerer delspørring og kobling. Viser varebetegnelser fra Vare, og filtrerer bort alle varer som forekommer i en ordrelinje.

## Oppgave 5: NULL-verdier og Aggregeringsfunksjoner

Forklar hva følgende SQL-spørringer gjør, og hvorfor resultatene blir som de blir. Vær spesielt oppmerksom på hvordan `NULL` påvirker resultatet.

1.  **Spørring:**
    ```sql
    SELECT COUNT(*), COUNT(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   COUNT(*) teller opp alle rader i tabellen, uavhengig av NULL-verdier. COUNT(Bonu) teller opp alle rader i Bonus-kolonnen som ikke er NULL.

2.  **Spørring:**
    ```sql
    SELECT AVG(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   Regner ut gjennomsnittet av Bonus, men utelukker NULL-verdier i beregningen.

3.  **Spørring:**
    ```sql
    SELECT Fornavn, Etternavn, COALESCE(Bonus, 0) AS JustertBonus FROM Ansatt;
    ```
    **Forklaring:**
    *   Viser Fornavn, Etternavn og Bonus men omgjør NULL-verdier til 0 i visningen, og gir kolonnen navnet JustertBonus.

4.  **Spørring:**
    ```sql
    SELECT Stilling, SUM(Årslønn + Bonus) FROM Ansatt GROUP BY Stilling;
    ```
    **Forklaring:**
    *   Viser stillinger og summen av årslønn med bonus i hver av stillingene.

## Oppgave 6: Tre-verdi Logikk (TRUE, FALSE, UNKNOWN)

SQLs logikk er ikke bare `TRUE` eller `FALSE`. Når `NULL` er involvert, får vi en tredje tilstand: `UNKNOWN`. Denne oppgaven utforsker hvordan dette påvirker `WHERE`-klausuler.

### Del 1: Forklar SQL-spørringene

Forklar resultatet av følgende SQL-spørringer. Hvorfor returnerer de det de gjør?

1.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE;
    ```
    **Forklaring:**
    * Teller antall rader i Ordre-tabellen hvor ErBetalt er true, ikke false eller NULL siden NULL gir verdien unknown.

2.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = FALSE;
    ```
    **Forklaring:**
    * Teller antall rader fra Ordre-tabellen hvor ErBetalt er false, ikke true eller null

3.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE OR ErBetalt = FALSE;
    ```
    **Forklaring:**
    * Teller antall rader i Ordre-tabellen hvor ErBetalt enten er true eller false, men ikke null/unknown.

4.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt IS UNKNOWN;
    ```
    **Forklaring:**
    * Teller antall rader i Ordre-tabellen hvor ErBetalt er NULL/unknown, ikke true eller false.
