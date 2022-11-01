drop database ventas;
CREATE DATABASE ventas;
USE ventas;

CREATE TABLE cliente (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoria INT
);

CREATE TABLE comercial (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id INT IDENTITY(1,1) PRIMARY KEY,
  total FLOAT NOT NULL,
  fecha DATE,
  id_cliente INT NOT NULL,
  id_comercial INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES('Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES('Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES('Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES('Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES('Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES('María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES('Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES('Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES('Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES('Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES('Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES('Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES('Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES('Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES('Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES('Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES('Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES('Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(2389.23, '2019-03-11', 1, 5);
