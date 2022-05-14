USE database_DeepDiveSQL;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\CanalDeVenta.csv'
into table canal_venta
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Clientes.csv'
into table cliente
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\PRODUCTOS.csv'
into table producto
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Empleado.csv'
into table empleado
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Proveedores.csv'
into table proveedor
CHARACTER SET latin1
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Sucursales.csv'
into table sucursal
fields terminated by ';'
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\TiposDeGasto.csv'
into table tipo_gasto
fields terminated by ','
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Compra.csv'
into table compra
fields terminated by ','
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Venta.csv'
into table venta
fields terminated by ','
lines terminated by '\r\n'
IGNORE 1 LINES;

load data infile 'C:\\Users\\ACER\\Desktop\\DataScience-curriculum\\Data Engineer\\Deep Dive SQL\\data\\Gasto.csv'
into table gasto
fields terminated by ','
lines terminated by '\r\n'
IGNORE 1 LINES;