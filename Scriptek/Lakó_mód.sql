PROMPT Lakó módosítása
PROMPT Módosítani kívánt Lakó kijelölése
ACCEPT Név PROMPT 'Lakó neve: '
ACCEPT Egészségbiztosítási_szám PROMPT 'Lakó Egészségbiztosítási száma: '

PROMPT Melyik oszlopot kívánja módosítani 
ACCEPT oszlop PROMPT '(Név|Egészségbiztosítási_szám|SzületésiDátum|Nem|Személyigazolvány_szám|Tartózkodas_tól|Tartózkodas_ig|Ország|ház_szám|Csoportvezetõ) :'
ACCEPT érték PROMPT 'adja meg az értéket, amire átírja: '

UPDATE Lakók SET &oszlop=&érték
WHERE Egészségbiztosítási_szám=&Egészségbiztosítási_szám AND Név=&Név;