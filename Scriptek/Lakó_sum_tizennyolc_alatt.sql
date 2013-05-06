
SET LINESIZE 150
SET PAGESIZE 200

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'A 18 évnél fiatalabb lakók száma' SKIP 1 -
CENTER ============================================================ SKIP 3


SELECT 
	SUM((TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(SzületésiDátum,'YYYY'))) as "Kiskorúak száma"
FROM Lakók
ORDER BY Név
HAVING (TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(SzületésiDátum,'YYYY'))<18;



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
UNDEFINE n