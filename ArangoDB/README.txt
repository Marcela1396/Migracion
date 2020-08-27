-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
--------------------------------------------------------------------------------------------------------------------
CONTENIDO DEL DIRECTORIO:

1) Directorio json_data_opcion1 : 
Se encuentran los datos que se van a importar en las colecciones de la base de datos en ArangoDB con las respectivas
modificaciones acordes al uso de Joins en AQL (Lenguaje de consulta de Arango)
a) Se trabaja los documentos con la relacion Uno a Muchos:
Colección: Habitación, Precio, Cliente, Empleado, Proveedor , FormaPago, Servicio y Factura
b) Muchos a Muchos usando Documentos de tipo Edge
Colección Reserva, Factura_Prov, Limpieza, Incluye, Usa

--------------------------------------------------------------------------------------------------------------------

2) Directorio json_data_opcion2 : 
Se encuentran los datos que se van a importar en las colecciones de la base de datos en ArangoDB con las respectivas
modificaciones acordes al uso de Joins en AQL (Lenguaje de consulta de Arango)
Se trabaja todos los documentos con la relacion Uno a Muchos unicamente.
Las colecciones Reserva, Factura_Prov, Limpieza, Incluye, Usa y Factura que en el modelo relacional surgen como tablas
producto de una relación mucho a muchos, se trabajan de forma independiente sin usar Documentos de Tipo Edge.

---------------------------------------------------------------------------------------------------------------------
3) db_schema_no_relacional : Contiene el script para la creacion de la base de datos y la forma de inserción de los
documentos en las colecciones. Cabe resaltar que ArangoDB no tiene ningun tipo de esquema

---------------------------------------------------------------------------------------------------------------------
4) query_ArangoDB: Contiene el script con algunas consultas realizadas al el modelo NoSQL



