--csoport_lakó_lista

SET LINESIZE 100
SET PAGESIZE 70


BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Csoportonkénti lakólista' SKIP 1 -
CENTER ============================================================ SKIP 3



COLUMN csoport_név FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezetõ FORMAT A20 HEADING 'Csoportvezetõ neve' JUSTIFY CENTER
COLUMN csoport_pontszám FORMAT 9999.9 HEADING "Coport pontszáma" JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
BREAK ON csoport_név ON csoportvezetõ


SELECT
	Csoportok.csoport_név		,
	Csoportok.csoportvezetõ	,
	Név as Lakó,
	Egészségbiztosítási_szám
FROM Csoportok, Lakók
WHERE Lakók.Csoport_név = Csoportok.Csoport_név and Lakók.csoportvezetõ=Csoportok.csoportvezetõ
ORDER BY csoportvezetõ, csoport_név, Lakó;



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
clear breaks