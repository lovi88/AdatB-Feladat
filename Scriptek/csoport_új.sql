SET verify OFF

PROMPT �j Csoport felv�tele
ACCEPT cs_megnevez�s PROMPT 'Adja meg a csoport nev�t: '
ACCEPT cs_vez PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '


INSERT INTO Csoportok 
	(csoport_n�v, csoportvezet�)
VALUES
	(
		'&cs_megnevez�s',
		'&cs_vez'
	)
;