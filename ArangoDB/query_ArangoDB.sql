-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
-- PROCESO DE MIGRACIÒN DE UNA BASE DE DATOS IMPLEMENTADA EN UN SISTEMA SQL A UN NOSQL
-- Presentado por: Sandra Marcela Guerrero Calvache
-- Sistemas Avanzados de Bases de Datos
--------------------------------------------------------------------------------------------------------------
-- Sistemas de estudio: MySQL y ArangoDB
-- #-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-

-- # ============== CONSULTAS EJERCICIO PRÁCTICO EN UN MOTOR NoSQL : ArangoDB =============================== 

-- Con base en la implementación de la base de datos para el Hotel, generar los scripts  
-- necesarios para  resolver las siguientes consultas en el motor ArangoDB

-- # ======================================================================================================== 
-- 1) Obtener un listado de los empleados del hotel, con todos sus datos

-- > MySQL
SELECT * from empleado

-->  ArangoDB --------------------
FOR worker IN Empleado
  RETURN worker
  
-- Con información detallada de los empleados y los servicios asignados
FOR worker IN Empleado
    FOR service IN Servicio
        FILTER worker.CodS == service._id
        RETURN {worker, service}


-- # ========================================================================================================= 
-- 2) Obtener el nombre del jefe del servicio de "Restaurante"

-- > MySQL
SELECT nombre, descripcion from servicio join empleado on servicio.numreg = empleado.NumReg 
where descripcion like 'restaurante'

-->  ArangoDB --------------------
-- OPCION 1
-- Para el caso se muestra todos los campos de ambas colecciones en sub-atributos individuales 
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN { Servicio: service, Jefe: worker }
    
-- Para el caso solo muestra el nombre del empleado y la descripcion del servicio (Restaurante) 
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN {Jefe : worker.Nombre, Servicio: service.Descripcion }

-- OPCION 2
-- Une las dos colecciones y muestra el resultado en un solo documento con todos los atributos con la 
-- función MERGE
FOR service IN Servicio
  FOR worker IN Empleado
    FILTER service.NumReg == worker._id and service.Descripcion == "restaurante"
    RETURN MERGE(service,worker)
    
-- # ======================================================================================================= 
-- 3) Obtener el nombre del jefe de "Jorge Alonso Alonso"
-- > MySQL
select nombre from servicio join empleado on servicio.numreg = empleado.NumReg 
where empleado.cods = (select cods from empleado where nombre like 'Jorge Alonso Alonso')

-->  ArangoDB --------------------
-- Opcion 1:
LET code = (
		FOR worker2 IN Empleado
		  FILTER worker2.Nombre ==  'Jorge Alonso Alonso'
		  RETURN worker2.CodS
) 
FOR service IN Servicio
  FOR worker IN Empleado
  FILTER service.NumReg == worker._id and worker.CodS == code[0]
    RETURN {Empleado : worker.Nombre, Servicio: service.Descripcion }
    
-- Opcion 2
FOR service IN Servicio
  FOR worker IN Empleado
  FILTER service.NumReg == worker._id and worker.CodS  IN
  (
		FOR worker2 IN Empleado
		  FILTER worker2.Nombre ==  'Jorge Alonso Alonso'
		  RETURN worker2.CodS
) 
    RETURN {Empleado : worker.Nombre, Servicio: service.Descripcion }

-- # ====================================================================================================== 
-- 4) Obtener un listado de los empleados y los servicios a los que están asignados, 
-- exclusivamente para aquellos que tengan algún servicio asignado

-- > MySQL
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
    
-- # ====================================================================================================== 
-- 5) Obtener el número de habitación, tipo y precio de las habitaciones que estén ocupadas en 
-- la actualidad (no tienen fecha de salida)

-- > MySQL

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

-- # ======================================================================================================== 
-- 6) Obtener el nombre y apellidos del cliente o clientes que más veces hayan estado en el 
-- hotel (no número total de noches, sino estancias diferentes: una persona que ha estado tres 
-- veces diferentes de una noche en el hotel habrá "estado" más veces que otra persona que ha 
-- estado una vez durante tres noches)

-- MySQL
select factura.dni, cliente.nombre, cliente.apellidos, count(factura.dni) as NumEstancias 
from  factura join cliente on factura.dni = cliente.dni 
group by factura.dni, cliente.nombre, cliente.apellidos 
having count(factura.dni) = (select max(NumEstancias) as Maximo 
from (select count(factura.dni) as NumEstancias from factura  group by factura.dni ) T1)

--> ArangoDB

LET C =(
FOR f IN Factura
	FOR c IN Cliente
		FILTER c._id == f.DNI 
		COLLECT
			dni = c._key ,
			nombre = c.Nombre,
			apellidos = c.Apellidos
			WITH COUNT INTO number
		RETURN{
			DNI : dni,
			Nombre : nombre,
			Apellidos : apellidos,
			Estancias : number
		})
		
FOR user IN C
    FILTER user.Estancias in
    (
        FOR u IN C
          COLLECT AGGREGATE
          maxEst = MAX(u.Estancias)
          RETURN maxEst
         )
    RETURN user

-- # ======================================================================================================== 
-- 7) Obtener los datos del empleado o empleados que hayan limpiado todas las habitaciones del 
-- hotel
select t1.nombre, count(t1.nombre) as NumeroHab from 
(select distinct empleado.nombre , limpieza.numero 
from empleado join limpieza on empleado.numreg = limpieza.numreg)t1
group by t1.nombre
having count(t1.nombre) = (select count(numero) from habitacion)

--> ArangoDB
-- En esta primera parte de la consulta obtengo el listado de empleados, junto con las habitaciones
-- que han limpiado y guardo el resultado de la consulta en una variable identificadora denominada A
LET A = (
FOR e IN Empleado
	FOR l IN Limpieza
		FILTER e._id == l.NumReg
		RETURN DISTINCT{Nombre: e.Nombre, Habitacion: l.Numero}	
)

-- En esta segunda parte obtengo la cantidad de habitaciones que ha limpiado cada empleado sin
-- repetir de habitacion partiendo del resultado de la consulta guardada en A y almaceno el nuevo 
-- resultado en otra Variable llamada B.
LET B = (
FOR u in A
    COLLECT
		nombre = u.Nombre
		WITH COUNT INTO number
	RETURN { Empleado: nombre, NumeroHab: number}
)

-- Finalmente obtengo el listado de empleados cuya cantidad de habitaciones limpiadas sea igual
-- a la cantidad de habitaciones que tiene el hotel.

FOR w IN B
    FILTER w.NumeroHab in
        (
        FOR h in Habitacion
            COLLECT
        		WITH COUNT INTO number
        	RETURN number
        )
    RETURN w


-- # ========================================================================================================= 
-- 8) Obtener el listado de los clientes que ocupen o hayan ocupado alguna vez habitaciones de 
-- los dos tipos (individual y doble)

-- En MySQL el intersect es equivalente a
SELECT  distinct(factura.DNI) as DNI, concat_ws(' ', cliente.nombre, cliente.apellidos)  as Cliente    
from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero 
where habitacion.tipo like 'doble' and factura.DNI
IN (
select distinct(factura.DNI)  
from cliente join factura on cliente.dni = factura.dni
join habitacion on factura.numero = habitacion.numero 
where habitacion.tipo like 'individual')
order by factura.DNI;

-- > ArangoDB
LET X = (
FOR c IN Cliente
	FOR f IN Factura
		FOR h IN Habitacion
			FOR p IN Precio
				FILTER c._id == f.DNI and f.Numero == h._id and  h.Tipo == p._id and
				p._key == "individual"
				SORT c._id
					RETURN DISTINCT {Cliente: c._key, Nombre: c.Nombre, Apellidos: c.Apellidos }
)

LET Y = (
FOR c IN Cliente
	FOR f IN Factura
		FOR h IN Habitacion
			FOR p IN Precio
				FILTER c._id == f.DNI and f.Numero == h._id and  h.Tipo == p._id and
				p._key == "doble" 
				SORT c._id
					RETURN DISTINCT {Cliente: c._key, Nombre: c.Nombre, Apellidos: c.Apellidos }
)
RETURN INTERSECTION(X,Y)

			 
-- # ======================================================================================================== 
-- 9) Obtener un listado de los proveedores cuyas facturas hayan sido aprobadas únicamente por 
-- el encargado y no por el responsable de un servicio.

-- > MySQL
select  distinct proveedor.nombre as Proveedor, empleado.nombre as Encargado from 
proveedor join factura_prov on proveedor.nif = factura_prov.nif
join empleado on factura_prov.numreg = empleado.numreg
where empleado.nombre in (
select empleado.nombre from empleado join proveedor on empleado.NumReg = proveedor.NumReg
where empleado.nombre not in (
select empleado.nombre from empleado join servicio on empleado.NumReg = servicio.NumReg));


-- > ArangoDB
FOR p IN Proveedor
	FOR f IN Factura_Prov
		FOR e IN Empleado
			FILTER p._id == f.NIF and f.NumReg == e._id
			RETURN DISTINCT{Proveedor: p.Nombre, Encargado: e.Nombre}


LET A =
(
FOR e2 IN Empleado
	FOR p2 IN Proveedor
		FILTER p2.NumReg == e2._id
		RETURN DISTINCT{Worker: e2._key}
)



LET B = (
FOR e3 IN Empleado
	FOR s3 IN Servicio
		FILTER e3._id == s3.NumReg
		RETURN DISTINCT{Worker: e3._key}
)

