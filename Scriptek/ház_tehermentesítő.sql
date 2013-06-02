--@h�z_tehermentes�t�

--a k�zel betelt h�zakb�l �ttesz�k a lak�kat egy nagyobba, ha tudjuk
--v�g�l commit/rollback

CREATE OR REPLACE VIEW h�z_lak�
AS
SELECT
	H�zak.h�z_sz�m,
	COUNT(Eg�szs�gbiztos�t�si_sz�m) as Lak�sz�m
FROM  H�zak, Lak�k
WHERE H�zak.h�z_sz�m = Lak�k.h�z_sz�m
GROUP BY H�zak.h�z_sz�m;


CREATE OR REPLACE VIEW h�z_leterheltseg_nezet
AS
SELECT 
	H�zak.h�z_sz�m,
	f�r�hely_sz�m,
	Lak�sz�m,
	f�r�hely_sz�m - Lak�sz�m AS szabad_helyek
FROM  H�zak, h�z_lak�
WHERE h�z_lak�.h�z_sz�m = H�zak.h�z_sz�m;

SAVEPOINT tehermentesit;

SELECT * FROM h�z_leterheltseg_nezet;

DECLARE
	seged_h�z_sz�m NUMBER;
BEGIN
	for i IN
	(
		SELECT * FROM h�z_leterheltseg_nezet WHERE szabad_helyek < f�r�hely_sz�m/5
	)
	loop
		begin
			--ez a blokk az�rt kell, hogy m�k�dj�n az exception handling loopon bel�l
			SELECT h�z_sz�m
			INTO seged_h�z_sz�m
			FROM
				(
					SELECT h�z_sz�m, ROWNUM as s 
					FROM h�z_leterheltseg_nezet
					WHERE (szabad_helyek - i.Lak�sz�m) >= (f�r�hely_sz�m/5)
				)
			WHERE s = 1;
			
			UPDATE Lak�k SET h�z_sz�m = seged_h�z_sz�m
			WHERE h�z_sz�m = i.h�z_sz�m;
			
			EXCEPTION
				WHEN NO_DATA_FOUND THEN dbms_output.put_line('kimaradt');
			
		end;
	end loop;
	
END;
/

SHOW ERRORS

SELECT * FROM h�z_leterheltseg_nezet;

ACCEPT vissza PROMPT 'vissza�ll�tja(v) vagy elfogadja(e) a v�ltoztat�st: '

BEGIN
	IF '&vissza'='e' THEN
		commit;
	ELSE
		ROLLBACK TO tehermentesit;
	END IF;
		
END;
/

UNDEFINE vissza