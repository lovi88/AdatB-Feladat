--@csoport_mód

PROMPT Csoport módosítása
PROMPT Módosítani kívánt csoport kijelölése
ACCEPT csoport_név PROMPT 'Csoport neve: '
ACCEPT csoportvezetõ PROMPT 'Csoport csoportvezetõje: '

ACCEPT oszlop PROMPT 'Melyik oszlopot kívánja módosítani (csoport_név|csoportvezetõ|csoport_pontszám):'
ACCEPT érték PROMPT 'adja meg az értéket, amire átírja: '


UPDATE Csoportok SET &oszlop='&érték'
WHERE csoport_név='&csoport_név' AND csoportvezetõ='&csoportvezetõ';

UNDEFINE csoport_név
UNDEFINE csoportvezetõ