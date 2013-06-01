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
				'cs_megnevez�s',
				'&cs_vez'
			)
		;
	END Ins;
	
	PROCEDURE UpdatePontsz�m(
					cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
					cs_vez IN Csoportok.csoportvezet�%TYPE,
					uj�rt�k IN Csoportok.csoport_pontsz�m%TYPE
				)
	IS
	BEGIN
	
		if uj�rt�k < 0 or uj�rt�k > 9999.9
		then
			RAISE pontsz�m_tartom�ny_hiba;
		end if;
	
	
		UPDATE Csoportok SET csoport_pontsz�m=uj�rt�k
		WHERE csoport_n�v='cs_megnevez�s' AND csoportvezet�='cs_vez';
	END UpdatePontsz�m;

	PROCEDURE UpdateVezet�(
					cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
					cs_vez IN Csoportok.csoportvezet�%TYPE,
					uj�rt�k IN Csoportok.csoportvezet�%TYPE
				)
	IS
	BEGIN
		UPDATE Csoportok SET csoportvezet�='uj�rt�k'
		WHERE csoport_n�v='cs_megnevez�s' AND csoportvezet�='cs_vez';
	END UpdateVezet�;
	
	PROCEDURE UpdateCsoportN�v(
					cs_megnevez�s IN Csoportok.csoport_n�v%TYPE,
					cs_vez IN Csoportok.csoportvezet�%TYPE,
					uj�rt�k IN Csoportok.csoport_n�v%TYPE
				)
	IS
	BEGIN
		UPDATE Csoportok SET csoport_n�v='uj�rt�k'
		WHERE csoport_n�v='cs_megnevez�s' AND csoportvezet�='cs_vez';
	END UpdateCsoportN�v;

	PROCEDURE Main(
					cs_megnevez�s IN OUT Csoportok.csoport_n�v%TYPE,
					cs_vez IN OUT Csoportok.csoportvezet�%TYPE,
					cs_pontszam IN Csoportok.csoport_pontsz�m%TYPE
				)
	IS
	BEGIN
			if L�tez�Csoport(cs_vez,cs_megnevez�s) then
				
				if cs_vez != cs_vez_�j
				then
					UpdateVezet�(cs_vez,cs_megnevez�s,cs_vez_�j);
					cs_vez := cs_vez_�j;
				end if;
				
				if cs_megnevez�s != cs_megnevez�s_�j
				then
					UpdateCsoportN�v(cs_vez,cs_megnevez�s,cs_megnevez�s_�j);
					cs_megnevez�s := cs_megnevez�s_�j;
				end if;
				
				UpdatePontsz�m(cs_pontszam);
				
			else	
				Ins(cs_vez,cs_megnevez�s);
				
				if &cs_pontszam >= 0
				then
					UpdatePontsz�m(cs_vez,cs_megnevez�s,cs_pontszam);
				end if;
				
			end if;
	END Main;
	
	
	cs_megnevez�s IN Csoportok.csoport_n�v%TYPE;
	cs_vez IN Csoportok.csoportvezet�%TYPE;
	
	m�g CHAR;
	
BEGIN
	cs_megnevez�s := &cs_megnevez�s;
	cs_vez := &cs_vez;
	
	Main(cs_vez,cs_megnevez�s,cs_pontszam);

END;
/


show errors


UNDEFINE cs_vez
UNDEFINE cs_vez_�j
UNDEFINE cs_megnevez�s
UNDEFINE cs_megnevez�s_�j
UNDEFINE cs_pontszam