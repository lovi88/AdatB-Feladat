--@ddl_t�bla_t�r�l
set linesize 50
PROMPT T�bla t�rl�se 

PROMPT Melyik t�bl�t szeretn� t�r�lni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla PROMPT 't�bla neve: '
ACCEPT cas PROMPT 'cascade opci�: (CASCADE CONSTRAINTS | enter): '

DROP TABLE &t�bla &cas;