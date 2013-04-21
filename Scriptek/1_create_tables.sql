DROP TABLE Lak�k;
CREATE TABLE Lak�k (
	N�v							VARCHAR2,
	Eg�szs�gbiztos�t�si_sz�m	VARCHAR2(9),
	Sz�let�siD�tum				DATE,
	Nem							CHAR(1) CHECK( Nem IN ('f','n') ),
	Szem�lyigazolv�ny_sz�m		VARCHAR2(11),
	Tart�zkodas_t�l				DATE,
	Tart�zkodas_ig				DATE,
	Orsz�g						VARCHAR2(50),
	h�z_sz�m					NUMBER(4),
	Csoport_n�v					VARCHAR2(50),
	Csoportvezet�				
)

ALTER TABLE Lak�k 

DROP TABLE Csoportok;
CREATE TABLE Csoportok(
	csoport_n�v			VARCHAR2(50),
	csoportvezet�		,
	csoport_pontsz�m	INTEGER
)

DROP TABLE H�zak;
CREATE TABLE H�zak (
	h�z_sz�m		NUMBER(4),
	h�z_megnevez�s	VARCHAR2(50),
	f�r�hely_sz�m	NUMBER(4)
)