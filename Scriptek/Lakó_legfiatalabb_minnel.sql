--@Lak�_legfiatalabb_minnel

select * from lak�k
where Sz�let�siD�tum = (select min(Sz�let�siD�tum) from lak�k);
