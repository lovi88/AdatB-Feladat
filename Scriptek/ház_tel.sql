SET LINESIZE 50
SET PAGESIZE 20

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'H�zank�nti tel�tetts�g' SKIP 1 -
CENTER ============================================================ SKIP 3

--@h�z_tel

create or replace view h�z_lak� as
SELECT
	H�zak.h�z_sz�m,
	count(Eg�szs�gbiztos�t�si_sz�m) as Lak�sz�m
FROM  H�zak, Lak�k
WHERE H�zak.h�z_sz�m = Lak�k.h�z_sz�m
GROUP BY H�zak.h�z_sz�m;


SELECT
	H�zak.h�z_sz�m,
	f�r�hely_sz�m as f�r�helyek,
	Lak�sz�m
FROM  H�zak, h�z_lak�
WHERE h�z_lak�.h�z_sz�m = H�zak.h�z_sz�m;


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS