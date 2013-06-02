--@ház_tehermentesítõ

--a közel betelt házakból átteszük a lakókat egy nagyobba, ha tudjuk
--végül commit/rollback

CREATE OR REPLACE VIEW ház_lakó
AS
SELECT
	Házak.ház_szám,
	COUNT(Egészségbiztosítási_szám) as Lakószám
FROM  Házak, Lakók
WHERE Házak.ház_szám = Lakók.ház_szám
GROUP BY Házak.ház_szám;


CREATE OR REPLACE VIEW ház_leterheltseg_nezet
AS
SELECT 
	Házak.ház_szám,
	férõhely_szám,
	Lakószám,
	férõhely_szám - Lakószám AS szabad_helyek
FROM  Házak, ház_lakó
WHERE ház_lakó.ház_szám = Házak.ház_szám;

SAVEPOINT tehermentesit;

SELECT * FROM ház_leterheltseg_nezet;

DECLARE
	seged_ház_szám NUMBER;
BEGIN
	for i IN
	(
		SELECT * FROM ház_leterheltseg_nezet WHERE szabad_helyek < férõhely_szám/5
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
			
			UPDATE Lakók SET ház_szám = seged_ház_szám
			WHERE ház_szám = i.ház_szám;
			
			EXCEPTION
				WHEN NO_DATA_FOUND THEN dbms_output.put_line('kimaradt');
			
		end;
	end loop;
	
END;
/

SHOW ERRORS

SELECT * FROM ház_leterheltseg_nezet;

ACCEPT vissza PROMPT 'visszaállítja(v) vagy elfogadja(e) a változtatást: '

BEGIN
	IF '&vissza'='e' THEN
		commit;
	ELSE
		ROLLBACK TO tehermentesit;
	END IF;
		
END;
/

UNDEFINE vissza