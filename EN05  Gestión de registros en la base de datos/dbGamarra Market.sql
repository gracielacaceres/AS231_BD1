/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket; 
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;


/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int auto_increment,
    tipo_documento char(3) not null,
    numero_documento char(9) not null,
    nombres varchar(60) not null,
    apellidos varchar(90) not null,
    email varchar(80),
    celular char(9),
    fecha_nacimiento date not null,
    activo bool default("1"),
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;


/* Agregar columna estado civil */
ALTER TABLE CLIENTE
	ADD COLUMN estado_civil char(1);
/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    id int auto_increment,
    tipo_documento char(3) not null,
    numero_documento char(15) not null,
    nombres varchar(60) not null,
    apellidos varchar(90) not null,
    salario decimal(8,2) not null,
    celular char(9),
    email varchar(80),
    activo bool default("1"),
    CONSTRAINT Vendedor_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN VENDEDOR;

CREATE TABLE VENTA
(
    id int auto_increment,
    fecha_hora timestamp  not null, 
    cliente_id int not null,
    vendedor_id int not null,
    activo bool default("1"),
    CONSTRAINT venta_pk PRIMARY KEY (id)
);
SELECT
*,
now() AS fecha_hora
FROM
VENTA;
/* Listar estructura de tabla Venta */
SHOW COLUMNS IN VENTA;

DROP TABLE VENTA_DETALLE;
CREATE TABLE VENTA_DETALLE
(
    id int auto_increment,
    venta_id int not null,
    prenda_id int not null,
    cantidad int not null,
    CONSTRAINT Venta_detalle PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;

CREATE TABLE PRENDA
(
    id int auto_increment,
    descripcion varchar(90) not null, 
    marca varchar(60) not null,
    cantidad int not null,
    talla varchar(10) not null,
    precio decimal(8,2) not null,
    activo bool default("1"),
    CONSTRAINT Prenda_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN PRENDA;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
ADD COLUMN venta_id int;
ALTER TABLE VENTA_DETALLE
   ADD CONSTRAINT VENTA_VENTA_DETALLE FOREIGN KEY (venta_id)
	references VENTA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();
SHOW COLUMNS IN CLIENTE;
SHOW COLUMNS IN VENTA;
SHOW COLUMNS IN VENTA_DETALLE;
SHOW COLUMNS IN VENDEDOR;
SHOW COLUMNS IN PRENDA;
/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

INSERT INTO cliente
(tipo_documento,numero_documento,nombres,apellidos,email,celular,fecha_nacimiento)
VALUES
('DNI','77889955','Alberto','Solano Pariona','alberto.pariona@empresa.com','998456103', STR_TO_DATE('10/02/1970','%d/%m/%Y')),
('DNI','45781233','Alicia','Garcia Campos','','', STR_TO_DATE('20/03/1980','%d/%m/%Y')),
('CNE','315487922','Juana','Avila Chumpitaz','juana.avila@gmail.com','923568741', STR_TO_DATE('05/06/1986','%d/%m/%Y')),
('CNE','122116633','Ana','Enriquez Flores','ana.enriquez@empresa.com','', STR_TO_DATE('10/02/1970','%d/%m/%Y')),
('CNE','088741589','Claudia','Perales Ortiz','claudia.perales@yahoo.com','997845263', STR_TO_DATE('25/07/1981','%d/%m/%Y')),
('DNI','45122587','Mario','Barrios Martinez','mario.barrios@outlook.com','986525871', STR_TO_DATE('10/10/1987','%d/%m/%Y')),
('CNE','175258564','Brunela','Tarazona Guerra','brunela.tarazona@gamil.com','995236741', STR_TO_DATE('05/06/1990','%d/%m/%Y')),
('DNI','47142536','Alejandro','Jimenez Huapaya','','941525365', STR_TO_DATE('01/06/1989','%d/%m/%Y')),
('DNI','15352585','Claudia','Marquez Litano','claudia.marquez@gmail.com','985814723', STR_TO_DATE('01/10/1991','%d/%m/%Y')),
('CNE','465772587','Mario','Rodriguez Mayo','mario.rodriguez@outlook.com','912662587', STR_TO_DATE('10/11/1987','%d/%m/%Y')),
('CNE','837952514','Luisa','Guerra Ibarra','luisa.guerra','974422136', STR_TO_DATE('21/12/1988','%d/%m/%Y')),
('DNI','74142585','Pedro Al..','Candela Valenzuela','pedro.candela@gmail.com','94148525', STR_TO_DATE('30/06/1995','%d/%m/%Y')),
('DNI','53298147','Angel M..','Rojas Avila','angel.rojas@outlook','', STR_TO_DATE('02/03/1975','%d/%m/%Y')),
('DNI','11453265','Hilario F..','Avila Huapaya','','985515326', STR_TO_DATE('02/05/2000','%d/%m/%Y')),
('CNE','757472186','Octavio..','Marquez Osorio','octavio.marquez@yahoo.es','966232141', STR_TO_DATE('22/09/2000','%d/%m/%Y')),
('CNE','558693219','Manolo E..','Vasquez Saravia','manolo.vasquez@outlook.es','966232141', STR_TO_DATE('22/09/2000','%d/%m/%Y')),
('DNI','41552567','Genovev..','Ortiz Quispe','genovev.ortiz@outlook.es','92564137', STR_TO_DATE('12/04/2003','%d/%m/%Y')),
('DNI','49985471','Oscar C..','Quiroz Zavala','','988223145', STR_TO_DATE('12/10/2004','%d/%m/%Y')),
('DNI','44992217','Veronica','Romero Vargas','veronica.romero@yahoo.com','', STR_TO_DATE('25/08/2002','%d/%m/%Y')),
('DNI','00253641','Eliseo','Prada Ortiz','eliseo.prada@yahoo.com','', STR_TO_DATE('15/09/2004','%d/%m/%Y'));

INSERT INTO vendedor
(tipo_documento,numero_documento,nombres,apellidos,salario,celular,email)
VALUES
('DNI','85471236','Enrique','Perez Manco','1500.00','96521873','enrique.perez@outlook.com'),
('DNI','47259136','Sofia','Avila Solis','1350.00','',''),
('DNI','61542280','Marcela','Napaico Cama','1600.00','96521873','marcela.napaico@gmail.com'),
('CNE','742536140','Carmelo','Rodriguez Chauca','1550.00','','carmelo.rodriguez@yahoo.com');

INSERT INTO prenda
(descripcion,marca,cantidad,talla,precio)
VALUES
('Pantalo Jeans','Levis','60','28','65.80'),
('Camisa manga corta','Adams','75','16','55.00'),
('Polo sport','Australia','100','16','40.00'),
('Camisa manga larga','Newport','150','16','42.50'),
('Pijama para caballero','Adams','180','28','79.50'),
('Corbata','Maxwell','85','16','14.80'),
('Pijama para dama','Adams','170','24','55.50'),
('Pantalo Jeans','Australia','200','28','68.50'),
('Camisa Sport','John Holden','85','16','88.50'),
('Shorts Jeans','Pepe Jeans','185','28','77.20');

INSERT INTO venta
(cliente_id,vendedor_id)
VALUES
('4','1'),
('6','3'),
('10','1'),
('18','4');

INSERT INTO venta_detalle
(venta_id,prenda_id,cantidad)
VALUES
('1','6','3'),
('1','3','5'),
('1','2','7'),
('2','2','3'),
('3','7','4'),
('3','10','6'),
('3','2','6'),
('3','5','7'),
('4','2','4'),
('4','5','3');

SELECT * FROM venta_detalle;
SELECT * FROM cliente;
SELECT * FROM venta;
SELECT * FROM prenda;
SELECT * FROM vendedor;