PROMPT Lak� T�rl�se
PROMPT T�r�lni k�v�nt Lak� kijel�l�se
ACCEPT N�v PROMPT 'Lak� neve: '
ACCEPT Eg�szs�gbiztos�t�si_sz�m PROMPT 'Lak� Eg�szs�gbiztos�t�si sz�ma: '


DELETE FROM Lak�k
WHERE Eg�szs�gbiztos�t�si_sz�m=&Eg�szs�gbiztos�t�si_sz�m AND N�v=&N�v;