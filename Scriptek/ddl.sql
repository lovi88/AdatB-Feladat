PROMPT Táborhely Üzemeltetõ Adatbázis Adminisztrátori almenû
PROMPT
PROMPT ***********************************************************************
PROMPT *  Új oszlop hozzáadása                 (ddl_oszlop_új)               *
PROMPT *  Oszlop módosítása                    (ddl_oszlop_mod)              *
PROMPT *  Oszlopok logikai törlése             (ddl_oszlop_del_logic)        *
PROMPT *  Oszlopok törlések véglegesítése      (ddl_oszlop_del_logic_finish) *
PROMPT *  Oszlopok fizikai törlése             (ddl_oszlop_del_fizik)        *
PROMPT *  Oszlop átnevezés                     (ddl_oszlop_ren)              *
PROMPT *  Tábla átnevezés                      (ddl_tábla_átnevez)           *
PROMPT *  Tábla törlése                        (ddl_tábla_töröl)             *
PROMPT *  Megszorítás hozzáadása               (ddl_constraint_új)           *
PROMPT *  Megszorítás megváltoztatása          (ddl_constraint_mod)          *
PROMPT *  Megszorítás törlés                   (ddl_constraint_töröl)        *
PROMPT ***********************************************************************

ACCEPT al PROMPT 'A kívánt almenû eléréséhez írjon be, egy a zárójelekben lévõ szót:'
@@ &al