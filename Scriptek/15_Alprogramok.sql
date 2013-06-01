--@15_Alprogramok

CREATE OR REPLACE FUNCTION KorSz�m�t(sz�l_d�tum IN DATE)
	RETURN NUMBER
AS
BEGIN
	 RETURN TRUNC(MONTHS_BETWEEN(SYSDATE,sz�l_d�tum)/12);
END;
/



create or replace view h�z_lak� as
SELECT
	H�zak.h�z_sz�m,
	count(N�v) as Lak�sz�m
FROM  H�zak, Lak�k
WHERE H�zak.h�z_sz�m = Lak�k.h�z_sz�m
GROUP BY H�zak.h�z_sz�m;

create or replace view h�z_tel�tetts�g_n�zet
as
SELECT
	H�zak.h�z_sz�m,
	f�r�hely_sz�m as f�r�helyek,
	Lak�sz�m
FROM  H�zak, h�z_lak�
WHERE h�z_lak�.h�z_sz�m = H�zak.h�z_sz�m;


drop function H�zBetelt;
create or replace function H�zBetelt(h_szam in NUMBER)
	return boolean
is
	ferohely NUMBER;
begin

	SELECT (f�r�helyek-Lak�sz�m)
	INTO ferohely
	FROM h�z_tel�tetts�g_n�zet, H�zak
	WHERE H�zak.h�z_sz�m = h_szam;
	
	if ferohely<=0
	then
		return false;
	end if;
	
	return true;
end;
/


drop function Csoportvezet�CsoportSz�m;
create or replace function Csoportvezet�CsoportSz�m(cs_vez in Csoportok.csoportvezet�%TYPE)
	return NUMBER
is
	szam NUMBER;
begin

	SELECT count(csoportvezet�)
	INTO szam
	FROM Csoportok
	WHERE csoportvezet� = cs_vez
	GROUP BY csoportvezet�;
	
	return szam;
end;
/


drop function L�tez�Csoport;
create or replace function L�tez�Csoport(
								cs_vez in Csoportok.csoportvezet�%TYPE,
								cs_megnevez�s IN Csoportok.csoport_n�v%TYPE
							)
	return BOOLEAN
is
	szam NUMBER;
begin

	SELECT count(csoportvezet�)
	INTO szam
	FROM Csoportok
	WHERE csoportvezet� = cs_vez and csoport_n�v = cs_megnevez�s
	GROUP BY csoportvezet�;
	
	if szam >= 0
	then
		return true;
	end if;
	
	return false;
end;
/
