--@Lakó_nem_átlagéletkor
--Adott nemû Lakók átlagéletkora
PROMPT Adott nemû Lakók átlagéletkora
ACCEPT n CHAR PROMPT 'A listázandóak neme: {n|f} '

SET LINESIZE 100
SET PAGESIZE 10

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'

TTITLE CENTER 'Adott nemû Lakók átlagéletkora' SKIP 1 -
CENTER ============================================================ SKIP 3


SELECT 
	AVG((TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(SzületésiDátum,'YYYY'))) as Átlagéletkor
FROM Lakók
WHERE Nem=LOWER('&n')
GROUP BY Nem;

TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
UNDEFINE n
