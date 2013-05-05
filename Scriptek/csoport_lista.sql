SET linesize 70

TTITLE 'Csoportok listálya'

COLUMN csoport_név FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezető FORMAT A20 HEADING 'Csoportvezető neve' JUSTIFY CENTER
COLUMN csoport_pontszám FORMAT 9999.9 HEADING "Coport pontszáma" JUSTIFY CENTER

SELECT * FROM Csoportok;

TTITLE OFF
COLUMN csoport_név CLEAR
COLUMN csoportvezető CLEAR
COLUMN csoport_pontszám CLEAR
