--Lak�_Legnagyobb_h�zak

create or replace view LegnagyobbH�zak
as
select h�z_sz�m from H�zak
where f�r�hely_sz�m > 15;


select * from lak�k
where h�z_sz�m IN (select * from LegnagyobbH�zak);