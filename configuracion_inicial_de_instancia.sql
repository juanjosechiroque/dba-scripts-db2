
-- 1. Detener la instancia
db2stop force


-- 2. Eliminala instancia DB2
db2idrop DB2


-- 3. Crea una instancia llamada DB2
db2icrt DB2 -p D:\IBM\SQLLIB


-- 4. Configura los parametros de la instancia
db2set DB2COMM=TCPIP
db2set DB2_STRIPED_CONTAINERS=ON
db2set DB2_SKIPINSERTED=ON
db2set DB2_EVALUNCOMMITTED=ON
db2set DB2_HASH_JOIN=ON
db2set DB2_PARALLEL_IO=*
db2 update dbm cfg using SVCENAME db2c_DB2

-- 5. Reiniciar la instancia
db2stop force
db2start


-- 6. Configurar el servicio de la instancia como automatico
-- 7. Reiniciar el servidor



