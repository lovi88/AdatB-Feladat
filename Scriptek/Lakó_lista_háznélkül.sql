--@Lakó_lista_háznélkül
SET LINESIZE 100
SET PAGESIZE 15


BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Házba még be nem sorolt lakók országonkénti listája' SKIP 1 -
CENTER ============================================================== SKIP 3

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A15 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER

BREAK ON Ország

SELECT
	Név,
	Egészségbiztosítási_szám,
	Nem,
	SzületésiDátum,
	Személyigazolvány_szám
FROM Lakók
WHERE ház_szám is null
ORDER BY Ország;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
