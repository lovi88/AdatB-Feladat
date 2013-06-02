PROMPT Ház Törlése
ACCEPT ház_szám NUMBER PROMPT 'Melyik számú házat kívánja törölni: '

DELETE FROM Házak
WHERE ház_szám=&ház_szám;

UNDEFINE ház_szám