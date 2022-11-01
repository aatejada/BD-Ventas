/*
Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados 
por la fecha de realización, mostrando en primer lugar los pedidos más recientes. 
*/
select * from pedido order by fecha desc;

/*
Devuelve todos los datos de los dos pedidos de mayor valor.
*/
select top 2 * from pedido order by total desc;

/*
Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
*/
select distinct id_cliente from pedido;

/*
Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total 
sea superior a 500€.
*/
select * from pedido where year(fecha) = '2017' and total > 500;

/*
Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión 
entre 0.05 y 0.11.
*/
select nombre, apellido1, apellido2 from comercial where comision between 0.05 and 0.11;

/*
Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
*/
select max(comision) from comercial;

/*
Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido 
no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
*/
select id, nombre, apellido1 from cliente where apellido2 is not null order by 3,2;

/*
Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también 
los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
*/
select nombre from cliente where nombre like 'A%n' or nombre like 'P%' order by nombre;

/*
Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar 
ordenado alfabéticamente.
*/
select nombre from cliente where nombre not like 'A%' order by nombre;

/*
Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que 
se deberán eliminar los nombres repetidos.
*/
select distinct nombre from comercial where nombre like '%el' or nombre like '%o'; 

/*
Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado 
algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
*/
select distinct c.id, c.nombre, c.apellido1, c.apellido2 from cliente c inner join
pedido p on c.id = p.id_cliente order by c.nombre;

/*
Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar 
todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados 
alfabéticamente.
*/
select * from pedido p inner join cliente c on p.id_cliente = c.id order by c.nombre asc;

/*
Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado 
debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de 
los comerciales ordenados alfabéticamente.
*/
select * from pedido p inner join comercial c on p.id_comercial = c.id order by c.nombre asc;

/*
Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los 
datos de los comerciales asociados a cada pedido.
*/
select * from pedido p inner join cliente c on p.id_cliente = c.id
inner join comercial co on p.id_comercial = co.id order by c.nombre, co.nombre;

/*
Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad 
esté entre $300 y $1000.
*/
select * from cliente c inner join pedido p on c.id = p.id_cliente where
year(p.fecha) = '2017' and p.total between 300 and 1000;

/*
Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado 
por María Santana Moreno.
*/
select distinct c.nombre, c.apellido1, c.apellido2 from pedido p inner join comercial c
on p.id_comercial = c.id inner join cliente cl on p.id_cliente = cl.id
where cl.nombre = 'María' and cl.apellido1 = 'Santana' and cl.apellido2 = 'Moreno';

/*
Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
*/
select distinct cl.nombre from pedido p inner join cliente cl
on p.id_cliente = cl.id inner join comercial co on p.id_comercial = co.id
where co.nombre = 'Daniel' and co.apellido1 = 'Sáez' and co.apellido2 = 'Vega';

/*
Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar 
ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
*/
select * from cliente cl left join pedido p on  cl.id = p.id_cliente 
order by cl.apellido1, cl.apellido2, cl.nombre;

/*
Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
*/
select * from comercial co left join pedido p on co.id = p.id_comercial
order by co.apellido1, co.apellido2, co.nombre;

/*
Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad 
from pedido p right join cliente cl on p.id_cliente = cl.id where p.id is null;

/*
Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
*/
select co.id, co.nombre, co.apellido1, co.apellido2, co.comision
from pedido p right join comercial co on p.id_comercial = co.id where p.id is null;

/*
Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado 
en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar 
de algún modo los clientes y los comerciales.
*/
select * from cliente cl
full join pedido p on cl.id = p.id_cliente
full join comercial co on co.id = p.id_comercial
where p.id is null;

/*
Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
*/
select count(*) from pedido;

/*
Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
*/
select round(avg(total),2) from pedido;

/*
Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
*/
select count(distinct id_comercial) from pedido;

/*
Calcula el número total de clientes que aparecen en la tabla cliente.
*/
select count(*) from cliente;

/*
Calcula cuál es la mayor y menor cantidad que aparece en la tabla pedido.
*/
select max(total) as 'Valor Máximo', min(total) as 'Valor Minimo' from pedido;

/*
Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
*/
select max(categoria) from cliente;

/*
Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente 
ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, p.total
from pedido p inner join cliente cl on p.id_cliente = cl.id
where p.total = (select max(pe.total) from pedido pe where pe.fecha = p.fecha) order by p.fecha desc;

/*
Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000.
*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, p.total
from pedido p inner join cliente cl on p.id_cliente = cl.id
where p.total = (select max(pe.total) from pedido pe where pe.fecha = p.fecha) 
and p.total > 2000 order by p.fecha desc;

/*
Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. 
Muestra el identificador del comercial, nombre, apellidos y total.
*/
select co.id, co.nombre, co.apellido1, co.apellido2, p.fecha, p.total from pedido p
inner join comercial co on p.id_comercial = co.id
where p.total = (select max(pe.total) from pedido pe where pe.fecha = '2016-08-17');

/*
Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que 
ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún 
pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id_cliente) as 
'Cantidad de Pedidos'from cliente cl left join pedido p on cl.id = p.id_cliente
group by cl.id, cl.nombre, cl.apellido1, cl.apellido2 order by 5 desc;

select distinct id_cliente from pedido order by id_cliente;

/*
Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado 
cada uno de clientes durante el año 2017.
*/
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2,  
COUNT(pe.id_cliente) AS 'Cantidad'
FROM cliente cl LEFT JOIN (SELECT p.id_cliente
                            FROM pedido p
                            WHERE year(p.fecha) = '2017') AS pe
ON cl.id = pe.id_cliente
group by cl.id, cl.nombre, cl.apellido1, cl.apellido2 order by 5 desc;

/*
Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del 
pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún 
pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función ISNULL.
*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, 
ISNULL(NULL, 0) as 'Cantidad de Pedidos' from cliente cl 
left join pedido p on cl.id = p.id_cliente where p.id_cliente is null
group by cl.id, cl.nombre, cl.apellido1, cl.apellido2 order by 5 desc;

/*
Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
*/
select year(p.fecha) as 'Año', p.total from pedido p
where total = 
(select max(total) from pedido where year(fecha) = year(p.fecha));

/*
Devuelve el número total de pedidos que se han realizado cada año.
*/
select year(p.fecha) as 'Año', p.total from pedido p 
group by year(p.fecha), p.total;

select year(p.fecha) as 'Año', count(p.id_cliente) as 'Total Pedido' 
from pedido p group by year(p.fecha);

/*
Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN)
*/
select * from pedido p where id_cliente = (select id from cliente where
nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');

/*
Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
*/
select count(id_comercial) from pedido where id_comercial = 
(select id from comercial where 
nombre = 'Daniel' and apellido1 = 'Sáez' and apellido2 = 'Vega');

/*
Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
*/
select * from cliente where id = (select id_cliente from
pedido where total = (select max(total) from pedido 
where year(fecha) = '2019'));

/*
Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
*/
select fecha, total from pedido where total = (select min(total) 
from pedido where id_cliente = ( select id from cliente 
where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana')); 

/*
Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un 
pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
*/
select * from pedido p inner join cliente cl 
on p.id_cliente = cl.id where p.total >= (
select avg(pe.total) from pedido pe where year(pe.fecha) = '2017');

/*
Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni TOP.
*/
select * from pedido where total >= all(select total from pedido);

/*
Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
*/
select * from pedido where total <= all(select total from pedido);

/*
Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
*/
select * from cliente where id = any(select id_cliente from pedido);

select * from cliente where id != all(select id_cliente from pedido);

/*
Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
*/
select * from cliente where id not in (select id_cliente from pedido);

/*
Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
*/
select * from comercial where id not in (select id_comercial from pedido);

/*
Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
*/
select * from cliente c where not exists (select id_cliente from pedido
where id_cliente = c.id);

/*
Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
*/
select * from comercial c where not exists (select id_comercial from pedido
where id_comercial = c.id);
