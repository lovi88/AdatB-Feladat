--@ddl_oszlop_ren
set linesize 50
PROMPT Oszlop átnevezés

PROMPT Melyik táblának szeretné átnevezni az oszlopát:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla

desc &tábla

ACCEPT o_neve PROMPT 'oszlop neve eddigi: '
ACCEPT o_új_neve PROMPT 'oszlop neve új: '

ALTER TABLE &tábla RENAME COLUMN &o_neve TO &o_új_neve;