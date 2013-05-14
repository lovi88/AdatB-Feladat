--csoport_adott_lakó;Marcelino Gilbert

SET verify OFF
SET LINESIZE 100
SET PAGESIZE 10

ACCEPT lakó PROMPT 'Adja meg a lakó nevét: '

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER '&lakó Csoportja' SKIP 1 -
CENTER ============================================================ SKIP 3



COLUMN csoport_név FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezetõ FORMAT A20 HEADING 'Csoportvezetõ neve' JUSTIFY CENTER
COLUMN csoport_pontszám FORMAT 9999.9 HEADING "Coport pontszáma" JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
BREAK ON csoport_név ON csoportvezetõ


SELECT
	Csoportok.csoport_név	,
	Csoportok.csoportvezetõ	,
	Név as Lakó,
	Egészségbiztosítási_szám
FROM Csoportok, Lakók
WHERE 
	Lakók.Csoport_név = Csoportok.Csoport_név and 
	Lakók.csoportvezetõ=Csoportok.csoportvezetõ and 
	UPPER(Név) = UPPER('&lakó');



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
clear breaks