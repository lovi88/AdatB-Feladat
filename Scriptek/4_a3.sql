--Azok akiknek a nevében szerepel egy kifejezés

SET TERMOUT OFF
UNDEFINE sz
SET TERMOUT ON

PROMPT 'Egy adott szót tartalmazó nevűek listája:'
ACCEPT sz PROMPT 'szó:'

SELECT * FROM Lakók
WHERE Név LIKE '%'||&sz||'%'
ORDER BY Név;

SET TERMOUT OFF
UNDEFINE sz
SET TERMOUT ON
