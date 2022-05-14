USE database_DeepDiveSQL;
-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
/* Tipos de datos */
ALTER TABLE cliente DROP Col10;
UPDATE cliente SET X='0'  WHERE X ='';
UPDATE cliente SET Y='0'  WHERE Y ='';
UPDATE cliente SET X=REPLACE(X,',','.');
UPDATE cliente SET Y=REPLACE(Y,',','.');
ALTER TABLE cliente CHANGE X Longitud decimal(13,10);
ALTER TABLE cliente CHANGE Y Latitud decimal(13,10);

/*Imputar Valores Faltantes*/
UPDATE cliente SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = '' OR ISNULL(Provincia);
UPDATE cliente SET Nombre_Apellido = 'Sin Dato' WHERE TRIM(Nombre_Apellido) = '' OR ISNULL(Nombre_Apellido);
UPDATE cliente SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = '' OR ISNULL(Domicilio);
UPDATE cliente SET Telefono = 'Sin Dato' WHERE TRIM(Telefono) = '' OR ISNULL(Telefono);
UPDATE cliente SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = '' OR ISNULL(Localidad);



-- -----------------------------------------------------
-- Table empleado
-- -----------------------------------------------------
/* Tipos de datos */
ALTER TABLE empleado CHANGE Salario Salario decimal(10,2);
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
ALTER TABLE empleado ADD Id_Sucursal INT AFTER Sucursal;
UPDATE empleado JOIN sucursal
    ON (empleado.Sucursal = sucursal.Sucursal) 
        SET empleado.Id_Sucursal = sucursal.Id_Sucursal;
ALTER TABLE empleado DROP Sucursal;

/*Chequeo de claves duplicadas*/
ALTER TABLE empleado ADD Codigo_Empleado INT NOT null AFTER Id_Empleado;
UPDATE empleado SET Codigo_Empleado=Id_Empleado;
UPDATE empleado SET Id_Empleado=(Id_Sucursal * 1000000) + Codigo_Empleado;



-- -----------------------------------------------------
-- Table producto
-- -----------------------------------------------------
/* Tipos de datos */  
ALTER TABLE producto CHANGE Concepto Producto VARCHAR(100);  
ALTER TABLE empleado CHANGE Salario Salario decimal(12,2);
/*Imputar Valores Faltantes*/
UPDATE producto SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = '' OR ISNULL(Tipo);



-- -----------------------------------------------------
-- Table sucursal
-- -----------------------------------------------------
/* Tipos de datos */    
UPDATE sucursal SET Longitud=REPLACE(Longitud,',','.');
UPDATE sucursal SET Latitud=REPLACE(Latitud,',','.');
ALTER TABLE sucursal CHANGE Longitud Longitud decimal(13,10);
ALTER TABLE sucursal CHANGE Latitud Latitud decimal(13,10);



-- -----------------------------------------------------
-- Table proveedor
-- -----------------------------------------------------
/* Tipos de datos */   
UPDATE proveedor SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = '' OR ISNULL(Nombre);


-- -----------------------------------------------------
-- Table compra
-- -----------------------------------------------------
/* Tipos de datos */    
ALTER TABLE compra CHANGE Precio Precio decimal(10,2);


-- -----------------------------------------------------
-- Table gasto
-- -----------------------------------------------------
/* Tipos de datos */   
ALTER TABLE gasto CHANGE Monto Monto decimal(10,2);


-- -----------------------------------------------------
-- Table tipo_gasto
-- -----------------------------------------------------
/* Tipos de datos */    
ALTER TABLE tipo_gasto CHANGE Monto_Aproximado Monto_Aproximado decimal(10,2);

-- -----------------------------------------------------
-- Table venta
-- -----------------------------------------------------
/*Tabla auxiliar donde se guardarán registros con problemas:
1-Cantidad en Cero
*/
DROP TABLE IF EXISTS aux_venta;
CREATE TABLE IF NOT EXISTS aux_venta (
  Id_Venta		INT,
  Fecha 		DATE NOT NULL,
  Fecha_Entrega DATE NOT NULL,
  Id_Cliente	INT, 
  Id_Sucursal	INT,
  Id_Empleado	INT,
  Id_Producto	INT,
  Precio		VARCHAR(30),
  Cantidad	    VARCHAR(30),
  Motivo		INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO aux_venta 
           (Id_Venta, Fecha, Fecha_Entrega, 
            Id_Cliente, Id_Sucursal, Id_Empleado, 
            Id_Producto,Precio, Cantidad, 
            Motivo)
    SELECT  Id_Venta, Fecha, Fecha_Entrega, 
            Id_Cliente, Id_Sucursal,Id_Empleado, 
            Id_Producto, Precio, 0, 1
    FROM venta 
    WHERE TRIM(Cantidad) = '' or Cantidad is null;


/* limpieza */    
UPDATE venta set Precio = '0' WHERE Precio = '';

UPDATE venta INNER JOIN producto 
    SET venta.Precio = producto.Precio 
        WHERE venta.Id_Producto = producto.Id_Producto AND venta.Precio = '0';
 
/*Imputar Valores Faltantes*/
UPDATE venta SET Cantidad = '1' WHERE TRIM(Cantidad) = '' OR ISNULL(Cantidad);

/* Tipos de datos */    
ALTER TABLE venta CHANGE Precio Precio decimal(13,2);
ALTER TABLE venta CHANGE Cantidad Cantidad INT;

ALTER TABLE aux_venta CHANGE Precio Precio decimal(13,2);
ALTER TABLE aux_venta CHANGE Cantidad Cantidad INT;

