--Adott nem� Lak�k �tlag�letkora
PROMPT Adott nem� Lak�k �tlag�letkora
ACCEPT n CHAR PROMPT 'A list�zand�ak neme: {n|f}'

SET LINESIZE 150
SET PAGESIZE 200

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER 'Adott nem� Lak�k �tlag�letkora' SKIP 1 -
CENTER ============================================================ SKIP 3


SELECT 
	AVG((TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(Sz�let�siD�tum,'YYYY'))) as �tlag�letkor
FROM Lak�k
ORDER BY N�v
HAVING Nem=LOWER(&n);



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
UNDEFINE n
