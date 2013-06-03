--@Lak�_lista_nem
--fi�k/l�nyok lak�k n�v szerint list�zva
PROMPT Nem szerinti lak�lista, n�v szerint n�vekv�en list�zva
ACCEPT n CHAR PROMPT 'A list�zand�ak neme: {n|f} '

SET LINESIZE 100
SET PAGESIZE 44

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'Nem szerinti lak�lista, n�v szerint n�vekv�en list�zva' SKIP 1 -
CENTER ============================================================ SKIP 3

COLUMN N�v HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTER
COLUMN Sz�let�siD�tum			FORMAT A15 HEADING 'Sz�let�si|d�tum' JUSTIFY CENTER
COLUMN Szem�lyigazolv�ny_sz�m	FORMAT A10 HEADING 'Szem�ly-|igazolv�ny|sz�m' JUSTIFY CENTER

SELECT 
	N�v,
	Eg�szs�gbiztos�t�si_sz�m,
	Sz�let�siD�tum,
	Szem�lyigazolv�ny_sz�m
FROM Lak�k
WHERE Nem=LOWER('&n')
ORDER BY N�v;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS

UNDEFINE n