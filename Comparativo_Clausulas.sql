-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
----------------------------------------------------------------------------------------------------------------------------
-- Sistemas de estudio: MySQL y ArangoDB
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

-- CLAUSULA INSERT
-- Inserción de datos: 1 solo registro : MySQL
INSERT INTO cliente (id, nombre, genero)  VALUES ("999999","Marcela Guerrero", "f");

-- Inserción de datos: 1 solo documento : ArangoDB
INSERT { _key:"999999", nombre: "Marcela Guerrero", genero: "f" }   INTO cliente

-- Inserción de multiples datos : MySQL
INSERT INTO cliente (id, nombre, genero) 
VALUES ("999999", "Marcela Guerrero", "f"), ("889999","Jesus Garcia", "m");

-- Inserción de multiples datos : ArangoDB
FOR user IN [ 
 {"_key":"000000", "nombre":"Francisco", "genero":"m"},
 {"_key":"111111", "nombre":"Antonio",  "genero":"m"},
 {"_key":"222222", "nombre":"Jorge",  "  genero":"m"}, 
]
INSERT user INTO cliente

---------------------------------------------------------------------------------------------------------
-- CLAUSULA UPDATE
-- Actualizacion de datos: 1 solo registro : MySQL
UPDATE cliente SET name = "Marcela Guerrero" WHERE id = 1;

-- Actualizacion de datos: 1 solo documento : ArangoDB
UPDATE { _key: "111111" } WITH { "nombre": "Marcela Guerrero" } IN cliente

-- Adicionar un nuevo campo a una tabla : MySQL
ALTER TABLE cliente 
  ADD COLUMN numero 
  INTEGER NOT NULL default 0
  
-- Adicionar un nuevo campo a todos los documentos de una colección en ArangoDB
FOR user IN cliente
  UPDATE user 
    WITH { numero: 0 } IN cliente

---------------------------------------------------------------------------------------------------------
-- CLAUSULA REMOVE
-- Remover una columna/campo : MySQL
ALTER TABLE cliente DROP COLUMN numero;

-- Remover un campo : ArangoDB
FOR user IN cliente
  UPDATE user WITH { numero: null } 
  IN cliente
  OPTIONS { keepNull: false }
---------------------------------------------------------------------------------------------------------  
-- CLAUSULA DELETE/REMOVE
-- Eliminar un registro en MySQL
DELETE FROM cliente WHERE id = 1;

-- Eliminar un documento en ArangoDB
REMOVE { _key:"111111" } IN cliente

-- Eliminar multiples registros : MySQL
DELETE FROM cliente  WHERE numero = 1;

-- Eliminar multiples documentos en ArangoDB
FOR user IN cliente
  FILTER user.numero == 1
  REMOVE user IN cliente

--------------------------------------------------------------------------------------------------------- 
-- CONSULTAS
-- Seleccionar todos los registros de una tabla
select * from cliente;

-- Seleccionar todos los documentos de una tabla
FOR user in cliente
RETURN user

-- Clausula Where
-- Seleccionar los registros que cumplan una condicion
select * from cliente where id = "999999"
-- O más de una condición
select * from cliente where id = "999999" and numero = 0

-- Seleccionar los documentos que cumplan una condicion
FOR user in cliente
FILTER user._key == "999999"
RETURN user
-- O más de una condición
FOR user in cliente
FILTER user.numero == 0 and user._key == "182092"
RETURN user

-- Seleccionar los registros de una tabla y ordenarlos por algun factor
SELECT * FROM cliente
WHERE numero = 1
ORDER BY nombre, genero;

-- Seleccionar los registros de una colección y ordenarlos por algun factor
FOR user IN cliente
  FILTER user.numero == 1
  SORT user.nombre, user.genero
  RETURN user
