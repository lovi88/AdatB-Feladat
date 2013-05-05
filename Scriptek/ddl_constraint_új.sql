PROMPT Megszorítás hozzáadása

PROMPT Melyik tábla megszorításait szeretné kezelni:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '

ACCEPT constraint_name PROMPT 'Adja meg: '



--TODO: Típusfüggő létrehozás (primary,foreign,check)
--ALTER TABLE &tábla
--ADD CONSTRAINT 