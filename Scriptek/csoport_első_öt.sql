--@csoport_elsõ_öt

SET linesize 70
SET pagesize 14

TTITLE 'Csoportok listálya'
BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

COLUMN csoport_név FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezetõ FORMAT A20 HEADING 'Csoportvezetõ neve' JUSTIFY CENTER
COLUMN csoport_pontszám FORMAT 9999.9 HEADING "Coport pontszáma" JUSTIFY CENTER


CREATE OR REPLACE VIEW CsopRendezett
AS
SELECT * FROM Csoportok 
WHERE csoport_pontszám IS NOT NULL
ORDER BY csoport_pontszám DESC;

SELECT 
	ROWNUM AS Sorszám,
	csoport_név,
	csoportvezetõ,
	csoport_pontszám 
FROM (SELECT * FROM CsopRendezett WHERE ROWNUM <= 5);

TTITLE OFF
BTITLE OFF

COLUMN csoport_név CLEAR
COLUMN csoportvezetõ CLEAR
COLUMN csoport_pontszám CLEAR