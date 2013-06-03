--@Lakó_legidõsebb_ANY
SET LINESIZE 100
SET PAGESIZE 13

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Lakók Listája' SKIP 1 -
CENTER ==================== SKIP 3

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A15 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER

SELECT 
	Név,
	Egészségbiztosítási_szám,
	SzületésiDátum,
	Nem,
	Személyigazolvány_szám
FROM Lakók
where NOT(SzületésiDátum > ANY (Select SzületésiDátum From Lakók));


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS