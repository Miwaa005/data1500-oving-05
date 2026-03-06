-- Oppgave 1
-- 1.2
SELECT * FROM (SELECT * FROM Kunde ORDER BY KundeID DESC LIMIT 20) AS Kunder;
SELECT * FROM (SELECT Fornavn, Etternavn FROM Ansatt LIMIT 10) AS Ansatte;
SELECT DISTINCT Stilling FROM Ansatt;
SELECT VNr, Betegnelse, Pris FROM Vare;
SELECT Navn AS Kategorinavn, KatNr AS KategoriID FROM Kategori;
SELECT COUNT(*) FROM Kunde, Ordre;

-- Oppgave 2
-- 2.2
SELECT * FROM Vare WHERE Pris BETWEEN 200 AND 500;
SELECT * FROM Ansatt WHERE Stilling = 'Lagermedarbeider' OR Stilling = 'Innkjøper';
SELECT * FROM Kunde WHERE (PostNr = '3199' OR PostNr = '1711') AND Fornavn ILIKE 'A%';
SELECT * FROM Vare WHERE NOT KatNr = 1 AND Antall > 600;
SELECT * FROM Ordre WHERE SendtDato IS NOT NULL AND BetaltDato IS NULL;
SELECT * FROM Ansatt WHERE Etternavn ILIKE '%sen';

-- Oppgave 3
-- 3.2
SELECT PostNr, COUNT(*) FROM Kunde GROUP BY PostNr;
SELECT KatNr, AVG(Pris) FROM Vare GROUP BY KatNr;
SELECT VNr, KatNr, Pris FROM Vare v WHERE Pris = (SELECT MAX(Pris) FROM Vare WHERE KatNr = v.KatNr);
SELECT Stilling, COUNT (*) AS antall FROM Ansatt GROUP BY Stilling ORDER BY Antall DESC;
SELECT KatNr, SUM(Antall) FROM Vare GROUP BY KatNr HAVING SUM(Antall) > 1000;
SELECT Fornavn, Etternavn, Fødselsdato FROM Ansatt WHERE Fødselsdato = (SELECT MAX(Fødselsdato) FROM Ansatt);
SELECT Fornavn, Etternavn, Fødselsdato FROM Ansatt WHERE Fødseldato = (SELECT MIN(Fødselsdato) FROM ANSATT);

-- Oppgave 4
-- 4.2
SELECT k.Fornavn, k.Etternavn, p.Poststed FROM Kunde k JOIN poststed p on k.postnr = p.postnr LIMIT 20;
SELECT v.Betegnelse, k.navn FROM Vare v JOIN Kategori k ON v.KatNr = k.KatNr LIMIT 20;
SELECT * FROM Ordre o LEFT JOIN Kunde k ON k.KNr = o.KNr WHERE o.OrdreDato IS NOT NULL;
SELECT * FROM Vare v LEFT JOIN Ordrelinje ol ON v.VNr = ol.VNr WHERE ol.VNr IS NULL;
SELECT v.VNr, SUM(ol.Antall) FROM Vare v JOIN Ordrelinje ol ON v.VNr = ol.VNr GROUP BY v.VNr;
SELECT a.fornavn, a.etternavn FROM Ansatt a JOIN Poststed p ON p.PostNr = a.PostNr WHERE p.Poststed ILIKE 'Bø i Telemark';

-- Oppgave 5
-- 5.2
SELECT COUNT(*) FROM Ansatt a WHERE Bonus IS NULL;
SELECT AVG(COALESCE(Bonus, 0)) AS GjennomsnittsBonus FROM Ansatt;
SELECT * FROM Kunde WHERE Telefon IS NULL;
SELECT SUM(COALESCE(Årslønn, 0) + COALESCE(Bonus, 0)) as TotalLønnskostnad FROM Ansatt;
SELECT Stilling, COUNT(*) FROM Ansatt WHERE Bonus IS NOT NULL GROUP BY Stilling;
SELECT MIN(Bonus) FROM Ansatt;

-- Oppgave 6
-- 6.2

