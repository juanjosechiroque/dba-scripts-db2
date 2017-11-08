
-- Catalogar nodo
DB2 CATALOG TCPIP NODE NODPROD REMOTE ${ip_remota} SERVER db2c_DB2


-- Listar nodos
DB2 LIST NODE DIRECTORY


-- Catalogar base de datos
DB2 CATALOG DB ${base_de_datos} AT NODE NODPROD AUTHENTICATION SERVER


-- Descatalogar base de datos
DB2 UNCATALOG DB ${base_de_datos}
