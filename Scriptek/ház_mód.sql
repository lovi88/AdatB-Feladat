PROMPT H�z m�dos�t�sa
ACCEPT h�z_sz�m NUMBER PROMPT 'Melyik sz�m� h�zat k�v�nja m�dos�tani: '

ACCEPT oszlop PROMPT 'Melyik oszlopot k�v�nja m�dos�tani (h�z_sz�m|h�z_megnevez�s|f�r�hely_sz�m):'
ACCEPT �rt�k PROMPT 'adja meg az �rt�ket, amire �t�rja: '

UPDATE H�zak SET &oszlop=&�rt�k
WHERE h�z_sz�m=&h�z_sz�m;

UNDEFINE h�z_sz�m
UNDEFINE oszlop
UNDEFINE �rt�k