SET LINESIZE 150
SET PAGESIZE 20

set verify on

ACCEPT résszó PROMPT 'Adja meg a keresett résszót: '

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'A "&résszó" résszót tartalmazó nevû lakók listája' SKIP 1 -
CENTER ============================================================== SKIP 3

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A14 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER
COLUMN Tartózkodas_tól			FORMAT A13 HEADING 'Tartózkodás|kezdete' JUSTIFY CENTER
COLUMN Tartózkodas_ig			FORMAT A13 HEADING 'Tartózkodás|vége' JUSTIFY CENTER
COLUMN Ország					FORMAT A15 HEADING 'Ország' JUSTIFY CENTER


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
WHERE Név LIKE '%&résszó%'
ORDER BY Név,Ország,Nem;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
