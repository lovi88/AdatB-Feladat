--@ddl_oszlop_ren
set linesize 50
PROMPT Oszlop �tnevez�s

PROMPT Melyik t�bl�nak szeretn� �tnevezni az oszlop�t:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla

desc &t�bla

ACCEPT o_neve PROMPT 'oszlop neve eddigi: '
ACCEPT o_�j_neve PROMPT 'oszlop neve �j: '

ALTER TABLE &t�bla RENAME COLUMN &o_neve TO &o_�j_neve;