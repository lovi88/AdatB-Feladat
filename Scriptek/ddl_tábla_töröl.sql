--@ddl_tábla_töröl
set linesize 50
PROMPT Tábla törlése 

PROMPT Melyik táblát szeretné törölni:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '
ACCEPT cas PROMPT 'cascade opció: (CASCADE CONSTRAINTS | enter): '

DROP TABLE &tábla &cas;