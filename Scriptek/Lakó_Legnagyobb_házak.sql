--@Lakó_Legnagyobb_házak
SET LINESIZE 100
SET PAGESIZE 35

COLUMN Név HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Egészségbiztosítási_szám FORMAT A11 HEADING 'Egészség-|biztosítási|szám' JUSTIFY CENTER
COLUMN SzületésiDátum			FORMAT A15 HEADING 'Születési|dátum' JUSTIFY CENTER
COLUMN Személyigazolvány_szám	FORMAT A10 HEADING 'Személy-|igazolvány|szám' JUSTIFY CENTER
COLUMN ház_szám FORMAT 999 HEADING 'Házszám' JUSTIFY CENTER


CREATE OR REPLACE VIEW LegnagyobbHázak
AS
SELECT ház_szám FROM Házak
WHERE férõhely_szám > 15;


SELECT 	
	Név,
	Egészségbiztosítási_szám,
	ház_szám,
	SzületésiDátum,
	Személyigazolvány_szám
FROM Lakók
WHERE ház_szám IN (SELECT * FROM LegnagyobbHázak);