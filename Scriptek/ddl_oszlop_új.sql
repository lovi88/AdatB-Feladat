PROMPT �j oszlop felv�tele

PROMPT Melyik t�bl�hoz szeretne �j oszlopot felvenni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla
ACCEPT o_neve PROMPT 'A l�trehozand� oszlop neve: '
ACCEPT o_tipus PROMPT 'A l�trehozand� oszlop t�pusa: '



ALTER TABLE &t�bla
	ADD (&o_neve &o_tipus);