
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


CREATE or replace view Lak�N�zet as
select * from Lak�k;



drop trigger H�zBetelt;
create or replace trigger H�zBetelt 
instead of insert on Lak�N�zet
declare
	ferohely NUMBER;
begin
	if :new.h�z_sz�m is not null
	then
		SELECT (f�r�helyek-Lak�sz�m)
		INTO ferohely
		FROM h�z_tel�tetts�g_n�zet, H�zak
		WHERE H�zak.h�z_sz�m = :new.h�z_sz�m;
		
		if ferohely<=0
		then
			RAISE_APPLICATION_ERROR(-20001,'Betelt a h�z');
		end if;
		
	end if;
	
	insert into Lak�k
	(
		N�v,
		Eg�szs�gbiztos�t�si_sz�m,
		Sz�let�siD�tum,
		Nem,
		Szem�lyigazolv�ny_sz�m,
		Tart�zkodas_t�l,
		Tart�zkodas_ig,
		Orsz�g,
		h�z_sz�m,
		Csoport_n�v,
		Csoportvezet�
	)
	VALUES
	(
		:new.N�v,
		:new.Eg�szs�gbiztos�t�si_sz�m,
		:new.Sz�let�siD�tum,
		:new.Nem,
		:new.Szem�lyigazolv�ny_sz�m,
		:new.Tart�zkodas_t�l,
		:new.Tart�zkodas_ig,
		:new.Orsz�g,
		:new.h�z_sz�m,
		:new.Csoport_n�v,
		:new.Csoportvezet�
	);
	
end;
/
SHOW ERRORS



create or replace view CsoportokN�zet 
as
select * from Csoportok;

drop trigger T�lSokCsoportjaLenne;

create or replace trigger T�lSokCsoportjaLenne 
instead of insert on CsoportokN�zet
declare
	szam NUMBER;
begin

	SELECT count(csoportvezet�)
	INTO szam
	FROM Csoportok
	WHERE csoportvezet� = :new.csoportvezet�
	GROUP BY csoportvezet�;
	
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