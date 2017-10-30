
-- 1. Reorganizar tabla
REORG TABLE ${esquema}.${tabla} ALLOW READ ACCESS USE TEMPSPACE2;
COMMIT WORK;

-- 2. Reoganizar indices de una tabla
REORG INDEXES ALL FOR TABLE ${esquema}.${tabla} ALLOW WRITE ACCESS;
COMMIT WORK;


-- 3. Actualizar las estadisticas de una tabla y sus indices
RUNSTATS ON TABLE ${esquema}.${tabla} ON ALL COLUMNS WITH DISTRIBUTION ON ALL COLUMNS AND DETAILED INDEXES ALL ALLOW WRITE ACCESS ;
COMMIT WORK;
