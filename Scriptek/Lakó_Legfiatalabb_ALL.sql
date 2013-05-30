--@Lakó_Legfiatalabb_ALL

select * from Lakók
where SzületésiDátum >= ALL (Select SzületésiDátum From Lakók);