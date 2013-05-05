PROMPT oszlop törlése (logikai)

PROMPT Melyik táblának szeretné törölni az oszlopát:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla
ACCEPT o_neve PROMPT 'oszlop neve: '

ALTER TABLE &tábla SET UNUSED (&o_neve);
