SET linesize 70

TTITLE 'Csoportok list�lya'

COLUMN csoport_n�v FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezet� FORMAT A20 HEADING 'Csoportvezet� neve' JUSTIFY CENTER
COLUMN csoport_pontsz�m FORMAT 9999.9 HEADING "Coport pontsz�ma" JUSTIFY CENTER

SELECT * FROM Csoportok;

TTITLE OFF
COLUMN csoport_n�v CLEAR
COLUMN csoportvezet� CLEAR
COLUMN csoport_pontsz�m CLEAR
