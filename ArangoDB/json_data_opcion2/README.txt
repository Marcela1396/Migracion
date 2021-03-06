-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistemas de estudio: ArangoDB
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCRIPT PARA LA CREACIÓN DE UNA BASE DATOS, COLECCIONES Y DOCUMENTOS EN ARANGODB : OPCION2
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- USO DE ARANGO IMPORT 
-- *************************************************************************************************************************************************************************
-- Para el proposito de importacion de datos y la creación de colecciones de forma inmediata se empleo Arangoimport que permite
-- importar archivos de tipo CSV, JSON y TSV al servidor de ArangoDB sobre el cual se esta trabajando

-- Se empleo arangoimp => Desde la consola de Windows en la ruta donde se instalo ArangoDB
-- El cual permite Importar archivos JSON al Servidor de ArangoDB 
 
-- Si la coleccion no ha sido creada, se realiza previamente este proceso y la carga a una base de datos
-- que se encuentra en el servidor de ArangoDB 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- COMANDOS EMPLEADOS EN ARANGO IMPORT 
-- **************************************************************************************************************************************************************************
-- Nota: Inicialmente se trabajó realizando una transformación a las llaves primarias de todos los documentos las cuales debian estar
-- en en formato String.
-- Como el modelo relacional presentada llaves primarias en formato entero, estas se transformaron a String para que al momento
-- de realizar la unión de documentos con AQL no presente error alguno. 
-- Sin embargo, dado que los documentos permiten una mayor flexibilidad, las uniones también son más flexibles.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Para la opción 2 se trabajó similar a la opción 1, aquellas colecciones (tablas en el modelo relacional) solo tenian una sola 
referencia. 
Para aquellas que eran producto de una relacion muchos a muchos se trabajo empleando Documentos de tipo Edge.
La colección Factura maneja una excepcion ya que tiene más de 2 relaciones por ende se vio viable hacerlo de la forma anterior.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Caso 1: Colecciones sin referencias 
-- Estas colecciones (NoSQL) representan a aquellos casos donde los documentos que  no tienen ninguna relacion de referencia a 
-- otro documento.

-- Colección Precio -----------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb\precio.json" --collection Precio --create-collection true --server.database hoteldb

-- Colección Cliente  ---------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb\cliente.json" --collection Cliente --create-collection true --server.database hoteldb

-- Colección FormaPago  -------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb\formapago.json" --collection FormaPago --create-collection true --server.database hoteldb

-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

-- Caso 2:  Colecciones cuyos documentos referencian a otro documento
-- A cada documento del archivo json que se desee contar con una referencia a otro documento se les incrusto el _id del documento a 
-- referenciar en el atributo deseado.

-- Ejemplo: Nombre_Atributo: "NombreColección/idDocumento" 

-- Colección Habitación  -----------------------------------------------------------------------------------------------------------------------------------------------------
 => Colección a Referenciar: Precio
 => Atributo que servira para la referencia en el Documento Habitación: "Tipo"
 =>  Ej: "Tipo":"Precio/1"
 
arangoimp --file "C:\Users\marce\Downloads\hoteldb\habitacion.json" --collection Habitacion --create-collection true --server.database hoteldb

-- Colección Empleado   -------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Servicio
=> Atributo que servira para la referencia en el Documento Empleado: "CodS"
=>  Ej: "CodS":"Servicio/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb\empleado.json" --collection Empleado --create-collection true --server.database hoteldb

-- Colección Servicio  --------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Servicio: "NumReg"
=>  Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb\servicio.json" --collection Servicio --create-collection true --server.database hoteldb

-- Colección Proveedor  -------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Proveedor: "NumReg"
=> Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb\proveedor.json" --collection Proveedor --create-collection true --server.database hoteldb

-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#-

-- Caso 3: Colecciones Many to Many (Solo 2 relaciones)
-- Para este caso se creo colecciones de tipo Edge 
-- Edge permite conectar documentos con otros a partir de un enlace. Para el logro de dicho objetivo se emplean los atributos internos: _from y _to los 
-- cuales contienen identificadores de documentos a conectar teniendo el punto de inicio y el punto final del enlace

-- Colección Reserva => Enlace "_from":"Cliente/111111", "_to":"Habitacion/101"
arangoimp --file "C:\Users\marce\Downloads\hotel\reserva.json" --collection Reserva --create-collection-type edge true --server.database hoteldb

-- Colección Factura_Prov => Enlace "_from":"Proveedor/121212T", "_to":"Empleado/8"
arangoimp --file "C:\Users\marce\Downloads\hotel\factura_prov.json" --collection Factura_Prov --create-collection-type edge true --server.database hotel

-- Colección Limpieza => Enlace "_from":"Empleado/11", "_to":"Habitacion/100",
arangoimp --file "C:\Users\marce\Downloads\hotel\limpieza.json" --collection Limpieza --create-collection-type edge true --server.database hotel

-- Colección Incluye => Enlace "_from":"Factura/1", "_to":"Servicio/1",
arangoimp --file "C:\Users\marce\Downloads\hotel\incluye.json" --collection Incluye --create-collection-type edge true --server.database hoteldb

-- Colección Usa => Enlace "_from":"Servicio/5", "_to":"Servicio/1",
arangoimp --file "C:\Users\marce\Downloads\hotel\usa.json" --collection Usa --create-collection-type edge true --server.database hoteldb


-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#
-- Caso 4: Colecciones Many to Many (Más de 2)
-- Para este caso especial ArangoDB no tiene una documentación especifica de como trabajar documentos que pueden apuntar a más de 2 de documentos
-- a la vez. Ante ello se lo trabajará de la forma del caso 2 expuesto en este documento

-- Colección Factura
a. Colección a Referenciar: Cliente
 => Atributo que servira para la referencia en el Documento Factura: "DNI"
 =>  Ej: "DNI":"Cliente/111111"
 
b.Colección a Referenciar: Habitacion
 => Atributo que servira para la referencia en el Documento Factura: "Numero"
 =>  Ej: "Numero":"Habitacion/101"
 
c.Colección a Referenciar: FormaPago
 => Atributo que servira para la referencia en el Documento Factura: "Forma"
 =>  Ej: "Forma": "FormaPago/tarjeta"
arangoimp --file "C:\Users\marce\Downloads\hotel\factura.json" --collection Factura --create-collection true --server.database hoteldb



