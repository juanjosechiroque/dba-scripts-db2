
-- 1. Exportar a un archivo con formato IXF la información que se desea importar
EXPORT TO ARCHIVO.TXT OF IXF SELECT * FROM ${esquema}.${tabla};


-- 2. Eliminar la propiedad identity de la llave primaria
ALTER TABLE ${esquema}.${tabla} ALTER COLUMN IN_IDFILELOT DROP IDENTITY ;
	
	
-- 3. Importar la información
IMPORT FROM LOTES.TXT OF IXF INSERT INTO ${esquema}.${tabla};
	

-- 4. Obtener el siguiente valor que tendrá el autogenerado de la llave primaria	
SELECT MAX(IN_IDFILELOT) FROM ${esquema}.${tabla};

	
-- 5. Volver a colocarle a la llave primaria la propiedad identity 
ALTER TABLE ${esquema}.${tabla} ALTER COLUMN ${columna} SET GENERATED AS IDENTITY ( START WITH XXYYZZ INCREMENT BY 1 NO CACHE ORDER) ;


NOTA: 
- Reemplazar XXYYZZ por el resultado del paso 4 y sumarle 1
