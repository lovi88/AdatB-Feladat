--@csoport_pl_del_sel

SET verify OFF
SET serveroutput ON

PROMPT Csoport t�rl�se, vagy ha nem tal�lhat�, a megtal�l�s�nak seg�t�se
PROMPT Adja meg a csoportot egy�rtelm�en meghat�roz� tulajdons�gokat:
ACCEPT cs_vez PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT cs_megnevez�s PROMPT 'Adja meg a csoport nev�t: '

DECLARE
	
	PROCEDURE DelCsop(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE
	)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('t�rl�s...');
		
		DELETE Csoportok
		WHERE csoport_n�v=cs_megnevez�s AND csoportvezet�=cs_vez;
		
		DBMS_OUTPUT.PUT_LINE('t�rl�s lezajlott');
		
	END DelCsop;
	
	PROCEDURE SelLikeCsop(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE
	)
	IS
		csVez Csoportok.csoportvezet�%TYPE;
		csNev Csoportok.csoport_n�v%TYPE;
	BEGIN
	DBMS_OUTPUT.PUT_LINE('Azon Csoportok, melyeknek a neve hasonl� a keresett kifejez�shez');
		csVez := UPPER(cs_vez);
		csNev := UPPER(cs_megnevez�s);
		
	
		for i in (
			select csoport_n�v, csoportvezet�, csoport_pontsz�m 
			from Csoportok 
			where UPPER(csoportvezet�) LIKE '%'|| csVez ||'%' and UPPER(csoport_n�v) LIKE '%'|| csNev ||'%'
		)
		loop
			DBMS_OUTPUT.new_line;
			DBMS_OUTPUT.PUT_LINE('Csoport neve');
			DBMS_OUTPUT.PUT_LINE(i.csoport_n�v);
			
			DBMS_OUTPUT.PUT_LINE('Csoportvezet� neve');
			DBMS_OUTPUT.PUT_LINE(i.csoportvezet�);
			
			DBMS_OUTPUT.PUT_LINE('Csoport pontsz�ma');
			DBMS_OUTPUT.PUT_LINE(i.csoport_pontsz�m);
			DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
		end loop;
		
	END SelLikeCsop;
	
	
BEGIN
	
	if L�tez�Csoport('a','s')
	then
		DBMS_OUTPUT.PUT_LINE('t�rl�s!');
	else
		DBMS_OUTPUT.PUT_LINE('select');
	end if;

	if L�tez�Csoport('&cs_vez','&cs_megnevez�s')
	then
		DelCsop('&cs_vez','&cs_megnevez�s');
	else
		SelLikeCsop('&cs_vez','&cs_megnevez�s');
	end if;
	
END;
/
