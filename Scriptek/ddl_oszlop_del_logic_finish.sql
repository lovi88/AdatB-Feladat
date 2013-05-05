PROMPT logikai törlések véglegesítése

PROMPT Melyik táblának szeretné módosítani az oszlopát:
PROMPT Lehetőségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla

ALTER TABLE &tábla DROP UNUSED COLUMNS;