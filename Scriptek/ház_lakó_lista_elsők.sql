--@h�z_lak�_lista_els�kSET LINESIZE 70SET PAGESIZE 70BTITLE 'K�sz�lt: a T�borhely �zemeltet�i seg�dszoftver seg�s�g�vel.'TTITLE CENTER 'Els� 3 H�z lak� list�ja' SKIP 1 -CENTER ============================================================ SKIP 3COLUMN Eg�szs�gbiztos�t�si_sz�m FORMAT A11 HEADING 'Eg�szs�g-|biztos�t�si|sz�m' JUSTIFY CENTERBREAK ON h�zsz�mcreate or replace view Lak�kH�zank�ntN�zetasselect	N�v,	Eg�szs�gbiztos�t�si_sz�m,	Lak�k.h�z_sz�mfrom Lak�k, H�zakwhere H�zak.h�z_sz�m = Lak�k.h�z_sz�morder by H�zak.h�z_sz�m, N�v;SELECT	H.h�z_sz�m as h�zsz�m,	N�v as Lak�,	Eg�szs�gbiztos�t�si_sz�mFROM (select * from H�zak where rownum <= 3) H, Lak�kH�zank�ntN�zetWHERE H.h�z_sz�m = Lak�kH�zank�ntN�zet.h�z_sz�m;TTITLE OFFBTITLE OFFCLEAR COLUMNSclear break