PROMPT Megszorítás törlés

PROMPT Melyik tábla megszorításait szeretné kezelni:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '

PROMPT a kiválasztott táblához tartozó megszorítások:

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = '&tábla'

ACCEPT con PROMPT 'Adja meg a törlendőt: '

ALTER TABLE &tábla
DROP CONSTRAINT &con;
