PROMPT Tábla átnevezés 

PROMPT Melyik táblát szeretné átnevezni:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla eddigi neve: '
ACCEPT t_új_neve PROMPT 'tábla új neve: '

RENAME &tábla TO &t_új_neve;