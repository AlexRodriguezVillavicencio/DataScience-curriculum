/* Aplicar alguna técnica de detección de Outliers en la tabla 
ventas, sobre los campos Precio y Cantidad. Realizar diversas consultas para verificar la 
importancia de haber detectado Outliers. Por ejemplo ventas por sucursal 
en un período teniendo en cuenta outliers y descartándolos. */

/*Deteccion y corrección de Outliers sobre ventas*/
/*Motivos:
2-Outlier de Cantidad
3-Outlier de Precio
*/

/* motivo 2 */
SELECT v.* FROM venta v 
INNER JOIN (
    SELECT Id_Producto, (AVG(Cantidad) + 3*STDDEV(Cantidad)) AS max_outlier 
    FROM venta GROUP BY Id_Producto) o 
ON v.Id_Producto=o.Id_Producto 
WHERE v.Cantidad > o.max_outlier OR v.Cantidad < 0;


INSERT INTO aux_venta 
          (Id_Venta, Fecha, Fecha_Entrega, 
           Id_Cliente, Id_Sucursal, Id_Empleado, 
           Id_Producto, Precio, Cantidad, 
           Motivo)
    SELECT v.Id_Venta, v.Fecha, v.Fecha_Entrega, 
           v.Id_Cliente, v.Id_Sucursal, v.Id_Empleado, 
           v.Id_Producto, v.Precio, v.Cantidad, 2
    FROM venta v
    INNER JOIN (
        SELECT  Id_Producto, (AVG(Cantidad) + 3*STDDEV(Cantidad)) AS max_outlier 
        FROM venta GROUP BY Id_Producto) AS o
    ON v.Id_Producto=o.Id_Producto 
    WHERE v.Cantidad > o.max_outlier OR v.Cantidad < 0;


/* motivo 3 */
SELECT v.* FROM venta v 
INNER JOIN (
    SELECT Id_Producto, (AVG(Precio) + 3*STDDEV(Precio)) AS max_outlier 
    FROM venta GROUP BY Id_Producto) o 
ON v.Id_Producto=o.Id_Producto 
WHERE v.Precio > o.max_outlier OR v.Precio < 0;


INSERT INTO aux_venta 
          (Id_Venta, Fecha, Fecha_Entrega, 
           Id_Cliente, Id_Sucursal, Id_Empleado, 
           Id_Producto, Precio, Cantidad, 
           Motivo)
    SELECT v.Id_Venta, v.Fecha, v.Fecha_Entrega, 
           v.Id_Cliente, v.Id_Sucursal, v.Id_Empleado, 
           v.Id_Producto, v.Precio, v.Cantidad, 3
    FROM venta v
    INNER JOIN (
        SELECT Id_Producto, (AVG(Precio) + 3*STDDEV(Precio)) AS max_outlier 
        FROM venta GROUP BY Id_Producto) o 
    ON v.Id_Producto=o.Id_Producto 
    WHERE v.Precio > o.max_outlier OR v.Precio < 0;


select * from aux_venta where Motivo = 2; -- outliers de cantidad
select * from aux_venta where Motivo = 3; -- outliers de precio


/* excluyendo los outliers del calculo */
ALTER TABLE venta ADD Outlier TINYINT NOT NULL DEFAULT 1 AFTER Cantidad;

UPDATE venta v JOIN aux_venta a
	ON (v.Id_Venta = a.Id_Venta AND a.Motivo IN (2,3))
    SET v.Outlier = 0;


/* Análisis */
SELECT 	co.TipoProducto,
		co.PromedioVentaConOutliers,
        so.PromedioVentaSinOutliers
FROM(
    SELECT 	tp.TipoProducto,
			AVG(v.Precio * v.Cantidad) as PromedioVentaConOutliers
	FROM 	venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto)
			INNER JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
	GROUP BY tp.TipoProducto) co
INNER JOIN(
    SELECT 	tp.TipoProducto,
			AVG(v.Precio * v.Cantidad) as PromedioVentaSinOutliers
	FROM 	venta v JOIN producto p
		ON (v.IdProducto = p.IdProducto and v.Outlier = 1)
			JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
	GROUP BY tp.TipoProducto) so
ON co.TipoProducto = so.TipoProducto;