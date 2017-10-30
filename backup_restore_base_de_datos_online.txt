
-- 1. Realizar un backup online
BACKUP DATABASE ${base_de_datos} ONLINE TO "D:\BACKUP\BD" WITH 2 BUFFERS BUFFER 1024 PARALLELISM 1 WITHOUT PROMPTING;


-- 2. Comprobar si el backup se puede restaurar
DB2CKBKP ${base_de_datos}.0.DB2.NODE0000.CATN0000.YYYYMMDD.HHMMSS.001


-- 3. Restaurar parcialmente la base de datos 
RESTORE DATABASE ${base_de_datos} FROM \\RUTA_DEL_BACKUP


-- 4. Restaurar totalmente la base de datos
ROLLFORWARD DATABASE ${base_de_datos} TO END OF LOGS AND COMPLETE


NOTAS:
- La resturacion parcial no permite conectarse a la base de datos
- Antes del punto 4, se pueden copiar los logs generados desde el ultimo backup online
- Siempre ejecutar el punto 4 para dejar la base de datos online
