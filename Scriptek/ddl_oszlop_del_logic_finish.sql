--@ddl_oszlop_del_logic_finish
set linesize 50
PROMPT logikai t�rl�sek v�gleges�t�se

PROMPT Melyik t�bl�nak szeretn� m�dos�tani az oszlop�t:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla

ALTER TABLE &t�bla DROP UNUSED COLUMNS;