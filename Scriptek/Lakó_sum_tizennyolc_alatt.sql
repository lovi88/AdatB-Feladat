--@Lak�_sum_tizennyolc_alatt
SET LINESIZE 100
SET PAGESIZE 10

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'A 18 �vn�l fiatalabb lak�k sz�ma' SKIP 1 -
CENTER ============================================================ SKIP 3

SELECT 
	SUM(KorSz�m�t(Sz�let�siD�tum)) as "Kiskor�ak sz�ma"
FROM Lak�k
WHERE KorSz�m�t(Sz�let�siD�tum)<18;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS