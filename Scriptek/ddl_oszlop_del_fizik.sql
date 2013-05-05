PROMPT oszlop törlése (fizikai)

PROMPT Melyik táblának szeretné módosítani az oszlopát:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla
ACCEPT o_neve PROMPT 'oszlop neve: '

ACCEPT cas PROMPT 'kulcsmegszorítások ellenére is megtörténjen a törlés (igen: CASCADE CONSTRAINTS nem: szünet jel) :'

ALTER TABLE &tábla DROP COLUMN &o_neve &cas;