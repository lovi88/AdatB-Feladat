--@ház_tel

SET LINESIZE 60
SET PAGESIZE 20

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Házankénti telítettség' SKIP 1 -
CENTER ============================================================ SKIP 3

CREATE OR REPLACE VIEW ház_lakó AS
SELECT
	Házak.ház_szám,
	count(Egészségbiztosítási_szám) AS Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;


SELECT
	Házak.ház_szám,
	férõhely_szám AS férõhelyek,
	Lakószám,
	férõhely_szám - Lakószám  AS "Szabad Helyek"
FROM  Házak, ház_lakó
WHERE ház_lakó.ház_szám = Házak.ház_szám;


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS