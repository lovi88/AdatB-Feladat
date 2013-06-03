PROMPT Lakó módosítása
PROMPT Módosítani kívánt Lakó kijelölése
ACCEPT Név PROMPT 'Lakó neve: '
ACCEPT Egészségbiztosítási_szám PROMPT 'Lakó Egészségbiztosítási száma: '

PROMPT Melyik oszlopot kívánja módosítani
PROMPT (Név|Egészségbiztosítási_szám|SzületésiDátum|Nem|Személyigazolvány_szám)
PROMPT (Tartózkodas_tól|Tartózkodas_ig|Ország|ház_szám|Csoportvezetõ)
ACCEPT oszlop PROMPT 'módosítandó tulajdonság : '
ACCEPT érték PROMPT 'adja meg az értéket, amire átírja: '

UPDATE Lakók SET &oszlop='&érték'
WHERE Egészségbiztosítási_szám='&Egészségbiztosítási_szám' AND Név='&Név';

UNDEFINE Név
UNDEFINE Egészségbiztosítási_szám