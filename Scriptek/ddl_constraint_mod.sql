--@ddl_constraint_mod
set linesize 50
PROMPT Megszor�t�s megv�ltoztat�sa

PROMPT Melyik t�bla megszor�t�sait szeretn� kezelni:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla PROMPT 't�bla neve: '

PROMPT a kiv�lasztott t�bl�hoz tartoz� megszor�t�sok:

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = '&t�bla'

ACCEPT constraint_name PROMPT 'Adja meg a m�dos�tand�t: '
ACCEPT modositas PROMPT 'M�dos�t�s t�pusa (ENABLE | DISABLE): '

ALTER TABLE
   &t�bla
&modositas CONSTRAINT
   &constraint_name;
