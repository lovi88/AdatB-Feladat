--@csoport_pl_ins_up

SET verify OFF
SET serveroutput ON

PROMPT Új Csoport felvétele, vagy ha létezik, módosítása
PROMPT Adja meg a csoportot egyértelmûen meghatározó tulajdonságokat:
ACCEPT cs_vez PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT cs_vez_új PROMPT 'Adja meg csoport vezetõjének a nevét (ez lesz az új vezetõ, ha eltér): '
ACCEPT cs_megnevezés PROMPT 'Adja meg a csoport nevét: '
ACCEPT cs_megnevezés_új PROMPT 'Adja meg a csoport nevét (ez lesz az új név, ha eltér): '

SELECT * FROM Csoportok
WHERE csoport_név='&cs_megnevezés' AND csoportvezetõ='&cs_vez';

PROMPT Adja meg a csoport pontszámát
PROMPT -negatív érték módosításnál hibás, új felvételnél ellenben azt jelenti, hogy nem adja meg
PROMPT -írja vissza az eredeti értéket, ha nem kívánja modosítani

ACCEPT cs_pontszam NUMBER PROMPT 'pontszám: '



DECLARE
	pontszám_tartomány_hiba EXCEPTION;
	
	PROCEDURE Ins(
					cs_vez IN Csoportok.csoportvezetõ%TYPE,
					cs_megnevezés IN Csoportok.csoport_név%TYPE
				)
	IS
	BEGIN
		INSERT INTO Csoportok 
			(csoport_név, csoportvezetõ)
		VALUES
			(
				'cs_megnevezés',
				'&cs_vez'
			)
		;
	END Ins;
	
	PROCEDURE UpdatePontszám(
					cs_megnevezés IN Csoportok.csoport_név%TYPE,
					cs_vez IN Csoportok.csoportvezetõ%TYPE,
					ujÉrték IN Csoportok.csoport_pontszám%TYPE
				)
	IS
	BEGIN
	
		if ujÉrték < 0 or ujÉrték > 9999.9
		then
			RAISE pontszám_tartomány_hiba;
		end if;
	
	
		UPDATE Csoportok SET csoport_pontszám=ujÉrték
		WHERE csoport_név='cs_megnevezés' AND csoportvezetõ='cs_vez';
	END UpdatePontszám;

	PROCEDURE UpdateVezetõ(
					cs_megnevezés IN Csoportok.csoport_név%TYPE,
					cs_vez IN Csoportok.csoportvezetõ%TYPE,
					ujÉrték IN Csoportok.csoportvezetõ%TYPE
				)
	IS
	BEGIN
		UPDATE Csoportok SET csoportvezetõ='ujÉrték'
		WHERE csoport_név='cs_megnevezés' AND csoportvezetõ='cs_vez';
	END UpdateVezetõ;
	
	PROCEDURE UpdateCsoportNév(
					cs_megnevezés IN Csoportok.csoport_név%TYPE,
					cs_vez IN Csoportok.csoportvezetõ%TYPE,
					ujÉrték IN Csoportok.csoport_név%TYPE
				)
	IS
	BEGIN
		UPDATE Csoportok SET csoport_név='ujÉrték'
		WHERE csoport_név='cs_megnevezés' AND csoportvezetõ='cs_vez';
	END UpdateCsoportNév;

	PROCEDURE Main(
					cs_megnevezés IN OUT Csoportok.csoport_név%TYPE,
					cs_vez IN OUT Csoportok.csoportvezetõ%TYPE,
					cs_pontszam IN Csoportok.csoport_pontszám%TYPE
				)
	IS
	BEGIN
			if LétezõCsoport(cs_vez,cs_megnevezés) then
				
				if cs_vez != cs_vez_új
				then
					UpdateVezetõ(cs_vez,cs_megnevezés,cs_vez_új);
					cs_vez := cs_vez_új;
				end if;
				
				if cs_megnevezés != cs_megnevezés_új
				then
					UpdateCsoportNév(cs_vez,cs_megnevezés,cs_megnevezés_új);
					cs_megnevezés := cs_megnevezés_új;
				end if;
				
				UpdatePontszám(cs_pontszam);
				
			else	
				Ins(cs_vez,cs_megnevezés);
				
				if &cs_pontszam >= 0
				then
					UpdatePontszám(cs_vez,cs_megnevezés,cs_pontszam);
				end if;
				
			end if;
	END Main;
	
	
	cs_megnevezés IN Csoportok.csoport_név%TYPE;
	cs_vez IN Csoportok.csoportvezetõ%TYPE;
	
	még CHAR;
	
BEGIN
	cs_megnevezés := &cs_megnevezés;
	cs_vez := &cs_vez;
	
	Main(cs_vez,cs_megnevezés,cs_pontszam);

END;
/


show errors


UNDEFINE cs_vez
UNDEFINE cs_vez_új
UNDEFINE cs_megnevezés
UNDEFINE cs_megnevezés_új
UNDEFINE cs_pontszam