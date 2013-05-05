PROMPT Csoport Törlése
PROMPT Törölni kívánt csoport kijelölése
ACCEPT csoport_név PROMPT 'Csoport neve: '
ACCEPT csoportvezetõ PROMPT 'Csoport csoportvezetõje: '

DELETE FROM Csoportok
WHERE csoport_név=&csoport_név AND csoportvezetõ=&csoportvezetõ;