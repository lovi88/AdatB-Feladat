--@csoport_els�_�t

SET linesize 70
SET pagesize 14

TTITLE 'Csoportok list�lya'
BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

COLUMN csoport_n�v FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezet� FORMAT A20 HEADING 'Csoportvezet� neve' JUSTIFY CENTER
COLUMN csoport_pontsz�m FORMAT 9999.9 HEADING "Coport pontsz�ma" JUSTIFY CENTER


CREATE OR REPLACE VIEW CsopRendezett
AS
SELECT * FROM Csoportok 
WHERE csoport_pontsz�m IS NOT NULL
ORDER BY csoport_pontsz�m DESC;

SELECT 
	ROWNUM AS Sorsz�m,
	csoport_n�v,
	csoportvezet�,
	csoport_pontsz�m 
FROM (SELECT * FROM CsopRendezett WHERE ROWNUM <= 5);

TTITLE OFF
BTITLE OFF

COLUMN csoport_n�v CLEAR
COLUMN csoportvezet� CLEAR
COLUMN csoport_pontsz�m CLEAR