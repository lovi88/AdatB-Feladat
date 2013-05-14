SET linesize 70
SET pagesize 25

TTITLE 'Csoportok list�lya'
BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

COLUMN csoport_n�v FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezet� FORMAT A20 HEADING 'Csoportvezet� neve' JUSTIFY CENTER
COLUMN csoport_pontsz�m FORMAT 9999.9 HEADING "Coport pontsz�ma" JUSTIFY CENTER

SELECT * FROM Csoportok;

TTITLE OFF
BTITLE OFF

COLUMN csoport_n�v CLEAR
COLUMN csoportvezet� CLEAR
COLUMN csoport_pontsz�m CLEAR
