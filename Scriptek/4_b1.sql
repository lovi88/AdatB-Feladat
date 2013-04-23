--Adott nemű Lakók átlagéletkora

UNDEFINE n
ACCEPT n CHAR PROMPT 'A listázandóak neme: {n|f}'

SELECT AVG((TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(SzületésiDátum,'YYYY'))) as átlagéletkor 
FROM Lakók
GROUP BY SzületésiDátum
HAVING Nem=LOWER(&n);

UNDEFINE n