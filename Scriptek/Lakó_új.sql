SET verify OFF

PROMPT �j Lak� felv�tele
ACCEPT N�v PROMPT 'Adja meg a nev�t: '
ACCEPT Eg�szs�gbiztos�t�si_sz�m PROMPT 'Adja meg Eg�szs�gbiztos�t�si sz�m�t: '
ACCEPT Sz�let�siD�tum DATE PROMPT 'Adja meg a Sz�let�si D�tum�t: '
ACCEPT Nem PROMPT 'Adja meg a nem�t: '
ACCEPT Szem�lyigazolv�ny_sz�m PROMPT 'Adja meg a Szem�lyigazolv�ny sz�m�t: '
ACCEPT Tart�zkodas_t�l DATE PROMPT 'Adja meg a Tart�zkodas kezdet�t: '
ACCEPT Tart�zkodas_ig DATE PROMPT 'Adja meg a Tart�zkodas v�g�t: '
ACCEPT Orsz�g PROMPT 'Adja meg az orsz�g�t: '


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
		'&Szem�lyigazolv�ny_sz�m',
		'&Tart�zkodas_t�l',
		'&Tart�zkodas_ig',
		'&Orsz�g'
	)
;

UNDEFINE N�v
UNDEFINE Eg�szs�gbiztos�t�si_sz�m
UNDEFINE Sz�let�siD�tum
UNDEFINE Nem
UNDEFINE Szem�lyigazolv�ny_sz�m
UNDEFINE Tart�zkodas_t�l
UNDEFINE Tart�zkodas_ig
UNDEFINE Orsz�g