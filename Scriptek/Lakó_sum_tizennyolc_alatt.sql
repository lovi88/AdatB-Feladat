
SET LINESIZE 150
SET PAGESIZE 200

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'A 18 �vn�l fiatalabb lak�k sz�ma' SKIP 1 -
CENTER ============================================================ SKIP 3


SELECT 
	SUM((TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(Sz�let�siD�tum,'YYYY'))) as "Kiskor�ak sz�ma"
FROM Lak�k
ORDER BY N�v
HAVING (TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(Sz�let�siD�tum,'YYYY'))<18;



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
UNDEFINE n