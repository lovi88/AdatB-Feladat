SET verify OFF

PROMPT �j h�z felv�tele
ACCEPT h_sz�m NUMBER PROMPT 'Adja meg a h�zsz�mot: '
ACCEPT h_megnevez�s PROMPT 'Adja meg a h�z nev�t: '
ACCEPT h_f�r�hely NUMBER PROMPT 'Adja meg a f�r�helyek sz�m�t: '


INSERT INTO H�zak 
	(h�z_sz�m, h�z_megnevez�s, f�r�hely_sz�m)
VALUES
	(
		&h_sz�m,
		'&h_megnevez�s',
		&h_f�r�hely
	)
;