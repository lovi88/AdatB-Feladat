DROP TABLE Lak�k;
CREATE TABLE Lak�k (
	N�v							VARCHAR2(30),
	Eg�szs�gbiztos�t�si_sz�m	VARCHAR2(9),
	Sz�let�siD�tum				DATE,
	Nem							CHAR(1) CHECK( Nem IN ('f','n') ),
	Szem�lyigazolv�ny_sz�m		VARCHAR2(11) UNIQUE,
	Tart�zkodas_t�l				DATE,
	Tart�zkodas_ig				DATE,
	Orsz�g						VARCHAR2(50),
	h�z_sz�m					NUMBER(4),
	Csoport_n�v					VARCHAR2(50),
	Csoportvezet�				VARCHAR2(30)
)

DROP TABLE Csoportok;
CREATE TABLE Csoportok(
	csoport_n�v			VARCHAR2(50),
	csoportvezet�		VARCHAR2(30),
	csoport_pontsz�m	INTEGER
)

DROP TABLE H�zak;
CREATE TABLE H�zak (
	h�z_sz�m		NUMBER(4),
	h�z_megnevez�s	VARCHAR2(25) NOT NULL,
	f�r�hely_sz�m	NUMBER(4)
)

ALTER TABLE Lak�k ADD CONSTANT p_Lak�k PRIMARY KEY (N�v,Eg�szs�gbiztos�t�si_sz�m);
ALTER TABLE Csoportok ADD CONSTANT p_Csoportok PRIMARY KEY (csoport_n�v,csoportvezet�);
ALTER TABLE H�zak ADD CONSTANT p_H�zak PRIMARY KEY (h�z_sz�m)

ALTER TABLE Lak�k ADD CONSTANT f_Lak�k_Csoportok FOREIGN KEY (Csoport_n�v,Csoportvezet�)
	REFERENCES Csoportok (Csoport_n�v,Csoportvezet�);
	
ALTER TABLE Lak�k ADD CONSTANT f_Lak�k_H�zak FOREIGN KEY (h�z_sz�m)
	REFERENCES H�zak (h�z_sz�m);
