PROMPT H�z T�rl�se
ACCEPT h�z_sz�m NUMBER PROMPT 'Melyik sz�m� h�zat k�v�nja t�r�lni: '

DELETE FROM H�zak
WHERE h�z_sz�m=&h�z_sz�m;

UNDEFINE h�z_sz�m