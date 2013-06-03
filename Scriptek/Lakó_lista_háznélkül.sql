--@Lak�_lista_h�zn�lk�l
SET LINESIZE 100
SET PAGESIZE 15


BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'H�zba m�g be nem sorolt lak�k orsz�gonk�nti list�ja' SKIP 1 -
CENTER ============================================================== SKIP 3

COLUMN N�v HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN Sz�let�siD�tum			FORMAT A15 HEADING 'Sz�let�si|d�tum' JUSTIFY CENTER
COLUMN Szem�lyigazolv�ny_sz�m	FORMAT A10 HEADING 'Szem�ly-|igazolv�ny|sz�m' JUSTIFY CENTER

BREAK ON Orsz�g

SELECT
	N�v,
	Eg�szs�gbiztos�t�si_sz�m,
	Nem,
	Sz�let�siD�tum,
	Szem�lyigazolv�ny_sz�m
FROM Lak�k
WHERE h�z_sz�m is null
ORDER BY Orsz�g;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
