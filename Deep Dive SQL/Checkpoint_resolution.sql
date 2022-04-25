/* 1) ¿Cuál es el canal de ventas con menos venta (Venta = Precio * Cantidad)? */
select Canal, sum(Precio * Cantidad) as Venta from canal_venta, venta
where canal_venta.IdCanal = venta.IdCanal
GROUP BY Canal
ORDER BY Venta ASC
LIMIT 1;

/* 2) ¿Cuál es el canal de ventas con menor cantidad de ventas registradas? */
SELECT Canal, sum(Cantidad) as ventas_registradas from canal_venta, venta
WHERE canal_venta.IdCanal = venta.IdCanal
GROUP BY Canal
ORDER BY ventas_registradas ASC
LIMIT 1;

/* 3) ¿Cuál es el año con la mayor cantidad de productos vendidos? */
SELECT year(fecha) as anio,sum(Cantidad) from venta
GROUP BY anio
ORDER BY anio DESC
LIMIT 1;

/* 4) Se define el tiempo de entrega como el tiempo en días transcurrido 
entre que se realiza la compra y se efectua la entrega. Para analizar mejoras 
en el servicio, la dirección desea saber: cuál es el año con el promedio más alto 
de este tiempo de entrega. (Fecha = Fecha de venta; Fecha_Entrega = Fecha de entrega) */
SELECT year(Fecha) as anio,AVG(timestampdiff(day, Fecha,Fecha_Entrega)) as Tiempo_Entrega from venta
GROUP BY anio
ORDER BY Tiempo_entrega DESC
LIMIT 1;

/* 5) La dirección desea saber que tipo de producto tiene la mayor venta en 2020 
(Tabla 'producto', campo Tipo = Tipo de producto) */
select year(Fecha) as 'año',Tipo, sum(venta.Precio*venta.Cantidad) as Venta  from producto, venta
where year(Fecha) = 2020 and venta.IdProducto = producto.IDProducto
group by Tipo
ORDER BY venta DESC
LIMIT 1;