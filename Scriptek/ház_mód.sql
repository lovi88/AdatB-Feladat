PROMPT Ház módosítása
ACCEPT ház_szám NUMBER PROMPT 'Melyik számú házat kívánja módosítani: '

ACCEPT oszlop PROMPT 'Melyik oszlopot kívánja módosítani (ház_szám|ház_megnevezés|férõhely_szám):'
ACCEPT érték PROMPT 'adja meg az értéket, amire átírja: '

UPDATE Házak SET &oszlop=&érték
WHERE ház_szám=&ház_szám;

UNDEFINE ház_szám
UNDEFINE oszlop
UNDEFINE érték