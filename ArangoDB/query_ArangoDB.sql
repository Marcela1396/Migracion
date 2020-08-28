-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
-------------------------------------------------------------------------------------
-- Sistemas de estudio: MySQL y ArangoDB
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

-- # ============== CONSULTAS EJERCICIO PRÁCTICO EN UN MOTOR NoSQL : ArangoDB ================== 

-- Con base en la implementación de la base de datos para el Hotel, generar los scripts  
-- necesarios para  resolver las siguientes consultas en el motor ArangoDB

-- # ========================================================================================== 
-- 1) Obtener un listado de los empleados del hotel, con todos sus datos
SELECT * from empleado
-->  ArangoDB --------------------
FOR worker IN Empleado
  RETURN worker

-- # ========================================================================================== 
-- 2) Obtener el nombre del jefe del servicio de "Restaurante"

SELECT nombre, descripcion from servicio join empleado on servicio.numreg = empleado.NumReg 
where descripcion like 'restaurante'

-->  ArangoDB --------------------
-- OPCION 1
-- Para el caso se muestra todos los campos de ambas colecciones en sub-atributos individuales 
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN { Servicio: service, Empleado: worker }
    
-- Para el caso solo muestra el nombre del empleado y la descripcion del servicio (Restaurante) 
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN {Empleado : worker.Nombre, Servicio: service.Descripcion }

-- OPCION 2
-- Une las dos colecciones y muestra el resultado en una solo documento con todos los atributos con la función MERGE
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN MERGE(service,worker)
    
-- # ========================================================================================== 
-- 3) Obtener el nombre del jefe de "Jorge Alonso Alonso"
select nombre from servicio join empleado on servicio.numreg = empleado.NumReg 
where empleado.cods = (select cods from empleado where nombre like '%orge%')



-- # ========================================================================================== 
-- 4) Obtener un listado de los empleados y los servicios a los que están asignados, 
-- exclusivamente para aquellos que tengan algún servicio asignado
select nombre, descripcion from empleado join servicio on empleado.CodS = servicio.CodS

-->  ArangoDB --------------------
-- Para el caso se muestra todos los campos de ambas colecciones en sub-atributos individuales 
FOR worker IN Empleado
  FOR service IN Servicio
    FILTER worker.CodS == service._id
    RETURN {Empleado: worker, Servicio:service }

-- Para el caso solo muestra el nombre del empleado y la descripcion del servicio al cual esta asignado
FOR worker IN Empleado
  FOR service IN Servicio
    FILTER worker.CodS == service._id
    RETURN {Empleado: worker.Nombre, Servicio:service.Descripcion }    
    
-- Une las dos colecciones y muestra el resultado en una sola con la función MERGE
FOR worker IN Empleado
  FOR service IN Servicio
    FILTER worker.CodS == service._id
    RETURN MERGE(worker,service)
    
-- # ========================================================================================== 
-- 5) Obtener el número de habitación, tipo y precio de las habitaciones que estén ocupadas en 
-- la actualidad (no tienen fecha de salida)
select habitacion.numero, habitacion.tipo, precio.precio 
from precio join habitacion on precio.tipo = habitacion.tipo
join factura on habitacion.numero = factura.numero 
where factura.salida is null

-->  ArangoDB --------------------
FOR h IN Habitacion
  FOR p IN Precio
	FOR f IN Factura
		FILTER h.Tipo == p._id and f.Numero == h._id and f.Salida == null
		RETURN {Numero: h._key, Tipo: p._key, Precio : p.precio } 

-- # ========================================================================================== 
-- 6) Obtener el nombre y apellidos del cliente o clientes que más veces hayan estado en el 
-- hotel (no número total de noches, sino estancias diferentes: una persona que ha estado tres 
-- veces diferentes de una noche en el hotel habrá "estado" más veces que otra persona que ha 
-- estado una vez durante tres noches)
select factura.dni, cliente.nombre, cliente.apellidos, count(factura.dni) as NumEstancias 
from  factura join cliente on factura.dni = cliente.dni 
group by factura.dni, cliente.nombre, cliente.apellidos 
having count(factura.dni) = (select max(NumEstancias) as Maximo 
from (select count(factura.dni) as NumEstancias from factura  group by factura.dni ) T1)


-- # ========================================================================================== 
-- 7) Obtener los datos del empleado o empleados que hayan limpiado todas las habitaciones del 
-- hotel
select t1.nombre, count(t1.nombre) as NumeroHab from 
(select distinct empleado.nombre , limpieza.numero 
from empleado join limpieza on empleado.numreg = limpieza.numreg)t1
group by t1.nombre
having count(t1.nombre) = (select count(numero) from habitacion)


-- # ========================================================================================== 
-- 8) Obtener el listado de los clientes que ocupen o hayan ocupado alguna vez habitaciones de 
-- los dos tipos (individual y doble)
select distinct(cliente.nombre) as Cliente from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero where habitacion.tipo like '%oble%'
intersect
select distinct(cliente.nombre) as Cliente from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero where habitacion.tipo like '%ndivi%'

-- En MySQL el intersect es equivalente a
SELECT distinct(cliente.nombre) as Cliente
from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero 
where habitacion.tipo like '%oble%' and cliente.nombre in
(select distinct(cliente.nombre) as Cliente  from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero where habitacion.tipo like '%ndivi%');

-- # ========================================================================================== 
-- 9) Obtener un listado de los proveedores cuyas facturas hayan sido aprobadas únicamente por 
-- el encargado y no por el responsable de un servicio.

select  distinct proveedor.nombre as Proveedor, empleado.nombre as Encargado from 
proveedor join factura_prov on proveedor.nif = factura_prov.nif
join empleado on factura_prov.numreg = empleado.numreg

-- # ========================================================================================== 
-- 10) Igualar el sueldo del empleado que menos cobra dentro del servicio de "restaurante" con 
-- el del empleado que más cobra del mismo servicio

select servicio.descripcion, max(empleado.sueldo) as SueldoMax,  min(empleado.sueldo) as SueldoMin
from empleado join servicio on empleado.cods = servicio.cods
where servicio.descripcion like '%estaur%'
group by servicio.descripcion

-- # ========================================================================================== 
-- 11) Incrementar en un 10% el sueldo del empleado de "limpieza" que más habitaciones haya limpiado.
select t1.nombre, count(t1.nombre) as NumeroHab, t1.sueldo, t1.sueldo + (t1.sueldo*0.1) as SueldoNuevo from 
(select distinct empleado.nombre , empleado.sueldo, limpieza.numero 
from empleado join limpieza on empleado.numreg = limpieza.numreg)t1
group by t1.nombre, t1.sueldo
having count(t1.nombre) = (select count(numero) from habitacion)
