PROMPT �j oszlop felv�tele

PROMPT T�bl�k:

SELECT table_name
FROM user_tables;

PROMPT Melyik t�bl�hoz szeretne �j oszlopot felvenni:
ACCEPT t�bla

PROMPT
desc &t�bla
PROMPT

ACCEPT o_neve PROMPT 'A l�trehozand� oszlop neve: '
ACCEPT o_tipus PROMPT 'A l�trehozand� oszlop t�pusa: '


ALTER TABLE &t�bla
	ADD (&o_neve &o_tipus);