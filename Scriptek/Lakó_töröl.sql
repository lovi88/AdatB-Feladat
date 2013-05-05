PROMPT Lakó Törlése
PROMPT Törölni kívánt Lakó kijelölése
ACCEPT Név PROMPT 'Lakó neve: '
ACCEPT Egészségbiztosítási_szám PROMPT 'Lakó Egészségbiztosítási száma: '


DELETE FROM Lakók
WHERE Egészségbiztosítási_szám=&Egészségbiztosítási_szám AND Név=&Név;