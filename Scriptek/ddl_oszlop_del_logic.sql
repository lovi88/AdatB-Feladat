--@ddl_oszlop_del_logic
set linesize 50
PROMPT oszlop t�rl�se (logikai)

PROMPT Melyik t�bl�nak szeretn� t�r�lni az oszlop�t:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla

desc &t�bla

ACCEPT o_neve PROMPT 'oszlop neve: '

ALTER TABLE &t�bla SET UNUSED (&o_neve);
