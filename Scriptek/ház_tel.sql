SET LINESIZE 50
SET PAGESIZE 20

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Házankénti telítettség' SKIP 1 -
CENTER ============================================================ SKIP 3

--@ház_tel

create or replace view ház_lakó as
SELECT
	Házak.ház_szám,
	count(Egészségbiztosítási_szám) as Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;


SELECT
	Házak.ház_szám,
	férõhely_szám as férõhelyek,
	Lakószám
FROM  Házak, ház_lakó
WHERE ház_lakó.ház_szám = Házak.ház_szám;


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS