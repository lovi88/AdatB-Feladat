CREATE OR REPLACE FUNCTION KorSz�m�t(sz�l_d�tum IN DATE)
	RETURN NUMBER
AS
BEGIN
	 RETURN TRUNC(MONTHS_BETWEEN(SYSDATE,sz�l_d�tum)/12);
END;
/
