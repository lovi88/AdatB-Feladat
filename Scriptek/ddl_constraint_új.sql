--@ddl_constraint_�j
set linesize 50
PROMPT Megszor�t�s hozz�ad�sa

PROMPT Melyik t�bla megszor�t�sait szeretn� kezelni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla PROMPT 't�bla neve: '

ACCEPT constraint_name PROMPT 'Adja meg a megszor�t�s nev�t: '
ACCEPT constraint_body PROMPT 'Adja meg a megszor�t�s t�rzs�t: '

ALTER TABLE &t�bla
ADD CONSTRAINT &constraint_name &constraint_body;