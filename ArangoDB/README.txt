-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
-----------------------------------------------------------------------------------------------------------------------------
CONTENIDO DEL DIRECTORIO:
1) Directorio json_data_opcion1 : 
Se encuentran los datos que se van a importar en las colecciones de la base de datos hoteldb2 con las respectivas
modificaciones acordes al uso de "relaciones" entre documentos expuestas en el Lenguaje de consulta de Arango (AQL).
Se trabaja todos los documentos con la relacion Uno a Muchos unicamente del lenguaje AQL.
Las colecciones Reserva, Factura_Prov, Limpieza, Incluye, Usa y Factura que en el modelo relacional surgen como tablas
producto de una relación mucho a muchos, se trabajan de forma independiente sin usar Documentos de Tipo Edge.

Dentro de este directorio se encuentra el script de importación de estos datos 
-------------------------------------------------------------------------------------------------------------------------------

2) Directorio json_data_opcion2 : 
Se encuentran los datos que se van a importar en las colecciones de la base de datos hoteldb con las respectivas
modificaciones acordes al uso de "relaciones" entre documentos expuestas en el Lenguaje de consulta de Arango (AQL).
a) Se trabaja los documentos con la relacion Uno a Muchos:
Colección: Habitación, Precio, Cliente, Empleado, Proveedor , FormaPago, Servicio y Factura
b) Muchos a Muchos usando Documentos de tipo Edge
Colección Reserva, Factura_Prov, Limpieza, Incluye, Usa

Dentro de este directorio se encuentra el script de importación de estos datos 
------------------------------------------------------------------------------------------------------------------------------
3) comandos_arango:
Este archivo muestra algunos comandos para usar tanto el la shell como en la Interfaz Web de Arango para la 
creación de bases de datos y colecciones , inserción, actualización e eliminación de documentos en ArangoDB.

------------------------------------------------------------------------------------------------------------------------------
4) query_ArangoDB: Contiene el script con algunas consultas realizadas al modelo NoSQL trabajadas bajo el modelo
de datos creado con la opción 1.



