PROMPT Új oszlop felvétele

PROMPT Melyik táblához szeretne új oszlopot felvenni:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla
ACCEPT o_neve PROMPT 'A létrehozandó oszlop neve: '
ACCEPT o_tipus PROMPT 'A létrehozandó oszlop típusa: '



ALTER TABLE &tábla
	ADD (&o_neve &o_tipus);