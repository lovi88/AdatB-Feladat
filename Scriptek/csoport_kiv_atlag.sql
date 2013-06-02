--@csoport_kiv_atlag
SET verify OFF
SET LINESIZE 70
SET PAGESIZE 10

BTITLE 'Készült: a Táborhely Üzemeltetõi segédszoftver segíségével.'


ACCEPT csoportvezetõ PROMPT 'csoportvezetõ: '


TTITLE CENTER '&csoportvezetõ Csoportjainak pontszám-átlaga' SKIP 1 -
CENTER ============================================================ SKIP 3


select avg(csoport_pontszám) as átlag from Csoportok
where csoport_pontszám > 0
group by csoportvezetõ
having UPPER(csoportvezetõ) = UPPER('&csoportvezetõ');


TTITLE OFF
BTITLE OFF
CLEAR COLUMNS

UNDEFINE csoportvezetõ