SET verify OFF

PROMPT �j Lak� felv�tele
ACCEPT N�v PROMPT 'Adja meg a csoport nev�t: '
ACCEPT Eg�szs�gbiztos�t�si_sz�m PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Sz�let�siD�tum DATE PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Nem PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Szem�lyigazolv�ny_sz�m PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Tart�zkodas_t�l DATE PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Tart�zkodas_ig DATE PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '
ACCEPT Orsz�g PROMPT 'Adja meg csoport vezet�j�nek a nev�t: '


INSERT INTO Lak�k
	(
		N�v,
		Eg�szs�gbiztos�t�si_sz�m,
		Sz�let�siD�tum,
		Nem,
		Szem�lyigazolv�ny_sz�m,
		Tart�zkodas_t�l,
		Tart�zkodas_ig,
		Orsz�g
	)
VALUES
	(
		'&N�v',
		'&Eg�szs�gbiztos�t�si_sz�m',
		'&Sz�let�siD�tum',
		'&Nem',
		'Szem�lyigazolv�ny_sz�m',
		'&Tart�zkodas_t�l',
		'&Tart�zkodas_ig',
		'&Orsz�g'
	)
;