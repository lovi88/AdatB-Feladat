--@Lakó_legidősebb_maxxal

select * from lakók
where SzületésiDátum = (select max(SzületésiDátum) from lakók);