--@csoport_kiv_atlag
SET verify OFF
SET LINESIZE 70
SET PAGESIZE 10

BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'


ACCEPT csoportvezet� PROMPT 'csoportvezet�: '


TTITLE CENTER '&csoportvezet� Csoportjainak pontsz�m-�tlaga' SKIP 1 -
CENTER ============================================================ SKIP 3


select avg(csoport_pontsz�m) as �tlag from Csoportok
where csoport_pontsz�m > 0
group by csoportvezet�
having UPPER(csoportvezet�) = UPPER('&csoportvezet�');


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS

UNDEFINE csoportvezet�