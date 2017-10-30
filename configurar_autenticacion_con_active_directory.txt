
db2set DB2_ENABLE_LDAP=NO
db2set DB2_GRP_LOOKUP=DOMAIN

db2 update dbm cfg using SYSADM_GROUP GDBADM
db2 update dbm cfg using SYSCTRL_GROUP GDBCTRL
db2 update dbm cfg using SYSMAINT_GROUP GDBMAINT
db2 update dbm cfg using SYSMON_GROUP GDBMON

db2stop force
db2start

-- Reiniciar el servidor


NOTAS: 
- Si ya existen los grupos db2admns y db2user no borrarlos por nada del mundo
- Los grupos GDBADM, GDBCTRL, GDBMAINT y GDBMON deben ser grupos del Active Directory





