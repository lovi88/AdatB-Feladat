PROMPT oszlop múdosítás

PROMPT Melyik táblának szeretné módosítani az oszlopát:
PROMPT Lehetõségek:

SELECT table_name
FROM user_tables;

ACCEPT tábla

PROMPT
desc &tábla
PROMPT

ACCEPT o_neve PROMPT 'oszlop neve: '
ACCEPT o_tipus PROMPT 'oszlop típusa: '



ALTER TABLE &tábla
	MODIFY (&o_neve &o_tipus);