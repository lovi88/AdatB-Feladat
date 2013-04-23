--fiúk/lányok lakók név szerint listázva

UNDEFINE n
ACCEPT n CHAR PROMPT 'A listázandóak neme: {n|f}'

SELECT * FROM Lakók
WHERE Nem=LOWER(&n)
ORDER BY Név;