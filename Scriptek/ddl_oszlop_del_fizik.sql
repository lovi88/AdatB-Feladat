--@ddl_oszlop_del_fizik
set linesize 50
PROMPT oszlop t�rl�se (fizikai)

PROMPT Melyik t�bl�nak szeretn� m�dos�tani az oszlop�t:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla

desc &t�bla

ACCEPT o_neve PROMPT 'oszlop neve: '

ACCEPT cas PROMPT 'kulcsmegszor�t�sok ellen�re is megt�rt�njen a t�rl�s (igen: CASCADE CONSTRAINTS nem: sz�net jel) :'

ALTER TABLE &t�bla DROP COLUMN &o_neve &cas;