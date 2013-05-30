--Lakó_Legnagyobb_házak

create or replace view LegnagyobbHázak
as
select ház_szám from Házak
where férõhely_szám > 15;


select * from lakók
where ház_szám IN (select * from LegnagyobbHázak);