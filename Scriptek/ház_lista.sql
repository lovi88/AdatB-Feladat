SET linesize 50
SET pagesize 20


TTITLE 'H�zak list�ja'
BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

COLUMN h�z_sz�m FORMAT 999 HEADING 'H�zsz�m' JUSTIFY CENTER
COLUMN h�z_megnevez�s FORMAT A20 HEADING 'H�z neve' JUSTIFY CENTER
COLUMN f�r�hely_sz�m FORMAT 999 HEADING "Max f�r�hely" JUSTIFY CENTER

SELECT h�z_sz�m,h�z_megnevez�s,f�r�hely_sz�m FROM H�zak;

TTITLE OFF
BTITLE OFF

COLUMN h�z_sz�m CLEAR
COLUMN h�z_megnevez�s CLEAR
COLUMN f�r�hely_sz�m CLEAR
