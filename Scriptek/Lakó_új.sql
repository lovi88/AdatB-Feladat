SET verify OFF

PROMPT Új Lakó felvétele
ACCEPT Név PROMPT 'Adja meg a nevét: '
ACCEPT Egészségbiztosítási_szám PROMPT 'Adja meg Egészségbiztosítási számát: '
ACCEPT SzületésiDátum DATE PROMPT 'Adja meg a Születési Dátumát: '
ACCEPT Nem PROMPT 'Adja meg a nemét: '
ACCEPT Személyigazolvány_szám PROMPT 'Adja meg a Személyigazolvány számát: '
ACCEPT Tartózkodas_tól DATE PROMPT 'Adja meg a Tartózkodas kezdetét: '
ACCEPT Tartózkodas_ig DATE PROMPT 'Adja meg a Tartózkodas végét: '
ACCEPT Ország PROMPT 'Adja meg az országát: '


INSERT INTO Lakók
	(
		Név,
		Egészségbiztosítási_szám,
		SzületésiDátum,
		Nem,
		Személyigazolvány_szám,
		Tartózkodas_tól,
		Tartózkodas_ig,
		Ország
	)
VALUES
	(
		'&Név',
		'&Egészségbiztosítási_szám',
		'&SzületésiDátum',
		'&Nem',
		'&Személyigazolvány_szám',
		'&Tartózkodas_tól',
		'&Tartózkodas_ig',
		'&Ország'
	)
;

UNDEFINE Név
UNDEFINE Egészségbiztosítási_szám
UNDEFINE SzületésiDátum
UNDEFINE Nem
UNDEFINE Személyigazolvány_szám
UNDEFINE Tartózkodas_tól
UNDEFINE Tartózkodas_ig
UNDEFINE Ország