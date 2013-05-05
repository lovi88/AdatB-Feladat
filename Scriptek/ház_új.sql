SET verify OFF

PROMPT Új ház felvétele
ACCEPT h_szám NUMBER PROMPT 'Adja meg a házszámot: '
ACCEPT h_megnevezés PROMPT 'Adja meg a ház nevét: '
ACCEPT h_férõhely NUMBER PROMPT 'Adja meg a férõhelyek számát: '


INSERT INTO Házak 
	(ház_szám, ház_megnevezés, férõhely_szám)
VALUES
	(
		&h_szám,
		'&h_megnevezés',
		&h_férõhely
	)
;