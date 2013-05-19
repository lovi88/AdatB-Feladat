PROMPT Új oszlop felvétele

PROMPT Táblák:

SELECT table_name
FROM user_tables;

PROMPT Melyik táblához szeretne új oszlopot felvenni:
ACCEPT tábla

PROMPT
desc &tábla
PROMPT

ACCEPT o_neve PROMPT 'A létrehozandó oszlop neve: '
ACCEPT o_tipus PROMPT 'A létrehozandó oszlop típusa: '


ALTER TABLE &tábla
	ADD (&o_neve &o_tipus);