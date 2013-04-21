DROP TABLE Lakók;
CREATE TABLE Lakók (
	Név							VARCHAR2(30),
	Egészségbiztosítási_szám	VARCHAR2(9),
	SzületésiDátum				DATE,
	Nem							CHAR(1) CHECK( Nem IN ('f','n') ),
	Személyigazolvány_szám		VARCHAR2(11) UNIQUE,
	Tartózkodas_tól				DATE,
	Tartózkodas_ig				DATE,
	Ország						VARCHAR2(50),
	ház_szám					NUMBER(4),
	Csoport_név					VARCHAR2(50),
	Csoportvezetõ				VARCHAR2(30)
)

DROP TABLE Csoportok;
CREATE TABLE Csoportok(
	csoport_név			VARCHAR2(50),
	csoportvezetõ		VARCHAR2(30),
	csoport_pontszám	INTEGER
)

DROP TABLE Házak;
CREATE TABLE Házak (
	ház_szám		NUMBER(4),
	ház_megnevezés	VARCHAR2(25) NOT NULL,
	férõhely_szám	NUMBER(4)
)

ALTER TABLE Lakók ADD CONSTANT p_Lakók PRIMARY KEY (Név,Egészségbiztosítási_szám);
ALTER TABLE Csoportok ADD CONSTANT p_Csoportok PRIMARY KEY (csoport_név,csoportvezetõ);
ALTER TABLE Házak ADD CONSTANT p_Házak PRIMARY KEY (ház_szám)

ALTER TABLE Lakók ADD CONSTANT f_Lakók_Csoportok FOREIGN KEY (Csoport_név,Csoportvezetõ)
	REFERENCES Csoportok (Csoport_név,Csoportvezetõ);
	
ALTER TABLE Lakók ADD CONSTANT f_Lakók_Házak FOREIGN KEY (ház_szám)
	REFERENCES Házak (ház_szám);
