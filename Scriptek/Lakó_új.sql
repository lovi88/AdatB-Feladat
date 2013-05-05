SET verify OFF

PROMPT Új Lakó felvétele
ACCEPT Név PROMPT 'Adja meg a csoport nevét: '
ACCEPT Egészségbiztosítási_szám PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT SzületésiDátum DATE PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT Nem PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT Személyigazolvány_szám PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT Tartózkodas_tól DATE PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT Tartózkodas_ig DATE PROMPT 'Adja meg csoport vezetõjének a nevét: '
ACCEPT Ország PROMPT 'Adja meg csoport vezetõjének a nevét: '


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
		'Személyigazolvány_szám',
		'&Tartózkodas_tól',
		'&Tartózkodas_ig',
		'&Ország'
	)
;