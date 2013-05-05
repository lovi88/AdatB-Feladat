SET verify OFF

PROMPT Új Csoport felvétele
ACCEPT cs_megnevezés PROMPT 'Adja meg a csoport nevét: '
ACCEPT cs_vez PROMPT 'Adja meg csoport vezetõjének a nevét: '


INSERT INTO Csoportok 
	(csoport_név, csoportvezetõ)
VALUES
	(
		'&cs_megnevezés',
		'&cs_vez'
	)
;