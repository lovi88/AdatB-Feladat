--@15_Alprogramok

CREATE OR REPLACE FUNCTION KorSzámít(szül_dátum IN DATE)
	RETURN NUMBER
AS
BEGIN
	 RETURN TRUNC(MONTHS_BETWEEN(SYSDATE,szül_dátum)/12);
END;
/



create or replace view ház_lakó as
SELECT
	Házak.ház_szám,
	count(Név) as Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;

create or replace view ház_telítettség_nézet
as
SELECT
	Házak.ház_szám,
	férõhely_szám as férõhelyek,
	Lakószám
FROM  Házak, ház_lakó
WHERE ház_lakó.ház_szám = Házak.ház_szám;


drop function HázBetelt;
create or replace function HázBetelt(h_szam in NUMBER)
	return boolean
is
	ferohely NUMBER;
begin

	SELECT (férõhelyek-Lakószám)
	INTO ferohely
	FROM ház_telítettség_nézet, Házak
	WHERE Házak.ház_szám = h_szam;
	
	if ferohely<=0
	then
		return false;
	end if;
	
	return true;
end;
/


drop function CsoportvezetõCsoportSzám;
create or replace function CsoportvezetõCsoportSzám(cs_vez in Csoportok.csoportvezetõ%TYPE)
	return NUMBER
is
	szam NUMBER;
begin

	SELECT count(csoportvezetõ)
	INTO szam
	FROM Csoportok
	WHERE csoportvezetõ = cs_vez
	GROUP BY csoportvezetõ;
	
	return szam;
end;
/


drop function LétezõCsoport;
create or replace function LétezõCsoport(
								cs_vez in Csoportok.csoportvezetõ%TYPE,
								cs_megnevezés IN Csoportok.csoport_név%TYPE
							)
	return BOOLEAN
is
	szam NUMBER;
begin

	SELECT count(csoportvezetõ)
	INTO szam
	FROM Csoportok
	WHERE csoportvezetõ = cs_vez and csoport_név = cs_megnevezés
	GROUP BY csoportvezetõ;
	
	if szam >= 0
	then
		return true;
	end if;
	
	return false;
end;
/
