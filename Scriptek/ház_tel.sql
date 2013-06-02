--@h�z_tel

SET LINESIZE 60
SET PAGESIZE 20

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'H�zank�nti tel�tetts�g' SKIP 1 -
CENTER ============================================================ SKIP 3

CREATE OR REPLACE VIEW h�z_lak� AS
SELECT
	H�zak.h�z_sz�m,
	count(Eg�szs�gbiztos�t�si_sz�m) AS Lak�sz�m
FROM  H�zak, Lak�k
WHERE H�zak.h�z_sz�m = Lak�k.h�z_sz�m
GROUP BY H�zak.h�z_sz�m;


SELECT
	H�zak.h�z_sz�m,
	f�r�hely_sz�m AS f�r�helyek,
	Lak�sz�m,
	f�r�hely_sz�m - Lak�sz�m  AS "Szabad Helyek"
FROM  H�zak, h�z_lak�
WHERE h�z_lak�.h�z_sz�m = H�zak.h�z_sz�m;


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS