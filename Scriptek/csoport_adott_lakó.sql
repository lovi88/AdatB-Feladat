--csoport_adott_lak�;Marcelino Gilbert

SET verify OFF
SET LINESIZE 100
SET PAGESIZE 10

ACCEPT lak� PROMPT 'Adja meg a lak� nev�t: '

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'

TTITLE CENTER '&lak� Csoportja' SKIP 1 -
CENTER ============================================================ SKIP 3



COLUMN csoport_n�v FORMAT A20 HEADING 'Coport neve' JUSTIFY CENTER
COLUMN csoportvezet� FORMAT A20 HEADING 'Csoportvezet� neve' JUSTIFY CENTER
COLUMN csoport_pontsz�m FORMAT 9999.9 HEADING "Coport pontsz�ma" JUSTIFY CENTER
COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTER
BREAK ON csoport_n�v ON csoportvezet�


SELECT
	Csoportok.csoport_n�v	,
	Csoportok.csoportvezet�	,
	N�v as Lak�,
	Eg�szs�gbiztos�t�si_sz�m
FROM Csoportok, Lak�k
WHERE 
	Lak�k.Csoport_n�v = Csoportok.Csoport_n�v and 
	Lak�k.csoportvezet�=Csoportok.csoportvezet� and 
	UPPER(N�v) = UPPER('&lak�');



TTITLE OFF
BTITLE OFF
CLEAR COLUMNS
clear breaks