DROP DATABASE if EXISTS database_DeepDiveSQL;
CREATE DATABASE IF NOT EXISTS database_DeepDiveSQL;
USE database_DeepDiveSQL;
-- -----------------------------------------------------
-- Table canal_venta
-- -----------------------------------------------------
DROP TABLE if EXISTS canal_venta;
CREATE TABLE IF NOT EXISTS canal_venta (
  Codigo INT,
  Descripcion VARCHAR(45)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
DROP TABLE if EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
  Id_Cliente INT,
  Provincia VARCHAR(45),
  Nombre_Apellido VARCHAR(120),
  Domicilio VARCHAR(250),
  Telefono VARCHAR(45),
  Edad VARCHAR(5),
  Localidad VARCHAR(80),
  X VARCHAR(45),
  Y VARCHAR(45),
  Col10 VARCHAR(1)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table empleado
-- -----------------------------------------------------
DROP TABLE if EXISTS empleado;
CREATE TABLE IF NOT EXISTS empleado (
  Id_Empleado INT,
  Apellido VARCHAR(120),
  Nombre VARCHAR(80),
  Sucursal VARCHAR(50),
  Sector VARCHAR(50),
  Cargo VARCHAR(50),
  Salario VARCHAR(30)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table producto
-- -----------------------------------------------------
DROP TABLE if EXISTS producto;
CREATE TABLE IF NOT EXISTS producto (
  Id_Producto INT,
  Concepto VARCHAR(100),
  Tipo VARCHAR(50),
  Precio VARCHAR(30)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table proveedor
-- -----------------------------------------------------
DROP TABLE if EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
  Id_Proveedor INT,
  Nombre VARCHAR(80),
  Direccion VARCHAR(150),
  Ciudad VARCHAR(50),
  Estado VARCHAR(45),
  Pais VARCHAR(45),
  Departamento VARCHAR(80)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table sucursal
-- -----------------------------------------------------
DROP TABLE if EXISTS sucursal;
CREATE TABLE IF NOT EXISTS sucursal (
  Id_Sucursal INT,
  Sucursal VARCHAR(40),
  Direccion VARCHAR(120),
  Localidad VARCHAR(50),
  Provincia VARCHAR(50),
  Latitud VARCHAR(30),
  Longitud VARCHAR(30)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table tipo_gasto
-- -----------------------------------------------------
DROP TABLE if EXISTS tipo_gasto;
CREATE TABLE IF NOT EXISTS tipo_gasto (
  Id_Tipo_Gasto INT,
  Descripcion VARCHAR(50),
  Monto_Aproximado VARCHAR(30)
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table venta
-- -----------------------------------------------------
DROP TABLE if EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
  Id_Venta INT,
  Fecha DATE,
  Fecha_entrega DATE,
  Precio VARCHAR(30),
  Cantidad VARCHAR(30),
  Id_Sucursal INT,
  Id_Producto INT,
  Id_Empleado INT,
  Id_Cliente INT,
  Id_Canal INT
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table gasto
-- -----------------------------------------------------
DROP TABLE if EXISTS gasto;
CREATE TABLE IF NOT EXISTS gasto (
  Id_Gasto INT,
  Fecha DATE,
  Monto VARCHAR(30),
  Id_Tipo_Gasto INT,
  Id_Sucursal INT
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table compra
-- -----------------------------------------------------
DROP TABLE if EXISTS compra;
CREATE TABLE IF NOT EXISTS compra (
  Id_Compra INT,
  Fecha DATE,
  Cantidad INT,
  Precio DOUBLE,
  Id_Producto INT,
  Id_Proveedor INT
) ENGINE=InnoDB DEFAULT charset=utf8mb4 collate=utf8mb4_spanish_ci;