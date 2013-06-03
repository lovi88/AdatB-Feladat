--@Lak�_Legnagyobb_h�zak
SET LINESIZE 100
SET PAGESIZE 35

COLUMN N�v HEADING 'Neve'		FORMAT A20 JUSTIFY CENTER
COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTER
COLUMN Sz�let�siD�tum			FORMAT A15 HEADING 'Sz�let�si|d�tum' JUSTIFY CENTER
COLUMN Szem�lyigazolv�ny_sz�m	FORMAT A10 HEADING 'Szem�ly-|igazolv�ny|sz�m' JUSTIFY CENTER
COLUMN h�z_sz�m FORMAT 999 HEADING 'H�zsz�m' JUSTIFY CENTER


CREATE OR REPLACE VIEW LegnagyobbH�zak
AS
SELECT h�z_sz�m FROM H�zak
WHERE f�r�hely_sz�m > 15;


SELECT 	
	N�v,
	Eg�szs�gbiztos�t�si_sz�m,
	h�z_sz�m,
	Sz�let�siD�tum,
	Szem�lyigazolv�ny_sz�m
FROM Lak�k
WHERE h�z_sz�m IN (SELECT * FROM LegnagyobbH�zak);