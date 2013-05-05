PROMPT Megszorítás megváltoztatása

PROMPT Melyik tábla megszorításait szeretné kezelni:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla PROMPT 'tábla neve: '

PROMPT a kiválasztott táblához tartozó megszorítások:

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = '&tábla'

ACCEPT constraint_name PROMPT 'Adja meg a módosítandót: '

ACCEPT modositas PROMPT 'Módosítás típusa (ENABLE | DISABLE)'


ALTER TABLE
   &tábla
&modositas CONSTRAINT
   constraint_name;
