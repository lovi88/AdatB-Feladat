
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


CREATE or replace view LakóNézet as
select * from Lakók;



drop trigger HázBetelt;
create or replace trigger HázBetelt 
instead of insert on LakóNézet
declare
	ferohely NUMBER;
begin
	if :new.ház_szám is not null
	then
		SELECT (férõhelyek-Lakószám)
		INTO ferohely
		FROM ház_telítettség_nézet, Házak
		WHERE Házak.ház_szám = :new.ház_szám;
		
		if ferohely<=0
		then
			RAISE_APPLICATION_ERROR(-20001,'Betelt a ház');
		end if;
		
	end if;
	
	insert into Lakók
	(
		Név,
		Egészségbiztosítási_szám,
		SzületésiDátum,
		Nem,
		Személyigazolvány_szám,
		Tartózkodas_tól,
		Tartózkodas_ig,
		Ország,
		ház_szám,
		Csoport_név,
		Csoportvezetõ
	)
	VALUES
	(
		:new.Név,
		:new.Egészségbiztosítási_szám,
		:new.SzületésiDátum,
		:new.Nem,
		:new.Személyigazolvány_szám,
		:new.Tartózkodas_tól,
		:new.Tartózkodas_ig,
		:new.Ország,
		:new.ház_szám,
		:new.Csoport_név,
		:new.Csoportvezetõ
	);
	
end;
/
SHOW ERRORS



create or replace view CsoportokNézet 
as
select * from Csoportok;

drop trigger TúlSokCsoportjaLenne;

create or replace trigger TúlSokCsoportjaLenne 
instead of insert on CsoportokNézet
declare
	szam NUMBER;
begin

	SELECT count(csoportvezetõ)
	INTO szam
	FROM Csoportok
	WHERE csoportvezetõ = :new.csoportvezetõ
	GROUP BY csoportvezetõ;
	
	if szam>=3
	then
		RAISE_APPLICATION_ERROR(-20001,'5-nél több csoportja lenne');
	end if;
		
	insert into Csoportok
	(
		csoport_név,
		csoportvezetõ,
		csoport_pontszám
	)
	VALUES
	(
		:new.csoport_név,
		:new.csoportvezetõ,
		:new.csoport_pontszám
	);

end;
/
SHOW ERRORS



DROP TABLE CsoportokArch;
CREATE TABLE CsoportokArch(
	ArhiválásIdeje		DATE,
	csoport_név			VARCHAR2(50),
	csoportvezetõ		VARCHAR2(30),
	csoport_pontszám	NUMBER(5,1)
);

ALTER TABLE CsoportokArch ADD CONSTRAINTS p_CsoportokArch PRIMARY KEY (csoport_név,csoportvezetõ,ArhiválásIdeje);

create or replace view CsoportokÁtlag
as
select round(avg(NVL(csoport_pontszám,0)),0) as atlag
from Csoportok;


create or replace trigger ÁtlagonFelüliCsoportArhiváló 
after delete on Csoportok FOR EACH ROW
declare
	szam NUMBER;
begin

	select atlag 
	into szam
	from CsoportokÁtlag;
	
	if :old.csoport_pontszám >= szam
	then

		insert into CsoportokArch
		(
			ArhiválásIdeje	,
			csoport_név		,
			csoportvezetõ	,	
			csoport_pontszám
		)
		VALUES
		(
			sysdate,
			:old.csoport_név,
			:old.csoportvezetõ,
			:old.csoport_pontszám
		);
		
	end if;
end;
/
SHOW ERRORS