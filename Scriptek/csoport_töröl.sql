PROMPT Csoport T�rl�se
PROMPT T�r�lni k�v�nt csoport kijel�l�se
ACCEPT csoport_n�v PROMPT 'Csoport neve: '
ACCEPT csoportvezet� PROMPT 'Csoport csoportvezet�je: '

DELETE FROM Csoportok
WHERE csoport_n�v=&csoport_n�v AND csoportvezet�=&csoportvezet�;