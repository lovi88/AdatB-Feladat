SET LINESIZE 150
SET PAGESIZE 20

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Házankénti telítettség' SKIP 1 -
CENTER ============================================================ SKIP 3

--@ház_tel
SELECT
	Házak.ház_szám,
	count(Név) as Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS