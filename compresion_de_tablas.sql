
PARA QUE SIRVE
La compresión de tablas sirve para que la tabla ocupa menos espacio y asi su tablespace asociado a ella pueda reducir su espacio.

COMO TRABAJA
Intervamente, los valores repetivos de los campos son tratados como una llave y vinculados a uno indice, es decir, en lugar de tener 
el valor del campo, se coloca un apuntador hacia el valor. Esos valores se almacenan en una especie de lista indixada.


-- 1. Habilitar el COMPRESS
ALTER TABLE ${esquema}.${tabla} COMPRESS YES ;


-- 2. Eliminar los indices
DROP INDEX ${esquema}.IDX_VEREQ1 ;
DROP INDEX ${esquema}.IDX_VEREQ2 ;


-- 3. Eliminar la llave primaria y llaves foraneas
ALTER TABLE ${esquema}.${tabla} DROP PRIMARY KEY ;
ALTER TABLE ${esquema}.${tabla} DROP FOREIGN KEY SQL111029031801750 ;


-- 4. Aplicar REORG 
REORG TABLE ${esquema}.${tabla} ALLOW READ ACCESS USE TEMPSPACE2;


-- 5. Crear llave primaria y llaves foreneas
ALTER TABLE ${esquema}.${tabla} ADD PRIMARY KEY (IN_IDVEREQ);
ALTER TABLE ${esquema}.${tabla} ADD CONSTRAINT SQL111029031801750 FOREIGN KEY (${columna}) REFERENCES ${esquema}.${tabla_foranea} (${columna_foranea}) ON DELETE RESTRICT ON UPDATE RESTRICT ENFORCED ENABLE QUERY OPTIMIZATION;


-- 6. Crear indices
CREATE UNIQUE INDEX ${esquema}.IDX_VEREQ01 ON ${esquema}.${tabla} (${columna} ASC, ${columna} ASC, ${columna} ASC) INCLUDE (${columna}, ${columna}) ALLOW REVERSE SCANS;
CREATE INDEX ${esquema}.IDX_VEREQ02 ON ${esquema}.${tabla} (${columna} ASC, ${columna} DESC) ALLOW REVERSE SCANS;


-- 7. Actualizar estadisticas de la tabla
RUNSTATS ON TABLE ${esquema}.${tabla} ON ALL COLUMNS WITH DISTRIBUTION ON ALL COLUMNS AND DETAILED INDEXES ALL ALLOW WRITE ACCESS ;


NOTAS: 
- El punto 4 reducen el tamaño de la tabla
- El punto 7 actualizan la referencia del nuevo tamaño del tablespace
