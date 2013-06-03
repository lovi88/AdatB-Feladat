--@Lakó_sum_tizennyolc_alatt
SET LINESIZE 100
SET PAGESIZE 10

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'A 18 évnél fiatalabb lakók száma' SKIP 1 -
CENTER ============================================================ SKIP 3

SELECT 
	SUM(KorSzámít(SzületésiDátum)) as "Kiskorúak száma"
FROM Lakók
WHERE KorSzámít(SzületésiDátum)<18;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS