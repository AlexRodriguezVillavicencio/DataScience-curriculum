ALTER TABLE contacts DROP CONSTRAINT fk_customer;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS contacts;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
	  
SELECT * FROM customers;
SELECT * FROM contacts;

-- NO REALIZA LA ACCION:
DELETE FROM customers WHERE customer_id = 1;


--SE ELMINA LA RESTRICCIÓN
ALTER TABLE contacts DROP CONSTRAINT fk_customer;

--SE CREA UNA NUEVA QUE SETEE NULO
ALTER TABLE contacts 
ADD CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE SET NULL;
	  
DELETE FROM customers WHERE customer_id = 1;
SELECT * FROM customers;
SELECT * FROM contacts;

--SE ELMINA LA RESTRICCIÓN
ALTER TABLE contacts DROP CONSTRAINT fk_customer;

--SE CREA UNA NUEVA QUE SE ELIMINE EN CASCADA:
ALTER TABLE contacts 
ADD CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE CASCADE;

INSERT INTO customers(customer_name)
VALUES ('Shark Inc');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(3,'Steve Martin','(408)-222-4444','steven.martin@shark.dev');

--SE ELMINA EL REGISTRO EN LA TABLA customers
DELETE FROM customers WHERE customer_id = 3;

SELECT * FROM customers;
SELECT * FROM contacts;

--SE ELMINA LA RESTRICCIÓN
ALTER TABLE contacts DROP CONSTRAINT fk_customer;

SELECT * FROM customers;
SELECT * FROM contacts;

--SE TRUNCAN LAS TABLAS, SE CREA LA RESTRCCIÓN Y SE VUELVEN A INSERTAR REGISTROS:
TRUNCATE TABLE customers;
TRUNCATE TABLE contacts;

ALTER TABLE contacts 
ADD CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id);
	  
INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC'),
	  ('Shark Inc');	   

SELECT * FROM customers;

INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(4,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (4,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (5,'David Wright','(408)-222-1234','david.wright@dolphin.dev'),
	  (6,'Steve Martin','(408)-222-4444','steven.martin@shark.dev');
	  
SELECT * FROM contacts;

--TRANSACCIONES:
BEGIN;

INSERT INTO customers(customer_name)
VALUES('Octopus Inc');	   

SELECT * FROM customers;

INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(8,'William Willy','(408)-111-1234','william.willy@octopus.dev');

SELECT * FROM customers;

--EJECUTAR LA MISMA CONSULTA TAMBIEN EN OTRA TERMINAL:
SELECT 	c1.customer_id,
		c1.customer_name,
		c2.contact_name,
		c2.phone,
		c2.email
FROM customers c1 JOIN contacts c2
	ON (c1.customer_id = c2.customer_id);

--PROBAR ROLLBACK Y LUEGO COMMIT:
ROLLBACK;
COMMIT;
