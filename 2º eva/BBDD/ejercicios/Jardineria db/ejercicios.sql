-- BLOQUE 1:
 1. Sacar el código de oficina y la ciudad donde hay oficinas
describe oficinas;
select codigoOficina, ciudad from oficinas where ciudad is not null;
select codigoOficina, ciudad from oficinas ;
-- 2. Sacar cuántos empleados hay en la compañía
select count(*) from empleados;
select count(codigoEmpleado) from empleados; 
-- 3. Sacar cuántos clientes tiene cada país
select count(*) from clientes;
select pais, count(*) from clientes group by pais;
select pais, count(*) from clientes;
describe clientes;
-- the previous is wrong becuase group by is missing
-- the next statement it's also wrong becasue we're using aggregate functions directly in the where
select pais, max(limitecredito) from clientes 
where max(limitecredito) > 50  
group by pais;
-- the correct answer for the previous statement is 
select pais, max(limitecredito) from clientes 
group by pais
having max(limitecredito) > 50;
-- but, please remember that you can filter the group by (as it occurs when you filter rows with where) thant in the
-- having clause you can write group attributes than don't apeaar in the proyection (the columns between the select word
-- and the from word)
-- i.e 
select pais, max(limitecredito) from clientes 
group by Pais
having avg(limmitecredito)>50;
-- 4. Sacar cuál fue el pago medio en 2005
describe pagos;
select avg(cantidad) from pagos where fechaPago between '2005-01-01' and '2005-12-31';
-- for me the previous one is the right one. 
-- the following could also work 
select avg(cantidad) from pagos where fechaPago like '2005%';  -- not recommended becaouse of performance. 
-- also, think that if we have and index on the column fechaPago the index meybe will not be used if we
-- write the next sentence
select avg(cantidad) from pagos where YEAR(fechaPago) like '2005';
-- 5. Obtener el nombre del cliente con mayor límite de crédito
-- possibly one of you rsolutions will be like this
select nombre from clientes order by limitecredito desc limit 1;
-- the previous one will give an answer to an non accurate question because the question assumes that 
-- there's only one client with the maximun credit limit and, of course, it could happen than more 
-- than one client have the maximum. 
select nombre from clientes where limitecredito = (select max(limiteCredito) from clientes);
-- the following is completely worng select nombre from clientes where limitecredito = max(limiteCredito)
-- and also is wrong select nombre from clientes where max(limiteCredito);


-- 6. Obtener el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente
-- first we obtain the 
select codigoempleado, apellido1, cargo from empleados where codigoempleado not in 
   (select distinct CodigoEmpleadoRepVentas from clientes);
-- 7. Sacar un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas
select   c.nombreCliente, e.nombre, e.apellido1     from empleados as e inner join clientes as c 
on c.codigoEmpleadoRepventas = e.codigoEmpleado;
-- 8. Mostrar el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de
-- ventas
-- the first approach could be to check if there are customers with no payments
select codigocliente from clientes where codigocliente not in (select distinct codigocliente from pagos);
select count(*) from clientes;
select count(distinct codigocliente) from pagos;
select  e.nombre, c.nombrecliente   from empleados e 
        inner join clientes c on c.CodigoEmpleadoRepVentas=e.codigoEmpleado
where codigoCliente not in (select distinct codigoCliente from pagos);

-- 9. Listar las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre,
-- unidades vendidas, total facturado y total facturado con impuestos (21% IVA)
select codigoproducto, sum(cantidad) as totalCantidad, sum(cantidad*precioUnidad) as totalFacturado,  
                                       sum(cantidad*precioUnidad)* 1.21 as totalConImpuestos 
from detallepedidos
group by codigoproducto
having sum(cantidad*precioUnidad) > 3000;
-- 10. Listar la dirección de las oficinas que tengan clientes en Fuenlabrada
select * from clientes where ciudad = 'Fuenlabrada';
select * from clientes where region like '%Fuenlabrada%';
describe oficinas;
select lineadireccion1 from oficinas; -- 1st approach
select lineadireccion1 from oficinas where 
	codigoOficina in (select distinct codigooficina from empleados);   -- offices with employees

select lineadireccion1 from oficinas where 
	codigoOficina in (select distinct codigooficina from empleados where 
                           codigoEmpleado In (select distinct codigoEmpleadoRepVentas from clientes 
                                                  where ciudad = 'Fuenlabrada'));   -- offices with employees

select distinct o.lineadireccion1 from oficinas as o
inner  join empleados as e on e.codigooficina = o.codigoOficina
inner  join clientes as c  on c.CodigoEmpleadoRepVentas = e.codigoEmpleado
where c.ciudad = 'Fuenlabrada';

-- 11. Sacar el cliente que hizo el pedido de mayor cuantía

-- 1.- como averiguar el importe de cada pedido
-- 2 cmo averiguar cual es el importe maximo de todos los pedidos 
-- 3 cuál es el código /códigos de pedidos de importe máximo. 

-- importe de cada pedido
select codigoPedido, sum(cantidad*precioUnidad) as totalPorPedido from detallepedidos 
group by codigoPedido;
-- importe máximo de los pedidos
select max(totalPorPedido) from 
   (select sum(cantidad*PrecioUnidad) as totalPorPedido from detallePedidos 
      group by codigoPedido) as TotalPedidos ;
-- pedidos cuyo importe sea igual al máximo

select codigoPedido from detallePedidos 
group by codigoPedido
having sum(cantidad*PrecioUnidad) = 
	(select max(totalPorPedido) from 
		(select sum(cantidad*PrecioUnidad) as totalPorPedido from detallePedidos 
			group by codigoPedido) as TotalPedidos );
-- codigoclliete  del cllinte/clientes que hicieron alguno de los pedidos de mayor importe (	
select codigoCliente from pedidos 
where codigoPedido IN (
	select codigoPedido from detallePedidos 
		group by codigoPedido
		having sum(cantidad*PrecioUnidad) = 
			(select max(totalPorPedido) from 
				(select sum(cantidad*PrecioUnidad) as totalPorPedido from detallePedidos 
					group by codigoPedido) as TotalPedidos ));


select c.nombreCliente, c.CodigoCliente, max(dp.Cantidad*dp.PrecioUnidad) as total  from clientes c
inner join pedidos p on c.CodigoCliente=p.CodigoCliente
inner join detallepedidos dp on p.CodigoPedido=dp.CodigoPedido




-- Si en la tabla pedidos existiera campo totalPedido la query sería más corta y quedaría algo así como
--     lo siguiente sería el codigoPedido del pedido o pedidos con mayor importe
select codigoPedido from pedidos where totalPedido = (select max(totalPedido) from pedidos;
--      lo siguiente sería el codigoCliente del cliente o clientes que han hecho alguno de los pedidos más caros
select distinct codigoCliente from pedidos 
   where totalPedido = (select max(totalPedido) from pedidos);
-- Sin haber un campo totalpedidos en la tabla se hubiese creado una vista que nos permitiera obtener el 
-- importe de cada pedido la select también sería más corta (ser más corta no siniofica que sea más rápida, 
-- simpleente que escribimos menos)
create view VTotalPedidos as 
	select codigoPedido, sum(cantidad*precioUnidad) as totalPorPedido from detallepedidos 
	group by codigoPedido;
	
-- BLOQUE II
-- 1.-	Sacar la ciudad y el teléfono de las oficinas de Estados Unidos
select ciudad, telefono from oficinas where pais ='EEUU';
-- 2. Sacar el nombre, los apellidos y el email de los empleados a cargo de Alberto Soria
select nombre, concat (apellido1, ' ' , apellido2) as apellidos, email 
from empleados where codigoJefe = (select codigoEmpleado from empleados 
                                   where nombre = 'Alberto' and apellido1 = 'Soria');
-- error antes  IN en lugar de = . En realidad la pregunta no es precisa porque presupone que sólo hay 1 empleado 
-- con ese nombre 
-- ahora con join. .... 

-- 								   -- 
-- 3. Sacar el cargo, nombre, apellidos y email del jefe de la empresa
-- 4. Sacar el número de clientes que tiene la empresa
-- 5. Sacar cuántos clientes tiene cada país
-- 6. Sacar cuántos clientes tiene la ciudad de Madrid
-- 7. Sacar el código de empleado y el número de clientes al que atiende cada representante de ventas
-- 8. Sacar el número de clientes que no tienen asignado representante de ventas
-- 9. Sacar cuántos productos existen en cada línea de pedido
-- 10. Sacar el número de pedido, código de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de
-- entrega ha sido al menos dos días antes de la fecha requerida (Pista: función addDate de MySQL)
-- 11. Sacar la facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total
-- facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas. El
-- IVA es el 21% de la base imponible y el total, la suma de los dos campos anteriores
-- 12. Sacar la misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los
-- códigos que empiecen por FR