--@ddl_constraint_t�r�l
set linesize 70
PROMPT Megszor�t�s t�rl�s

PROMPT Melyik t�bla megszor�t�sait szeretn� kezelni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla PROMPT 't�bla neve: '

PROMPT a kiv�lasztott t�bl�hoz tartoz� megszor�t�sok:

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = '&t�bla';

ACCEPT con PROMPT 'Adja meg a t�rlend�t: '

ALTER TABLE &t�bla
DROP CONSTRAINT &con;
