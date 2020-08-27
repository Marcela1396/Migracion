-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
-------------------------------------------------------------------------------------
-- Sistemas de estudio: MySQL 
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

-------------------------------------------------------------------------------------
-- SCRIPT PARA LA INSERCION DE DATOS EN UNA BASE DATOS RELACIONAL EN MYSQL
-------------------------------------------------------------------------------------

INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('111111', 'Antonio', 'Aguirre', 'Pez 20, 1º A', '999418768');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('222222', 'Jorge', 'Anguiano López', 'Churruca 2, 6º D', '999876737');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('333333', 'Pilar', 'Méndez Alonso', 'Gran Via 167', '999343543');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('444444', 'Azucena', 'Rubio del Val', 'Brasil 63, 2º A', '999456765');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('555555', 'Raúl', 'Gutiérrez González', 'Literatos 3, 5º', '999876234');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('666666', 'Santiago', 'Rivera Romero', 'Avda. de la Paz 30', '999111232');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('777777', 'Pedro', 'González Hernando', 'Castellana 290, 9º B', '999232221');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('888888', 'Antonio', 'Díaz Martín', 'Cuba 1', '999444554');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('999999', 'Virginia', 'Fernández Fernández', 'Brasil 65, 3º', '999009009');
INSERT INTO Cliente (DNI, Nombre, Apellidos, Domicilio, Telefono)
VALUES ('000000', 'Francisco', 'Vilansó Rodríguez', 'General Rodrigos 24', '999666565');


INSERT INTO Precio (Tipo, precio)
VALUES ('individual',75);
INSERT INTO Precio (Tipo, precio)
VALUES ('doble',90);


INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (100,17,'SI','SI','SI','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (101,17,'SI','SI','SI','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (102,17,'SI','SI','SI','individual');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (200,17,'SI','SI','SI','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (201,17,'SI','SI','NO','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (202,15,'SI','SI','NO','individual');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (203,15,'NO','SI','SI','individual');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (204,17,'SI','SI','SI','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (300,17,'NO','SI','SI','doble');
INSERT INTO Habitacion (Numero, Superficie, bar, terraza, puedesupletoria, Tipo)
VALUES (301,17,'SI','SI','SI','doble');


INSERT INTO FormaPago(Forma, comision)
VALUES ('efectivo', 0);
INSERT INTO FormaPago(Forma, comision)
VALUES ('tarjeta', 1);
INSERT INTO FormaPago(Forma, comision)
VALUES ('talon', 2);



INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (1,'Luisa Blanco Baroja', STR_TO_DATE('23/10/1996', '%d/%m/%Y'),1000,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (2,'Fernando Serrano Vázquez',STR_TO_DATE('23/10/1996', '%d/%m/%Y'),1000,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (3,'Manuel Pérez Calo',STR_TO_DATE('01/01/2000', '%d/%m/%Y'),900,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (4,'Ana Troncoso Calvo',STR_TO_DATE('01/01/2000', '%d/%m/%Y'),900,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (5,'Alba Troncoso Calvo',STR_TO_DATE('13/09/2002', '%d/%m/%Y'),NULL,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (6,'Jorge Alonso Alonso',STR_TO_DATE('13/09/2002', '%d/%m/%Y'),NULL,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (7,'Fernando Soaje Alvarez',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),NULL,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (8,'Rosa Luigi Paz',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),1000,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (9,'Rafael Fuertes Cabrera',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),1100,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (10,'Antonio Sancho Sancho',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),1000,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (11,'María Gonzalo Fuentes',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),1000,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (12,'Juana Peláez Trasto',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),900,NULL);
INSERT INTO Empleado(Numreg, Nombre,Incorporacion,Sueldo, CodS)
VALUES (13,'Gonzalo Cabezas Muiño',STR_TO_DATE('01/01/2010', '%d/%m/%Y'),1500,NULL);



INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (1, 'tintoreria',50, 1);
INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (2, 'plancha',30, 2);
INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (3, 'lavanderia',60, 3);
INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (4, 'bar',15, 4);
INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (5, 'restaurante',50, 8);
INSERT INTO Servicio (CodS, Descripcion, costeinterno, NumReg)
VALUES (6, 'floristeria',25, 9);


UPDATE Empleado SET CodS = 1  WHERE NumReg = 1;
UPDATE Empleado SET CodS = 2  WHERE NumReg = 2;
UPDATE Empleado SET CodS = 3  WHERE NumReg = 3;
UPDATE Empleado SET CodS = 4  WHERE NumReg = 4;
UPDATE Empleado SET CodS = 1  WHERE NumReg = 5;
UPDATE Empleado SET CodS = 5  WHERE NumReg = 6;
UPDATE Empleado SET CodS = 5  WHERE NumReg = 7;
UPDATE Empleado SET CodS = 5  WHERE NumReg = 8;
UPDATE Empleado SET CodS = 6  WHERE NumReg = 9;


INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,1, STR_TO_DATE('25/08/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,1, STR_TO_DATE('30/08/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,1, STR_TO_DATE('24/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,2, STR_TO_DATE('18/08/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,2, STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,3, STR_TO_DATE('05/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,4, STR_TO_DATE('20/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,4, STR_TO_DATE('29/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (5,6, STR_TO_DATE('25/09/2010', '%d/%m/%Y'));


INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (4,2, STR_TO_DATE('17/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (4,2, STR_TO_DATE('29/08/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (4,3, STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (4,3,STR_TO_DATE('05/09/2010', '%d/%m/%Y'));
INSERT INTO Usa (CodS, Servicio_CodS, fecha)
VALUES (4,3, STR_TO_DATE('19/09/2010', '%d/%m/%Y'));


INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,101,STR_TO_DATE('20/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,101,STR_TO_DATE('21/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,101,STR_TO_DATE('22/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,101,STR_TO_DATE('23/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,102,STR_TO_DATE('24/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,202,STR_TO_DATE('23/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,203,STR_TO_DATE('23/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,204,STR_TO_DATE('30/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,301,STR_TO_DATE('01/10/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (10,300,STR_TO_DATE('01/10/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,100,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,101,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,102,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,200,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,201,STR_TO_DATE('11/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,202,STR_TO_DATE('11/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,203,STR_TO_DATE('11/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,204,STR_TO_DATE('11/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,300,STR_TO_DATE('12/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (12,301,STR_TO_DATE('12/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,100,STR_TO_DATE('01/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,100,STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,100,STR_TO_DATE('01/10/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,100,STR_TO_DATE('02/10/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,101,STR_TO_DATE('10/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,101,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,101,STR_TO_DATE('14/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,102,STR_TO_DATE('15/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,200,STR_TO_DATE('10/08/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,201,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,202,STR_TO_DATE('10/09/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,203,STR_TO_DATE('10/01/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,204,STR_TO_DATE('10/01/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,301,STR_TO_DATE('10/01/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,301,STR_TO_DATE('01/01/2010', '%d/%m/%Y'));
INSERT INTO Limpieza (NumReg, Numero, fecha)
VALUES (11,301,STR_TO_DATE('07/01/2010', '%d/%m/%Y'));


INSERT INTO Proveedor (NIF, Nombre, Direccion, NumReg)
VALUES ('121212T','Carnes SA','Plaza de los de Acá 20',8);
INSERT INTO Proveedor (NIF, Nombre, Direccion, NumReg)
VALUES ('343434L','Logística Pérez','Calle del Pueblo 30, 1º',1);
INSERT INTO Proveedor (NIF, Nombre, Direccion, NumReg)
VALUES ('545454Q','Prd. Quimicos SA','Colombiana 34',12);


INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (1,STR_TO_DATE('21/03/2010', '%d/%m/%Y'),1500,'121212T',8);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (2,STR_TO_DATE('21/04/2010', '%d/%m/%Y'),1000,'121212T',8);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (3,STR_TO_DATE('21/05/2010', '%d/%m/%Y'),500,'121212T',8);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (4,STR_TO_DATE('21/06/2010', '%d/%m/%Y'),976,'121212T',8);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (5,STR_TO_DATE('21/03/2010', '%d/%m/%Y'),345,'343434L',1);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (6,STR_TO_DATE('21/05/2010', '%d/%m/%Y'),235,'343434L',1);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (7,STR_TO_DATE('21/07/2010', '%d/%m/%Y'),1000,'343434L',1);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (8,STR_TO_DATE('21/08/2010', '%d/%m/%Y'),765,'343434L',1);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (9,STR_TO_DATE('21/03/2010', '%d/%m/%Y'),1235,'545454Q',12);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (10,STR_TO_DATE('11/04/2010', '%d/%m/%Y'),2342,'545454Q',12);
INSERT INTO Factura_Prov(CodFP, Fecha, Importe, NIF, NumReg)
VALUES (11,STR_TO_DATE('15/06/2010', '%d/%m/%Y'),2567,'545454Q',12);


INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('111111',101,STR_TO_DATE('01/02/2011', '%d/%m/%Y'),STR_TO_DATE('04/02/2011', '%d/%m/%Y'));
INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('111111',102,STR_TO_DATE('03/02/2011', '%d/%m/%Y'),STR_TO_DATE('04/02/2011', '%d/%m/%Y'));
INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('222222',300,STR_TO_DATE('02/02/2011', '%d/%m/%Y'),STR_TO_DATE('06/02/2011', '%d/%m/%Y'));
INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('777777',203,STR_TO_DATE('17/02/2011', '%d/%m/%Y'),STR_TO_DATE('19/02/2011', '%d/%m/%Y'));
INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('777777',204,STR_TO_DATE('25/03/2011', '%d/%m/%Y'),STR_TO_DATE('27/03/2011', '%d/%m/%Y'));
INSERT INTO Reserva (DNI, Numero, Entrada, Salida)
VALUES ('999999',200,STR_TO_DATE('11/02/2011', '%d/%m/%Y'),STR_TO_DATE('15/02/2011', '%d/%m/%Y'));
--

INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(1,STR_TO_DATE('01/01/2010', '%d/%m/%Y'), STR_TO_DATE('03/01/2010', '%d/%m/%Y'),'111111',100,30,'efectivo', 360);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(0,STR_TO_DATE('01/01/2010', '%d/%m/%Y'), STR_TO_DATE('05/01/2010', '%d/%m/%Y'),'999999',300,0,'tarjeta', 220);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(2,STR_TO_DATE('01/06/2010', '%d/%m/%Y'), STR_TO_DATE('03/06/2010', '%d/%m/%Y'),'111111',100,30,'efectivo', 180);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(3,STR_TO_DATE('01/09/2010', '%d/%m/%Y'), STR_TO_DATE('03/09/2010', '%d/%m/%Y'),'111111',100,30,'efectivo', 338);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(4,STR_TO_DATE('02/11/2010', '%d/%m/%Y'), NULL,'111111',100,0,'efectivo', NULL);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(5,STR_TO_DATE('01/11/2010', '%d/%m/%Y'), NULL,'333333',200,0,'tarjeta', NULL);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(6,STR_TO_DATE('29/10/2010', '%d/%m/%Y'), NULL,'999999',204,30,'talon', NULL);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(7,STR_TO_DATE('01/11/2010', '%d/%m/%Y'), NULL,'555555',300,0,'efectivo', NULL);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(8,STR_TO_DATE('30/10/2010', '%d/%m/%Y'), NULL,'777777',301,30,'tarjeta', NULL);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(9,STR_TO_DATE('15/05/2010', '%d/%m/%Y'), STR_TO_DATE('17/05/2010', '%d/%m/%Y'),'999999',301,0,'tarjeta', 218);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(10,STR_TO_DATE('10/08/2010', '%d/%m/%Y'), STR_TO_DATE('13/08/2010', '%d/%m/%Y'),'333333',300,0,'tarjeta', 270);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(11,STR_TO_DATE('15/08/2010', '%d/%m/%Y'), STR_TO_DATE('22/08/2010', '%d/%m/%Y'),'888888',102,0,'tarjeta', 525);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(12,STR_TO_DATE('23/12/2010','%d/%m/%Y'), STR_TO_DATE('24/12/2010','%d/%m/%Y'),'444444',201,0,'talon', 90);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(13,STR_TO_DATE('01/05/2010', '%d/%m/%Y'), STR_TO_DATE('05/05/2010', '%d/%m/%Y'),'999999',300,0,'efectivo', 380);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(14,STR_TO_DATE('06/06/2010', '%d/%m/%Y'), STR_TO_DATE('11/06/2010', '%d/%m/%Y'),'555555',203,0,'tarjeta', 375);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(15,STR_TO_DATE('15/08/2010', '%d/%m/%Y'), STR_TO_DATE('19/08/2010', '%d/%m/%Y'),'555555',203,0,'tarjeta', 363);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(16,STR_TO_DATE('19/08/2010', '%d/%m/%Y'), STR_TO_DATE('21/08/2010', '%d/%m/%Y'),'666666',204,0,'efectivo', 212);
INSERT INTO Factura(CodigoF, Entrada, Salida, DNI, Numero, supletoria, Forma, Total)
VALUES(17,STR_TO_DATE('22/08/2010', '%d/%m/%Y'), STR_TO_DATE('24/08/2010', '%d/%m/%Y'),'666666',203,0,'tarjeta', 190);


INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (1, 1, 25, STR_TO_DATE('01/01/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (1, 2, 15, STR_TO_DATE('01/01/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 3, 25, STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 3, 25, STR_TO_DATE('02/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 3, 25, STR_TO_DATE('03/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 2, 10, STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 2, 20, STR_TO_DATE('03/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 1, 10, STR_TO_DATE('01/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (3, 5, 43, STR_TO_DATE('02/09/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (5, 5, 25, STR_TO_DATE('01/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (5, 5, 28, STR_TO_DATE('02/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (5, 5, 33, STR_TO_DATE('03/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (5, 5, 24, STR_TO_DATE('04/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (5, 3, 13, STR_TO_DATE('02/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (7, 6,20, STR_TO_DATE('02/11/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (9, 4, 6, STR_TO_DATE('15/05/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (9, 4, 8, STR_TO_DATE('16/05/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (9, 5, 24, STR_TO_DATE('16/05/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (13, 2,10,STR_TO_DATE('03/05/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (13, 2,10,STR_TO_DATE('04/05/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (15, 5,45,STR_TO_DATE('15/08/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (15, 4,5,STR_TO_DATE('15/08/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (15, 2,13,STR_TO_DATE('15/08/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (16, 5,32,STR_TO_DATE('19/08/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (17, 1,10,STR_TO_DATE('20/08/2010', '%d/%m/%Y'));
INSERT INTO Incluye(CodigoF, CodS, coste, fecha)
VALUES (17, 5,30,STR_TO_DATE('23/08/2010', '%d/%m/%Y'));
