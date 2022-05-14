select v.Id_producto, v.Precio, p.Id_Producto, p.Precio from venta v 
inner join producto p on v.Id_Producto=p.Id_Producto
where v.Precio = '';


UPDATE venta v 
inner join producto p on v.Id_Producto=p.Id_Producto
SET v.Precio = p.Precio
where v.Precio = '';

<!-- para ver los problemas del pecio de ventas -->
SELECT producto.IdProducto,producto.Precio2, venta.IdProducto,venta.Precio FROM venta INNER JOIN producto 
ON venta.IdProducto = producto.IdProducto WHERE producto.IdProducto='42834';

<!-- -- -----------------------------------------------------
-- Table empleado
-- ----------------------------------------------------- -->
<!-- /* Tipos de datos */ -->
/* vemos que existen solo 251 casos de los 267 que deberian de haber */
--------
```sql 
SELECT e.*, s.Id_Sucursal 
FROM empleado e JOIN sucursal s ON (e.Sucursal = s.Sucursal);
``` 
/* comprobamos las sucursales que no se encuentran por estar mal escritos */
```sql 
select Sucursal 
from empleado where Sucursal NOT IN (select Sucursal from sucursal);
``` 
/* miramos solo las diferentes */
```sql 
select distinct Sucursal 
from empleado where Sucursal NOT IN (select Sucursal from sucursal);
``` 
/* verificamos si existen claves duplicadas */
```sql 
SELECT Id_Empleado, COUNT(*) 
FROM empleado GROUP BY Id_Empleado HAVING COUNT(*) > 1;
``` 
<!-- -- -----------------------------------------------------
-- Table empleado
-- ----------------------------------------------------- -->
<!-- /* Tipos de datos */ -->
/* verificamos si alguna tabla tiene carencia de datos */
```sql 
SELECT * FROM `proveedor` 
WHERE Nombre='' OR Direccion='' OR Ciudad='' OR Estado='' OR Pais='' OR Departamento='';
```
