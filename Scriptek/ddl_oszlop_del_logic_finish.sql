--@ddl_oszlop_del_logic_finish
set linesize 50
PROMPT logikai törlések véglegesítése

PROMPT Melyik táblának szeretné módosítani az oszlopát:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla

ALTER TABLE &tábla DROP UNUSED COLUMNS;