--  ----------------------------------
--      *       * * *     *     *
--    * *       *         * *   *
--      *       * *       *  *  *
--      *       *         *   * *
--      *       *         *     *
--  ----------------------------------
/* COMPROBACIÓN Y CERO CLONACIÓN */
/* HAY UNA CLAVE PRINCIPAL */
/* TODOS LOS ATRIBUTOS SON ATOMICOS */
/* NO DEBE DE HABER VALORES NULOS */

-- -----------------------------------------------------
-- Table axiliar_localidad temp
-- -----------------------------------------------------
DROP TABLE IF EXISTS aux_localidad;
CREATE TABLE IF NOT EXISTS aux_localidad (
	Localidad_Original	VARCHAR(80),
	Provincia_Original	VARCHAR(50),
	Localidad_Normalizada	VARCHAR(80),
	Provincia_Normalizada	VARCHAR(50),
	Id_Localidad			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO aux_localidad 
    (Localidad_Original, Provincia_Original, Localidad_Normalizada, Provincia_Normalizada, Id_Localidad) 
    SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM cliente UNION 
    SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM sucursal UNION 
    SELECT DISTINCT Ciudad, Estado, Ciudad, Estado, 0 FROM proveedor 
    ORDER BY 2, 1;

UPDATE aux_localidad SET Provincia_Normalizada = 'Buenos Aires'
WHERE Provincia_Original IN ('B. Aires',
                            'B.Aires',
                            'Bs As',
                            'Bs.As.',
                            'Buenos Aires',
                            'C Debuenos Aires',
                            'Caba',
                            'Ciudad De Buenos Aires',
                            'Pcia Bs As',
                            'Prov De Bs As.',
                            'Provincia De Buenos Aires');
							
UPDATE aux_localidad SET Localidad_Normalizada = 'Capital Federal'
WHERE Localidad_Original IN ('Boca De Atencion Monte Castro',
                            'Caba',
                            'Cap.   Federal',
                            'Cap. Fed.',
                            'Capfed',
                            'Capital',
                            'Capital Federal',
                            'Cdad De Buenos Aires',
                            'Ciudad De Buenos Aires')
AND Provincia_Normalizada = 'Buenos Aires';
							
UPDATE aux_localidad SET Localidad_Normalizada = 'Córdoba'
WHERE Localidad_Original IN ('Coroba',
                            'Cordoba',
							'Cã³rdoba')
AND Provincia_Normalizada = 'Córdoba';


--  ----------------------------------
--      *       * * *     *     *
--    *   *     *         * *   *
--       *      * *       *  *  *
--      *       *         *   * *
--     * * *    *         *     *
--  ----------------------------------
/* DIVIDE Y VENCERÁS */
-- -----------------------------------------------------
-- Table localidad and provincia
-- -----------------------------------------------------
DROP TABLE IF EXISTS localidad;
CREATE TABLE IF NOT EXISTS localidad (
  Id_Localidad int(11) NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  Localidad varchar(80) NOT NULL,
  Provincia varchar(80) NOT NULL,
  Id_Provincia int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS provincia;
CREATE TABLE IF NOT EXISTS provincia (
  Id_Provincia int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Provincia varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- llenando las tablas de localidad y provincia
INSERT INTO Localidad (Localidad, Provincia, Id_Provincia)
    SELECT	DISTINCT Localidad_Normalizada, Provincia_Normalizada, 0
    FROM aux_localidad
    ORDER BY Provincia_Normalizada, Localidad_Normalizada;
INSERT INTO provincia (Provincia)
    SELECT DISTINCT Provincia_Normalizada
    FROM aux_localidad
    ORDER BY Provincia_Normalizada;

UPDATE localidad l JOIN provincia p
	ON (l.Provincia = p.Provincia)
    SET l.Id_Provincia = p.Id_Provincia;
UPDATE aux_localidad a JOIN localidad l 
	ON (l.Localidad = a.Localidad_Normalizada
    AND a.Provincia_Normalizada = l.Provincia)
    SET a.Id_Localidad = l.Id_Localidad;

--  ----------------------------------
--     ***      * * *     *     *
--        *     *         * *   *
--      **      * *       *  *  *
--        *     *         *   * *
--     ***      *         *     *
--  ----------------------------------
/* EL IMPOSTOR */
-- limpiando las tablas cliente, proveedor y sucursal
ALTER TABLE cliente ADD Id_Localidad INT NOT NULL DEFAULT '0' AFTER Localidad;
ALTER TABLE proveedor ADD Id_Localidad INT NOT NULL DEFAULT '0' AFTER Departamento;
ALTER TABLE sucursal ADD Id_Localidad INT NOT NULL DEFAULT '0' AFTER Provincia;

UPDATE cliente c INNER JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
    SET c.Id_Localidad = a.Id_Localidad;

UPDATE sucursal s INNER JOIN aux_localidad a
	ON (s.Provincia = a.Provincia_Original AND s.Localidad = a.Localidad_Original)
    SET s.Id_Localidad = a.Id_Localidad;

UPDATE proveedor p INNER JOIN aux_localidad a
	ON (p.Estado = a.Provincia_Original AND p.Ciudad = a.Localidad_Original)
    SET p.Id_Localidad = a.Id_Localidad;


ALTER TABLE cliente
  DROP Provincia,
  DROP Localidad;
ALTER TABLE proveedor
  DROP Ciudad,
  DROP Estado,
  DROP Pais,
  DROP Departamento;
ALTER TABLE sucursal
  DROP Localidad,
  DROP Provincia;
ALTER TABLE localidad
  DROP Provincia;
DROP TABLE if EXISTS aux_localidad;








--  ----------------------------------
--     ***      * * *     *     *
--        *     *         * *   *
--      **      * *       *  *  *
--        *     *         *   * *
--     ***      *         *     *
--  ----------------------------------
/* EL IMPOSTOR */

-- -----------------------------------------------------
-- Table empleado
-- -----------------------------------------------------
DROP TABLE IF EXISTS sector;
CREATE TABLE IF NOT EXISTS sector (
  Id_Sector int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Sector varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
DROP TABLE IF EXISTS cargo;
CREATE TABLE IF NOT EXISTS cargo (
  Id_Cargo int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Cargo varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- insertar valores en la tablas creadas
---------------SELECT DISTINCT Sector FROM empleado;
INSERT INTO sector(Sector) SELECT DISTINCT Sector FROM empleado ORDER BY Sector;
INSERT INTO cargo(Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY Cargo;
ALTER TABLE empleado 
    ADD Id_Sector INT NOT NULL DEFAULT '0' AFTER Id_Sucursal, 
	ADD Id_Cargo INT NOT NULL DEFAULT '0' AFTER Id_Sector;

UPDATE empleado JOIN cargo  
    SET empleado.Id_Cargo = Cargo.Id_Cargo
    WHERE cargo.Cargo = empleado.Cargo;

UPDATE empleado JOIN sector 
    SET empleado.Id_Sector = Sector.Id_Sector 
    WHERE sector.Sector = empleado.Sector;

ALTER TABLE empleado DROP Cargo, DROP Sector;




-- -----------------------------------------------------
-- Table producto
-- -----------------------------------------------------

DROP TABLE IF EXISTS tipo_producto;
CREATE TABLE IF NOT EXISTS tipo_producto (
  Id_Tipo_Producto int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Tipo_Producto varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO tipo_producto(Tipo_Producto) SELECT DISTINCT Tipo FROM producto ORDER BY 1;
ALTER TABLE producto ADD Id_Tipo_Producto INT NOT NULL AFTER Tipo;
UPDATE producto INNER JOIN tipo_producto
	SET producto.Id_Tipo_Producto = tipo_producto.Id_Tipo_Producto
    WHERE producto.Tipo = tipo_producto.Tipo_Producto;
ALTER TABLE producto DROP Tipo;












