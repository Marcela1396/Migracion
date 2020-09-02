-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-#-#-#-#-#-#-#-#-#--#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistemas de estudio: ArangoDB
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCRIPT PARA LA IMPORTACIÓN DE DATOS Y CREACIÓN DE COLECCIONES EN ARANGODB  : OPCION 1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- USO DE ARANGO IMPORT 
-- *************************************************************************************************************************************
-- Para el proposito de importacion de datos y la creación de colecciones de forma inmediata se empleo Arangoimport que permite
-- importar archivos de tipo CSV, JSON y TSV al servidor de ArangoDB sobre el cual se esta trabajando

-- Se empleo arangoimp => Desde la consola de Windows en la ruta donde se instalo ArangoDB
-- El cual permite Importar archivos JSON al Servidor de ArangoDB 
 
-- Si la coleccion no ha sido creada, se realiza previamente este proceso y la carga a una base de datos
-- que se encuentra en el servidor de ArangoDB 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- COMANDOS EMPLEADOS EN ARANGO IMPORT 
-- *************************************************************************************************************************************
-- Nota: Inicialmente se trabajó realizando una transformación a las llaves primarias de todos los documentos las cuales debian estar
-- en en formato String.
-- Como el modelo relacional presentada llaves primarias en formato entero, estas se transformaron a String para que al momento
-- de realizar la unión de documentos con AQL no presente error alguno. 
-- Sin embargo, dado que los documentos permiten una mayor flexibilidad, las uniones también son más flexibles.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Para la opción 1 se trabajó con el uso de _key e _id asignadas a cada documento.
-- Cabe resaltar que cada documento crea por defecto un key como llave primaria identificadora de cada documento  y un _id formado por 
-- el nombre de la colección seguido de la clave asignada al documento, ambos estan en formato String. 
-- Ejemplo:  "_key": "1"  e "_id" : "Cliente/1"
-- En AQL se recomienda que para referenciar un documento con otro es necesario emplear el _id de cada Documento ya que contiene
-- tanto el nombre de la colección como la clave del documento 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Caso 1: Colecciones sin referencias 
--- Estas colecciones (NoSQL) representan a aquellos casos donde los documentos que  no tienen ninguna relacion de referencia a 
-- otro documento.

-- Colección Cliente  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb2\cliente.json" --collection Cliente --create-collection true --server.database hoteldb2

-- Colección Precio -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb2\precio.json" --collection Precio --create-collection true --server.database hoteldb2

-- Colección FormaPago  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
arangoimp --file "C:\Users\marce\Downloads\hoteldb2\formapago.json" --collection FormaPago --create-collection true --server.database hoteldb2

-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-- Caso 2:  Colecciones cuyos documentos referencian a otro documento
-- A cada documento del archivo json que se desee contar con una referencia a otro documento se les incrusto el _id del documento a 
-- referenciar en el atributo deseado.

-- Ejemplo: Nombre_Atributo: "NombreColección/idDocumento" 

-- Colección Habitación  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 => Colección a Referenciar: Precio
 => Atributo que servira para la referencia en el Documento Habitación: "Tipo"
 =>  Ej: "Tipo":"Precio/1"
 
arangoimp --file "C:\Users\marce\Downloads\hoteldb2\habitacion.json" --collection Habitacion --create-collection true --server.database hoteldb2

-- Colección Empleado   -------------------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Servicio
=> Atributo que servira para la referencia en el Documento Empleado: "CodS"
=>  Ej: "CodS":"Servicio/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\empleado.json" --collection Empleado --create-collection true --server.database hoteldb2

-- Colección Servicio  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Servicio: "NumReg"
=>  Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\servicio.json" --collection Servicio --create-collection true --server.database hoteldb2

-- Colección Proveedor  -------------------------------------------------------------------------------------------------------------------------------------------------------------------
=> Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Proveedor: "NumReg"
=> Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\proveedor.json" --collection Proveedor --create-collection true --server.database hoteldb2

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Para el caso de las siguientes colecciones como en el modelo relacional son tablas producto de una relación muchos a muchos 
-- estas tendran más de un documento a referenciar

-- Colección Reserva  --------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Colección a Referenciar: Cliente
 => Atributo que servira para la referencia en el Documento Reserva: "DNI"
 =>  Ej: "DNI":"Cliente/111111"
 
2.Colección a Referenciar: Habitacion
 => Atributo que servira para la referencia en el Documento Reserva: "Numero"
 =>  Ej: "Numero":"Habitacion/101"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\reserva.json" --collection Reserva --create-collection true --server.database hoteldb2

-- Colección Factura_Prov -----------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Colección a Referenciar: Proveedor
 => Atributo que servira para la referencia en el Documento Factura_Prov: "NIF"
 =>  Ej: "NIF":"Proveedor/121212T"
 
2. Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Factura_Prov: "NumReg"
=>  Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\factura_prov.json" --collection Factura_Prov --create-collection true --server.database hoteldb2


-- Colección Limpieza --------------------------------------------------------------------------------------------------------------------------------------------------------------------

1.Colección a Referenciar: Habitacion
 => Atributo que servira para la referencia en el Documento Limpieza: "Numero"
 =>  Ej: "Numero":"Habitacion/101"

2. Colección a Referenciar: Empleado
=> Atributo que servira para la referencia en el Documento Limpieza: "NumReg"
=>  Ej: "NumReg":"Empleado/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\limpieza.json" --collection Limpieza --create-collection true --server.database hoteldb2

-- Colección Incluye --------------------------------------------------------------------------------------------------------------------------------------------------------------------

1.Colección a Referenciar: Factura
 => Atributo que servira para la referencia en el Documento Incluye: "CodigoF"
 =>  Ej: "CodigoF":"Factura/1"

2. Colección a Referenciar: Servicio
=> Atributo que servira para la referencia en el Documento Incluye: "CodS"
=>  Ej: "CodS":"Servicio/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\incluye.json" --collection Incluye --create-collection true --server.database hoteldb2

-- Colección Usa  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. Colección a Referenciar: Servicio
=> Atributo que servira para la referencia en el Documento Usa: "CodS"
=>  Ej: "CodS":"Servicio/1"

2. Colección a Referenciar: Servicio
=> Atributo que servira para la referencia en el Documento Usa: "Servicio_CodS"
=>  Ej: "Servicio_CodS":"Servicio/1"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\usa.json" --collection Usa --create-collection --server.database hoteldb2

-- Colección Factura ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Colección a Referenciar: Cliente
 => Atributo que servira para la referencia en el Documento Factura: "DNI"
 =>  Ej: "DNI":"Cliente/111111"
 
2.Colección a Referenciar: Habitacion
 => Atributo que servira para la referencia en el Documento Factura: "Numero"
 =>  Ej: "Numero":"Habitacion/101"
 
3.Colección a Referenciar: FormaPago
 => Atributo que servira para la referencia en el Documento Factura: "Forma"
 =>  Ej: "Forma": "FormaPago/tarjeta"

arangoimp --file "C:\Users\marce\Downloads\hoteldb2\factura.json" --collection Factura --create-collection true --server.database hoteldb2

