DROP TABLE Lakók;
CREATE TABLE Lakók (
	Név							VARCHAR2(30),
	Egészségbiztosítási_szám	CHAR(9) UNIQUE,
	SzületésiDátum				DATE,
	Nem							CHAR(1) CHECK( Nem IN ('f','n') ),
	Személyigazolvány_szám		CHAR(11) UNIQUE,
	Tartózkodas_tól				DATE,
	Tartózkodas_ig				DATE,
	Ország						VARCHAR2(50),
	ház_szám					NUMBER(4),
	Csoport_név					VARCHAR2(50),
	Csoportvezetõ				VARCHAR2(30)
);


DROP TABLE Csoportok;
CREATE TABLE Csoportok(
	csoport_név			VARCHAR2(50),
	csoportvezetõ		VARCHAR2(30),
	csoport_pontszám	NUMBER(5,1)
);

DROP TABLE Házak;
CREATE TABLE Házak (
	ház_szám		NUMBER(3),
	ház_megnevezés	VARCHAR2(25) NOT NULL,
	férõhely_szám	NUMBER(3)
);


ALTER TABLE Lakók ADD CONSTRAINTS p_Lakók PRIMARY KEY (Név,Egészségbiztosítási_szám);
ALTER TABLE Csoportok ADD CONSTRAINTS p_Csoportok PRIMARY KEY (csoport_név,csoportvezetõ);
ALTER TABLE Házak ADD CONSTRAINTS p_Házak PRIMARY KEY (ház_szám);

ALTER TABLE Lakók ADD CONSTRAINTS f_Lakók_Csoportok FOREIGN KEY (Csoport_név,Csoportvezetõ)
	REFERENCES Csoportok (csoport_név,csoportvezetõ);
	
ALTER TABLE Lakók ADD CONSTRAINTS f_Lakók_Házak FOREIGN KEY (ház_szám)
	REFERENCES Házak (ház_szám);
