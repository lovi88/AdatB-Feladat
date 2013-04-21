DROP TABLE Lakók;
CREATE TABLE Lakók (
	Név							VARCHAR2,
	Egészségbiztosítási_szám	VARCHAR2(9),
	SzületésiDátum				DATE,
	Nem							CHAR(1) CHECK( Nem IN ('f','n') ),
	Személyigazolvány_szám		VARCHAR2(11),
	Tartózkodas_tól				DATE,
	Tartózkodas_ig				DATE,
	Ország						VARCHAR2(50),
	ház_szám					NUMBER(4),
	Csoport_név					VARCHAR2(50),
	Csoportvezetõ				
)

ALTER TABLE Lakók 

DROP TABLE Csoportok;
CREATE TABLE Csoportok(
	csoport_név			VARCHAR2(50),
	csoportvezetõ		,
	csoport_pontszám	INTEGER
)

DROP TABLE Házak;
CREATE TABLE Házak (
	ház_szám		NUMBER(4),
	ház_megnevezés	VARCHAR2(50),
	férõhely_szám	NUMBER(4)
)