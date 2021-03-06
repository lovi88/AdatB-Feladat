--@16_triggerek


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
	szam := CsoportvezetőCsoportSzám(:new.csoportvezető);
	
	if szam>=5
	then
		RAISE_APPLICATION_ERROR(-20001,'5-nél több csoportja lenne');
	end if;
		
	insert into Csoportok
	(
		csoport_név,
		csoportvezető,
		csoport_pontszám
	)
	VALUES
	(
		:new.csoport_név,
		:new.csoportvezető,
		:new.csoport_pontszám
	);

end;
/
SHOW ERRORS


DROP TABLE CsoportokArch;
CREATE TABLE CsoportokArch(
	ArhiválásIdeje		DATE,
	csoport_név			VARCHAR2(50),
	csoportvezető		VARCHAR2(30),
	csoport_pontszám	NUMBER(5,1)
);

ALTER TABLE CsoportokArch ADD CONSTRAINTS p_CsoportokArch PRIMARY KEY (csoport_név,csoportvezető,ArhiválásIdeje);


DROP TABLE csop_puffer;
CREATE TABLE csop_puffer 
AS SELECT * FROM Csoportok;

--mutating table error ellen
DROP TRIGGER CsoportArhiválóHelp;
create or replace trigger CsoportArhiválóHelp
before delete on Csoportok
begin
	
	DELETE FROM csop_puffer;
	INSERT INTO csop_puffer (csoport_név,csoportvezető,csoport_pontszám)
	SELECT csoport_név,csoportvezető,csoport_pontszám FROM Csoportok;
end;
/
SHOW ERRORS




create or replace view CsoportokÁtlag
as
select round(avg(NVL(csoport_pontszám,0)),0) as atlag
from csop_puffer;


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
			csoportvezető	,	
			csoport_pontszám
		)
		VALUES
		(
			sysdate,
			:old.csoport_név,
			:old.csoportvezető,
			:old.csoport_pontszám
		);
		
	end if;
end;
/
SHOW ERRORS


DROP TRIGGER tiltás;
CREATE OR REPLACE TRIGGER tiltás
BEFORE DELETE OR INSERT OR UPDATE ON Házak
BEGIN
	IF to_char(sysdate,'HH24:MI') NOT BETWEEN '08:00' AND '16:00'
	THEN
	RAISE_APPLICATION_ERROR(-20111, 'Az adatbázis csak munkaidőben módosítható!');
	END IF;
END;
/
SHOW ERRORS
