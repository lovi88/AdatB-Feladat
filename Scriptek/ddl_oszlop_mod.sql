PROMPT oszlop m�dos�t�s

PROMPT Melyik t�bl�nak szeretn� m�dos�tani az oszlop�t:
PROMPT Lehet�s�gek:

SELECT table_name
FROM user_tables;

ACCEPT t�bla

PROMPT
desc &t�bla
PROMPT

ACCEPT o_neve PROMPT 'oszlop neve: '
ACCEPT o_tipus PROMPT 'oszlop t�pusa: '



ALTER TABLE &t�bla
	MODIFY (&o_neve &o_tipus);