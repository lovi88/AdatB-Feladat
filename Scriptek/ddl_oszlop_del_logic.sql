--@ddl_oszlop_del_logic
set linesize 50
PROMPT oszlop törlése (logikai)

PROMPT Melyik táblának szeretné törölni az oszlopát:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla

desc &tábla

ACCEPT o_neve PROMPT 'oszlop neve: '

ALTER TABLE &tábla SET UNUSED (&o_neve);
