--@csoport_pl_del_sel

SET verify OFF
SET serveroutput ON

PROMPT Csoport törlése, vagy ha nem található, a megtalálásának segítése
PROMPT Adja meg a csoportot egyértelmûen meghatározó tulajdonságokat:
ACCEPT cs_vez PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT cs_megnevezés PROMPT 'Adja meg a csoport nevét: '

DECLARE
	
	PROCEDURE DelCsop(
		cs_vez IN Csoportok.csoportvezetõ%TYPE,
		cs_megnevezés IN Csoportok.csoport_név%TYPE
	)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('törlés...');
		
		DELETE Csoportok
		WHERE csoport_név=cs_megnevezés AND csoportvezetõ=cs_vez;
		
		DBMS_OUTPUT.PUT_LINE('törlés lezajlott');
		
	END DelCsop;
	
	PROCEDURE SelLikeCsop(
		cs_vez IN Csoportok.csoportvezetõ%TYPE,
		cs_megnevezés IN Csoportok.csoport_név%TYPE
	)
	IS
		csVez Csoportok.csoportvezetõ%TYPE;
		csNev Csoportok.csoport_név%TYPE;
	BEGIN
	DBMS_OUTPUT.PUT_LINE('Azon Csoportok, melyeknek a neve hasonló a keresett kifejezéshez');
		csVez := UPPER(cs_vez);
		csNev := UPPER(cs_megnevezés);
		
	
		for i in (
			select csoport_név, csoportvezetõ, csoport_pontszám 
			from Csoportok 
			where UPPER(csoportvezetõ) LIKE '%'|| csVez ||'%' and UPPER(csoport_név) LIKE '%'|| csNev ||'%'
		)
		loop
			DBMS_OUTPUT.new_line;
			DBMS_OUTPUT.PUT_LINE('Csoport neve');
			DBMS_OUTPUT.PUT_LINE(i.csoport_név);
			
			DBMS_OUTPUT.PUT_LINE('Csoportvezetõ neve');
			DBMS_OUTPUT.PUT_LINE(i.csoportvezetõ);
			
			DBMS_OUTPUT.PUT_LINE('Csoport pontszáma');
			DBMS_OUTPUT.PUT_LINE(i.csoport_pontszám);
			DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
		end loop;
		
	END SelLikeCsop;
	
	
BEGIN
	
	if LétezõCsoport('a','s')
	then
		DBMS_OUTPUT.PUT_LINE('törlés!');
	else
		DBMS_OUTPUT.PUT_LINE('select');
	end if;

	if LétezõCsoport('&cs_vez','&cs_megnevezés')
	then
		DelCsop('&cs_vez','&cs_megnevezés');
	else
		SelLikeCsop('&cs_vez','&cs_megnevezés');
	end if;
	
END;
/
