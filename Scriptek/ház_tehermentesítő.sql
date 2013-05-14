--ház_tehermentesítõ

--a közel betelt házakból átteszük a lakókat egy nagyobba, ha tudjuk
--végül commit/rollback


create or replace view ház_lakó
as
SELECT
	Házak.ház_szám,
	count(Egészségbiztosítási_szám) as Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;


create or replace view ház_leterheltseg_nezet
as
SELECT 
	Házak.ház_szám,
	férõhely_szám,
	Lakószám,
	férõhely_szám - Lakószám as szabad_helyek
FROM  Házak, ház_lakó
WHERE ház_lakó.ház_szám = Házak.ház_szám;

SAVEPOINT tehrementesit;

select * from ház_leterheltseg_nezet;

DECLARE
	seged_ház_szám NUMBER;
BEGIN
	for i IN
	(
		select * FROM ház_leterheltseg_nezet WHERE szabad_helyek < férõhely_szám/5
	)
	loop
		begin
			--ez a blokk azért kell, hogy mûködjön az exception handling loopon belül
			SELECT ház_szám
			INTO seged_ház_szám
			FROM
				(
					SELECT ház_szám, ROWNUM as s 
					FROM ház_leterheltseg_nezet
					WHERE (szabad_helyek - i.Lakószám) >= (férõhely_szám/5)
				)
			WHERE s = 1;
			
			update Lakók set ház_szám = seged_ház_szám
			WHERE ház_szám = i.ház_szám;
			
			EXCEPTION
				WHEN NO_DATA_FOUND THEN dbms_output.put_line('kimaradt');
			
		end;
	end loop;
	
END;
/

SHOW ERRORS

select * from ház_leterheltseg_nezet;


ACCEPT vissza PROMPT 'visszaállítja(v) vagy elfogadja(e) a változtatást: '

BEGIN
	IF '&vissza'='e' THEN
		commit;
	ELSE
		ROLLBACK TO tehrementesit;
	END IF;
		
END;
/

