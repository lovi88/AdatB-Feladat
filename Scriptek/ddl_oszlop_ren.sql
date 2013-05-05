PROMPT Oszlop átnevezés

PROMPT Melyik táblának szeretné átnevezni az oszlopát:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla
ACCEPT o_neve PROMPT 'oszlop neve eddigi: '
ACCEPT o_új_neve PROMPT 'oszlop neve eddigi: '

ALTER TABLE &tábla RENAME COLUMN &o_neve TO &o_új_neve;