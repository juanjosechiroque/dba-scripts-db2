
-- 1. Conectarse a la base de datos
CONNECT TO ${base_de_datos}


-- 2. Configurar la base de datos en modo online
UPDATE DATABASE CONFIGURATION USING LOGRETAIN Recovery DEFERRED ;


-- 3. Realizar un backup offline de la base de datos
BACKUP DB ${base_de_datos};


NOTAS:
- Si no se realiza el punto 3, la base de datos quedará bloqueda y NADIE podrá acceder
- Recien luego del punto 3, la base de datos quedará ONLINE y lista para sacar backup online
