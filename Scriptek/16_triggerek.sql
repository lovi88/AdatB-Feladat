
CREATE or replace view LakóNézet as
select * from Lakók;


drop trigger HázBeteltTrigger;
create or replace trigger HázBeteltTrigger 
before insert on Lakók FOR EACH ROW
begin
	
	if HázBetelt(:new.ház_szám) then
		RAISE_APPLICATION_ERROR(-20001,'Betelt a ház');
	end if;

end;
/



create or replace view CsoportokNézet 
as
select * from Csoportok;


drop trigger TúlSokCsoportjaLenne;
create or replace trigger TúlSokCsoportjaLenne 
instead of insert on CsoportokNézet
declare
	szam NUMBER;
begin
	szam := CsoportvezetõCsoportSzám(:new.csoportvezetõ);
	
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



DROP TRIGGER ÁtlagonFelüliCsoportArhiváló;
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