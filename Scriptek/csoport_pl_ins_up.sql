--@csoport_pl_ins_up

SET verify OFF
SET serveroutput ON

PROMPT �j Csoport felv�tele, vagy ha l�tezik, m�dos�t�sa
PROMPT Adja meg a csoportot egy�rtelm�en meghat�roz� tulajdons�gokat:
ACCEPT cs_vez PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT cs_vez_�j PROMPT 'Adja meg csoport vezet�j�nek a nev�t (ez lesz az �j vezet�, ha elt�r): '
ACCEPT cs_megnevez�s PROMPT 'Adja meg a csoport nev�t: '
ACCEPT cs_megnevez�s_�j PROMPT 'Adja meg a csoport nev�t (ez lesz az �j n�v, ha elt�r): '

SELECT * FROM Csoportok
WHERE csoport_n�v='&cs_megnevez�s' AND csoportvezet�='&cs_vez';

PROMPT Adja meg a csoport pontsz�m�t
PROMPT -negat�v �rt�k m�dos�t�sn�l hib�s, �j felv�teln�l ellenben azt jelenti, hogy nem adja meg
PROMPT -�rja vissza az eredeti �rt�ket, ha nem k�v�nja modos�tani

ACCEPT cs_pontszam NUMBER PROMPT 'pontsz�m: '



DECLARE
	pontsz�m_tartom�ny_hiba EXCEPTION;
	
	cs_vez Csoportok.csoportvezet�%TYPE;
	cs_megnevez�s Csoportok.csoport_n�v%TYPE;
	
	
	PROCEDURE Ins(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE
	)
	IS
	BEGIN
		INSERT INTO Csoportok 
			(csoport_n�v, csoportvezet�)
		VALUES
			(
				cs_megnevez�s,
				cs_vez
			)
		;
	END Ins;
	
	PROCEDURE UpdatePontsz�m(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
		uj�rt�k IN Csoportok.csoport_pontsz�m%TYPE
	)
	IS
	BEGIN
	
		if uj�rt�k < 0 or uj�rt�k > 9999.9
		then
			RAISE pontsz�m_tartom�ny_hiba;
		end if;
	
	
		UPDATE Csoportok SET csoport_pontsz�m=uj�rt�k
		WHERE csoport_n�v=cs_megnevez�s AND csoportvezet�=cs_vez;
	END UpdatePontsz�m;

	PROCEDURE UpdateVezet�(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
		uj�rt�k IN Csoportok.csoportvezet�%TYPE
	)
	IS
	BEGIN
		UPDATE Csoportok SET csoportvezet�=uj�rt�k
		WHERE csoport_n�v=cs_megnevez�s AND csoportvezet�=cs_vez;
	END UpdateVezet�;
	
	PROCEDURE UpdateCsoportN�v(
		cs_vez IN Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
		uj�rt�k IN Csoportok.csoport_n�v%TYPE)
	IS
	BEGIN
		UPDATE Csoportok SET csoport_n�v=uj�rt�k
		WHERE csoport_n�v=cs_megnevez�s AND csoportvezet�=cs_vez;
	END UpdateCsoportN�v;

	
	
	PROCEDURE Main(
		cs_vez				IN OUT	Csoportok.csoportvezet�%TYPE,
		cs_vez_�j			IN		Csoportok.csoportvezet�%TYPE,
		cs_megnevez�s		IN OUT	Csoportok.csoport_n�v%TYPE,
		cs_megnevez�s_�j	IN		Csoportok.csoport_n�v%TYPE,
		cs_pontszam			IN		Csoportok.csoport_pontsz�m%TYPE
	)
	IS
		pontszam Csoportok.csoport_pontsz�m%TYPE;
	BEGIN
		if L�tez�Csoport(cs_vez,cs_megnevez�s) 
		then
			DBMS_OUTPUT.PUT_LINE('L�tez� csoport szerkeszt�se...');
			
			if cs_vez != cs_vez_�j
			then
				DBMS_OUTPUT.PUT_LINE('vezet� �t�r�sa...');
				UpdateVezet�(cs_vez,cs_megnevez�s,cs_vez_�j);
				cs_vez := cs_vez_�j;
				DBMS_OUTPUT.PUT_LINE('vezet� �t�r�sa megt�rt�nt');
			end if;
			
			if cs_megnevez�s != cs_megnevez�s_�j
			then
				DBMS_OUTPUT.PUT_LINE('csoportn�v �t�r�sa...');
				UpdateCsoportN�v(cs_vez,cs_megnevez�s,cs_megnevez�s_�j);
				cs_megnevez�s := cs_megnevez�s_�j;
				DBMS_OUTPUT.PUT_LINE('csoportn�v �t�r�sa megt�rt�nt');
			end if;
			
			
			SELECT csoport_pontsz�m
			INTO pontszam
			FROM Csoportok
			WHERE csoport_n�v=cs_megnevez�s AND csoportvezet�=cs_vez;
			
			if pontszam != cs_pontszam
			then
				DBMS_OUTPUT.PUT_LINE('pontsz�m �t�r�sa...');
				UpdatePontsz�m(cs_vez,cs_megnevez�s,cs_pontszam);
				DBMS_OUTPUT.PUT_LINE('pontsz�m �t�r�sa megt�rt�nt');
			end if;

		else	
			DBMS_OUTPUT.PUT_LINE('�j sor l�trej�tt...');
			Ins(cs_vez,cs_megnevez�s);
			
			
			if cs_pontszam >= 0
			then
				UpdatePontsz�m(cs_vez,cs_megnevez�s,cs_pontszam);
				DBMS_OUTPUT.PUT_LINE('pontsz�m �t�r�sa...');
			end if;
			
		end if;
		
		
	END Main;
	
	
	
BEGIN
	cs_megnevez�s := '&cs_megnevez�s';
	cs_vez := '&cs_vez';
	
	Main(cs_vez,'&cs_vez_�j',cs_megnevez�s,'&cs_megnevez�s_�j',&cs_pontszam);

	EXCEPTION
	WHEN pontsz�m_tartom�ny_hiba
		THEN DBMS_OUTPUT.PUT_LINE('a pontsz�mnak 0 �s 9999.9 k�z� kell esnie');
	WHEN NO_DATA_FOUND 
		THEN DBMS_OUTPUT.PUT_LINE('csoport nem tal�lhat�, helytelen �llapot, a pontsz�m lek�rdez�sekor...');
	
END;
/


show errors


UNDEFINE cs_vez
UNDEFINE cs_vez_�j
UNDEFINE cs_megnevez�s
UNDEFINE cs_megnevez�s_�j
UNDEFINE cs_pontszam