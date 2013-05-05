--fiúk/lányok lakók név szerint listázva
PROMPT Nem szerinti lakólista, név szerint növekvõen listázva
ACCEPT n CHAR PROMPT 'A listázandóak neme: {n|f}'

SET LINESIZE 150
SET PAGESIZE 200

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Nem szerinti lakólista, név szerint növekvõen listázva' SKIP 1 -
CENTER ============================================================ SKIP 3

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A15 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER
COLUMN Tartózkodas_tól			FORMAT A13 HEADING 'Tartózkodás|kezdete' JUSTIFY CENTER
COLUMN Tartózkodas_ig			FORMAT A13 HEADING 'Tartózkodás|vége' JUSTIFY CENTER
COLUMN Ország					FORMAT A20 HEADING 'Ország' JUSTIFY CENTER


SELECT 
	Név,
	Egészségbiztosítási_szám,
	SzületésiDátum,
	Nem,
	Személyigazolvány_szám,
	Tartózkodas_tól,
	Tartózkodas_ig,
	Ország
FROM Lakók
WHERE Nem=LOWER(&n)
ORDER BY Név;


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
