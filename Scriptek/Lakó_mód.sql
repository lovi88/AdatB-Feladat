PROMPT Lak� m�dos�t�sa
PROMPT M�dos�tani k�v�nt Lak� kijel�l�se
ACCEPT N�v PROMPT 'Lak� neve: '
ACCEPT Eg�szs�gbiztos�t�si_sz�m PROMPT 'Lak� Eg�szs�gbiztos�t�si sz�ma: '

PROMPT Melyik oszlopot k�v�nja m�dos�tani
PROMPT (N�v|Eg�szs�gbiztos�t�si_sz�m|Sz�let�siD�tum|Nem|Szem�lyigazolv�ny_sz�m)
PROMPT (Tart�zkodas_t�l|Tart�zkodas_ig|Orsz�g|h�z_sz�m|Csoportvezet�)
ACCEPT oszlop PROMPT 'm�dos�tand� tulajdons�g : '
ACCEPT �rt�k PROMPT 'adja meg az �rt�ket, amire �t�rja: '

UPDATE Lak�k SET &oszlop='&�rt�k'
WHERE Eg�szs�gbiztos�t�si_sz�m='&Eg�szs�gbiztos�t�si_sz�m' AND N�v='&N�v';

UNDEFINE N�v
UNDEFINE Eg�szs�gbiztos�t�si_sz�m