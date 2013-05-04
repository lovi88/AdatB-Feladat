
INSERT INTO Lakók
	(
		Név,
		Egészségbiztosítási_szám,
		SzületésiDátum,
		Nem,
		Személyigazolvány_szám,
		Tartózkodas_tól,
		Tartózkodas_ig,
		Ország,
		ház_szám,
		Csoport_név,
		Csoportvezető
	)
VALUES
	(
		'<NAME length='30' type='full' sex='both' />',
		'<NUMBER digits='9' />',
		'<DATE from='1988-03-20'  to='2005-03-30' format='yyyy-MM-dd' />',
		'<ENUM in='f,n' />',
		'<NUMBER digits='6' /><ENUM in='BA,CA,DA,FA,GA,HA,JA,KA,LA' />',
		'<DATE from='1988-03-20' to='NOW' format='yyyy-MM-dd' />',
		'<DATE from='1988-03-20' to='2015-03-30' format='yyyy-MM-dd' />',
		'<COUNTRY length='50' />',
		<ENUM in='1,2,3,4,5,6,7,8,9,10' />,
		'<ENUM in='Medvék,Cimborák,Gumikacsa,Haverok,Manók,Krumplipucolók,Madarak,BlaBla,Cimborák,Oracle' />',
		''
	)
;



INSERT INTO Csoportok 
	(csoport_név, csoportvezető, csoport_pontszám)
VALUES
	(
		'',
		'<NAME length='30' type='full' sex='both' />',
		<NUMBER digits='6' />.<NUMBER digits='1' />
	)
;