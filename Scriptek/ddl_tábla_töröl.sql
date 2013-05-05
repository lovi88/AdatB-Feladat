PROMPT Tábla törlése 

PROMPT Melyik táblát szeretné törölni:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '


DROP &tábla;