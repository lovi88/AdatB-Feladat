SET linesize 50
SET pagesize 20


TTITLE 'Házak listája'
BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

COLUMN ház_szám FORMAT 999 HEADING 'Házszám' JUSTIFY CENTER
COLUMN ház_megnevezés FORMAT A20 HEADING 'Ház neve' JUSTIFY CENTER
COLUMN férõhely_szám FORMAT 999 HEADING "Max férõhely" JUSTIFY CENTER

SELECT ház_szám,ház_megnevezés,férõhely_szám FROM Házak;

TTITLE OFF
BTITLE OFF

COLUMN ház_szám CLEAR
COLUMN ház_megnevezés CLEAR
COLUMN férõhely_szám CLEAR
