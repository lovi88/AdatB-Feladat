--@ddl_constraint_új
set linesize 50
PROMPT Megszorítás hozzáadása

PROMPT Melyik tábla megszorításait szeretné kezelni:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '

ACCEPT constraint_name PROMPT 'Adja meg a megszorítás nevét: '
ACCEPT constraint_body PROMPT 'Adja meg a megszorítás törzsét: '

ALTER TABLE &tábla
ADD CONSTRAINT &constraint_name &constraint_body;