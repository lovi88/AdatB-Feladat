--@ddl_t�bla_�tnevez
set linesize 50
PROMPT T�bla �tnevez�s 

PROMPT Melyik t�bl�t szeretn� �tnevezni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla PROMPT 't�bla eddigi neve: '
ACCEPT t_�j_neve PROMPT 't�bla �j neve: '

RENAME &t�bla TO &t_�j_neve;