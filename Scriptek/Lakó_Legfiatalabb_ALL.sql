--@Lak�_Legfiatalabb_ALL
SET LINESIZE 100
SET PAGESIZE 13

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'A legfiatalabb lak�' SKIP 1 -
CENTER ==================== SKIP 3

COLUMN N�v HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTER
COLUMN Sz�let�siD�tum			FORMAT A15 HEADING 'Sz�let�si|d�tum' JUSTIFY CENTER
COLUMN Nem						FORMAT A4 HEADING 'Neme' JUSTIFY CENTER
COLUMN Szem�lyigazolv�ny_sz�m	FORMAT A10 HEADING 'Szem�ly-|igazolv�ny|sz�m' JUSTIFY CENTER


SELECT 
	N�v,
	Eg�szs�gbiztos�t�si_sz�m,
	Sz�let�siD�tum,
	Nem,
	Szem�lyigazolv�ny_sz�m
FROM Lak�k
where Sz�let�siD�tum >= ALL (Select Sz�let�siD�tum From Lak�k);

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS