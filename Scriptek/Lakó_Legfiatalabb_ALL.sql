--@Lak�_Legfiatalabb_ALL

select * from Lak�k
where Sz�let�siD�tum >= ALL (Select Sz�let�siD�tum From Lak�k);