--@Lakó_lista_nem
--fiúk/lányok lakók név szerint listázva
PROMPT Nem szerinti lakólista, név szerint növekvõen listázva
ACCEPT n CHAR PROMPT 'A listázandóak neme: {n|f} '

SET LINESIZE 100
SET PAGESIZE 44

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Nem szerinti lakólista, név szerint növekvõen listázva' SKIP 1 -
CENTER ============================================================ SKIP 3

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A15 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER

SELECT 
	Név,
	Egészségbiztosítási_szám,
	SzületésiDátum,
	Személyigazolvány_szám
FROM Lakók
WHERE Nem=LOWER('&n')
ORDER BY Név;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS

UNDEFINE n