--@csoport_m�d

PROMPT Csoport m�dos�t�sa
PROMPT M�dos�tani k�v�nt csoport kijel�l�se
ACCEPT csoport_n�v PROMPT 'Csoport neve: '
ACCEPT csoportvezet� PROMPT 'Csoport csoportvezet�je: '

ACCEPT oszlop PROMPT 'Melyik oszlopot k�v�nja m�dos�tani (csoport_n�v|csoportvezet�|csoport_pontsz�m):'
ACCEPT �rt�k PROMPT 'adja meg az �rt�ket, amire �t�rja: '


UPDATE Csoportok SET &oszlop='&�rt�k'
WHERE csoport_n�v='&csoport_n�v' AND csoportvezet�='&csoportvezet�';

UNDEFINE csoport_n�v
UNDEFINE csoportvezet�