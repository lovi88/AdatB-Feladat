--@Lakó_legidősebb_ANY

select * from lakók
where NOT(SzületésiDátum < ANY (Select SzületésiDátum From Lakók));