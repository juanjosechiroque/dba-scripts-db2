
-- 1. Habilitar los logs de auditoria en la instancia
db2audit configure datapath D:\IBM\SQLLIB\DB2\security\auditdata;
db2audit configure archivepath D:\IBM\SQLLIB\DB2\security\auditarchive;

-- 2. Conectarse a cada base de datos y ejecutar
CREATE AUDIT POLICY ALGAUDIT
     CATEGORIES AUDIT    STATUS BOTH,
                SECMAINT STATUS BOTH,
                OBJMAINT STATUS BOTH,
                CHECKING STATUS FAILURE,
		EXECUTE WITH DATA STATUS BOTH,
                VALIDATE STATUS FAILURE,
		SYSADMIN STATUS FAILURE
     ERROR TYPE NORMAL;

AUDIT SYSADM, SYSMAINT, SYSCTRL, SYSMON, DBADM, SECADM USING POLICY ALGAUDIT;



-- 3. Sacar los logs de auditoria 
CALL SYSPROC.AUDIT_ARCHIVE(NULL, NULL)


-- 4. Extraer el archivo de logs de auditoria
CALL SYSPROC.AUDIT_DELIM_EXTRACT ('',NULL,NULL,'db2audit.db.NAMEDB.log.0.YYYYMMDDHHMMSS','')

Archivos resultantes:

validate.del
sysadmin.del
secmaint.del
objmaint.del
execute.del
context.del
checking.del
auditlobs
audit.del


NOTAS:
- El punto 3 genera un archivo llamado db2audit.db.NAMEDB.log.0.YYYYMMDDHHMMSS
- El archivo db2audit.db.NAMEDB.log.0.YYYYMMDDHHMMSS se genera en la carpeta configurada en el punto 1 (archivepath)
- El punto 4 se utiliza el archivo generado en el punto 3
