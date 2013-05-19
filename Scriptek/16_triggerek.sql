
CREATE or replace view Lak�N�zet as
select * from Lak�k;


drop trigger H�zBeteltTrigger;
create or replace trigger H�zBeteltTrigger 
before insert on Lak�k FOR EACH ROW
begin
	
	if H�zBetelt(:new.h�z_sz�m) then
		RAISE_APPLICATION_ERROR(-20001,'Betelt a h�z');
	end if;

end;
/



create or replace view CsoportokN�zet 
as
select * from Csoportok;


drop trigger T�lSokCsoportjaLenne;
create or replace trigger T�lSokCsoportjaLenne 
instead of insert on CsoportokN�zet
declare
	szam NUMBER;
begin
	szam := Csoportvezet�CsoportSz�m(:new.csoportvezet�);
	
	if szam>=3
	then
		RAISE_APPLICATION_ERROR(-20001,'5-n�l t�bb csoportja lenne');
	end if;
		
	insert into Csoportok
	(
		csoport_n�v,
		csoportvezet�,
		csoport_pontsz�m
	)
	VALUES
	(
		:new.csoport_n�v,
		:new.csoportvezet�,
		:new.csoport_pontsz�m
	);

end;
/
SHOW ERRORS



DROP TABLE CsoportokArch;
CREATE TABLE CsoportokArch(
	Arhiv�l�sIdeje		DATE,
	csoport_n�v			VARCHAR2(50),
	csoportvezet�		VARCHAR2(30),
	csoport_pontsz�m	NUMBER(5,1)
);

ALTER TABLE CsoportokArch ADD CONSTRAINTS p_CsoportokArch PRIMARY KEY (csoport_n�v,csoportvezet�,Arhiv�l�sIdeje);

create or replace view Csoportok�tlag
as
select round(avg(NVL(csoport_pontsz�m,0)),0) as atlag
from Csoportok;



DROP TRIGGER �tlagonFel�liCsoportArhiv�l�;
create or replace trigger �tlagonFel�liCsoportArhiv�l� 
after delete on Csoportok FOR EACH ROW
declare
	szam NUMBER;
begin

	select atlag 
	into szam
	from Csoportok�tlag;
	
	if :old.csoport_pontsz�m >= szam
	then

		insert into CsoportokArch
		(
			Arhiv�l�sIdeje	,
			csoport_n�v		,
			csoportvezet�	,	
			csoport_pontsz�m
		)
		VALUES
		(
			sysdate,
			:old.csoport_n�v,
			:old.csoportvezet�,
			:old.csoport_pontsz�m
		);
		
	end if;
end;
/
SHOW ERRORS