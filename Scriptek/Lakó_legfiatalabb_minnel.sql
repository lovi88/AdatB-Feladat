--@Lakó_legfiatalabb_minnel

select * from lakók
where SzületésiDátum = (select min(SzületésiDátum) from lakók);
