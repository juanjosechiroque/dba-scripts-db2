
-- Iniciar/detener instancia
DB2START / DB2STOP


-- Listar las bases de datos la instancia
DB2 LIST DB DIRECTORY


-- Listar todas las tablas de una base de datos 
DB2 LIST TABLES FOR ALL


-- Listar las tablas de un esquema
DB2 LIST TABLES FOR SCHEMA ${esquema} 


-- Listar las conexiones (procesos) hacia una base de datos
DB2 LIST APPLICATIONS FOR DATABASE ${base_de_datos}


-- Eliminar todas las conexiones de la instancia
DB2 FORCE APPLICATION ALL


-- Eliminar conexiones determinadas
DB2 FORCE APPLICATION (${id_proceso}, ${id_proceso})

NOTA: ${id_proceso} se obtiene de comando list applications


-- Crear base de datos
DB2 CREATE DATABASE ${base_de_datos} AUTOMATIC STORAGE NO  ON 'D:\' USING CODESET UTF-8 TERRITORY Lat COLLATE USING SYSTEM PAGESIZE 4096;


-- Asignar permisos a la base datos
DB2 GRANT CONNECT ON DATABASE TO GROUP ${grupo}
GRANT INSERT ON TABLE ${esquema}.${tabla} TO USER ${usuario} ;
GRANT UPDATE ON TABLE ${esquema}.${tabla} TO GROUP ${grupo}  ;
GRANT DELETE ON TABLE ${esquema}.${tabla} TO USER ${usuario} ;
GRANT SELECT ON TABLE ${esquema}.${tabla} TO GROUP ${grupo} ;
DB2 GRANT SELECT, INSERT, DELETE, UPDATE ON TABLE ${esquema}.${tabla} TO USER ${grupo} ;
DB2 GRANT USAGE ON SEQUENCE ${esquema}.${secuencia} TO GROUP ${grupo} ;


-- Configurar campo como identity
ALTER TABLE ${esquema}.${tabla} ALTER COLUMN IN_IDAFFILIATION SET GENERATED AS IDENTITY ( START WITH 13707806 INCREMENT BY 1 CACHE 50 ) ;
