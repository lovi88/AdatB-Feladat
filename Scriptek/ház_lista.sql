SET linesize 50

TTITLE 'H�zak list�lya'

COLUMN h�z_sz�m FORMAT 999 HEADING 'H�zsz�m' JUSTIFY CENTER
COLUMN h�z_megnevez�s FORMAT A20 HEADING 'H�z neve' JUSTIFY CENTER
COLUMN f�r�hely_sz�m FORMAT 999 HEADING "Max f�r�hely" JUSTIFY CENTER

SELECT h�z_sz�m,h�z_megnevez�s,f�r�hely_sz�m FROM H�zak;

TTITLE OFF
COLUMN h�z_sz�m CLEAR
COLUMN h�z_megnevez�s CLEAR
COLUMN f�r�hely_sz�m CLEAR
