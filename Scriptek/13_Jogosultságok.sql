CONNECT sys/rendszergazda AS SYSDBA
cl scr
--szerepkörök CampAdmin; CampBoss
--alkalmazottak: Admin1; Admin2 - Boss1; Boss2
--13_Jogosultságok

DROP USER Admin1 CASCADE;
DROP USER Admin2 CASCADE;
DROP USER Boss1 CASCADE;
DROP USER Boss2 CASCADE;

DROP ROLE CampAdmin;
DROP ROLE CampBoss;



CREATE ROLE CampAdmin;
GRANT
	CREATE SESSION,
	CREATE TABLE
  TO
	CampAdmin;

CREATE ROLE CampBoss;
GRANT
	CREATE SESSION,
	SELECT ANY TABLE
  TO
	CampBoss;
	
CREATE USER Admin1
	IDENTIFIED BY passAdmin01;

PROMPT admin1 gran_t
GRANT CampAdmin
	TO Admin1;


CREATE USER Admin2
	IDENTIFIED BY passAdmin02;
GRANT CampAdmin
	TO Admin2;


CREATE USER Boss1
	IDENTIFIED BY passBoss01;
GRANT CampBoss
	TO Boss1;

	
CREATE USER Boss2
	IDENTIFIED BY passBoss02;
GRANT CampBoss
	TO Boss2;