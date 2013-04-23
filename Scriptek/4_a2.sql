--egy megadott kornál idősebb lakók listázása, név szerint növekvő, majd kor szerint csökkenően rendezve
--(TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(SzületésiDátum,'YYYY'))
--trunc(months_between(sysdate,dob)/12)
UNDEFINE n

PROMPT 'Egy adott kort betöltők listája:'
ACCEPT k CHAR PROMPT 'kor:'

SELECT 
	Név, 
	trunc(months_between(sysdate,dob)/12) as Kor,
	Személyigazolvány_szám, 
	Csoport_név 
FROM Lakók
where Kor => &k
ORDER BY Név, kor DESC;