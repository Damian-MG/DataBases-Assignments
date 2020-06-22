--Práctica3basesdedatos
--Alumnos:DamiánMalenoyGeovannyRisco
--Insercion de tuplas en las diferentes tablas de la base de datos de la práctica

INSERT INTO Tipo(tipo) VALUES ('Construcciones');
INSERT INTO Tipo(tipo) VALUES ('Puzzles');
INSERT INTO Tipo(tipo) VALUES ('Juegosdemesa');
INSERT INTO Tipo(tipo) VALUES ('Deportes');
INSERT INTO Tipo(tipo) VALUES ('Didáctico');
INSERT INTO Tipo(tipo) VALUES ('Informatica');

INSERT INTO Juguetes(codigo_barras,nombre,edad_min,edad_max,precio,tipo,complemento_de)
VALUES(123456,'Pistoladeagua',3,NULL,5.99,'Deportes',NULL);
INSERT INTO Juguetes(codigo_barras,nombre,edad_min,edad_max,precio,tipo,complemento_de)
VALUES(234567,'Dronanfibio',8,NULL,15.99,'Didáctico',NULL);
INSERT INTO Juguetes(codigo_barras,nombre,edad_min,edad_max,precio,tipo,complemento_de)
VALUES(345678,'Scalectrix',6,69,59.99,'Deportes',NULL);
INSERT INTO Juguetes(codigo_barras,nombre,edad_min,edad_max,precio,tipo,complemento_de)
VALUES(456789,'Uno',NULL,NULL,3.99,'Juegosdemesa',NULL);
INSERT INTO Juguetes(codigo_barras,nombre,edad_min,edad_max,precio,tipo,complemento_de)
VALUES(888888,'MacBook Pro',18,NULL,5000,'Informatica',NULL);


INSERT INTO equivalente(juguete,juguete_equivalente) VALUES (234567, 123456); 


CALL Insertar_Cliente(123456,'FranciscoDimitri','dimitri.francisco@gmail.com', '123456789','12345678A', NULL);
CALL Insertar_Cliente(234567,'NuriaLla2','nuria.lla2@gmail.com', '234567890','23456789B', NULL); 
CALL Insertar_Cliente(69,'AliciaJongUn','alicia.jongun@gmail.com', '456789012','45678901D', NULL); 
CALL Insertar_Cliente(1452,'MarcosBerlusconi','marcos.berlusconi@gmail.com', '345678901','34567890C', NULL); 
CALL Insertar_Cliente(23447,'AlbertoNegro','alberto.negro@gmail.com', '567890123','567890123E', NULL); 
CALL Insertar_Cliente(777777, 'Aleix', 'geova@gmail.com', '661731439', '123456789M', NULL);  
CALL Insertar_Cliente(888888, 'Jacinto', 'jacinto@gmail.com', '661242345', '661242345M', NULL);  
CALL Insertar_Cliente(101010, 'Pepe', 'pepe@gmail.com', '634141451', '634141451M', NULL);  
CALL Insertar_Cliente(111112, 'Sami', 'sami.finland@gmail.com', '696969696', '696969696M', NULL);  
CALL Insertar_Cliente(111113, 'Lluca', 'lluca4Life@gmail.com', '645151135', '645525215M', NULL);  
CALL Insertar_Cliente(111114, 'Laplace', 'laplaced@gmail.com', '614435525', '412413414M', NULL);
CALL Insertar_Cliente(111115, 'Fibonacci', 'fibonacci@gmail.com', '123581321', '123581321M', NULL);


CALL Insertar_cliente(111111,'Amazon','amazon@gmail.com', NULL, NULL, '11111111D');
CALL Insertar_cliente(222222,'Aliexpress','aliexpress@gmail.com', NULL, NULL,'22222222D');
CALL Insertar_cliente(333333,'Alibaba','alibaba@gmail.com', NULL, NULL, '3333333D');
CALL Insertar_cliente(444444,'Ebay','ebay@gmail.com', NULL, NULL, '44444444D');
CALL Insertar_cliente(555555,'JuguetesURV','juguetes@urv.com', NULL, NULL, 'B54543443F');
CALL Insertar_cliente(666666,'Megaupload','kingdotcom@mega.com', NULL, NULL, '66666666D');

CALL Insertar_Cliente(999999, 'Empresa', 'particular@empresa.com', '999999999', '99999999M', '99999999M');  



INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (123456,123456,'2020-05-14',20);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (234567,234567,'2020-05-15',25);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (000069,345678,'2020-05-11',30);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (001452,456789,'2020-05-11',40);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (555555,234567,'2017-05-11',14);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (666666,234567,'2012-05-11',14);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (123456,888888,'2018-02-01',11);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (234567,888888,'2018-02-01',11);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (000069,888888,'2018-02-01',11);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (1452,888888,'2018-02-01',11);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (111111,888888,'2018-02-01',11);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (101010,888888,'2017-05-11',14);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (111112,888888,'2018-03-14',20);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (111113,888888,'2010-04-15',25);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (111114,888888,'2019-05-11',30);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (111115,888888,'2018-06-11',40);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (777777,888888,'2017-12-11',14);
INSERT INTO Encargos(cod_cliente,cod_juguete,data,cantidad) VALUES (888888,888888,'2017-12-11',14);


INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (123456,'2020-06-01',123456,20,5.99);
INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (234567,'2020-05-01',234567,25,15.99);
INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (000069,'2019-06-01',345678,30,59.99);
INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (001452,'2028-06-01',456789,40,3.99);
INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (001452,'2018-02-01',888888,11,5000);
INSERT INTO Facturas(cod_cliente,fecha,cod_juguete,cantidad,precio_unidad) VALUES (001452,'2015-02-01',888888,4,5000);


INSERT INTO Hijos(nombre,codigo_padre,fecha_nacimiento) VALUES ('Geovanny',123456,'1996-08-14');
INSERT INTO Hijos(nombre,codigo_padre,fecha_nacimiento) VALUES ('Alexanderr',234567,'1997-08-14');
INSERT INTO Hijos(nombre,codigo_padre,fecha_nacimiento) VALUES ('Ibai',000069,'2006-11-7');
INSERT INTO Hijos(nombre,codigo_padre,fecha_nacimiento) VALUES ('Jotxu',001452,'2006-11-7');

INSERT INTO Personas_Contacto(nombre,codigo_cont,telefono) VALUES ('Agustin',123456,'123456789');
INSERT INTO Personas_Contacto(nombre,codigo_cont,telefono) VALUES ('Alfonso',234567,'234567890');
INSERT INTO Personas_Contacto(nombre,codigo_cont,telefono) VALUES ('Pepe',69,'345678901');
INSERT INTO Personas_Contacto(nombre,codigo_cont,telefono) VALUES ('Martin',1452,'456789012');

INSERT INTO Parentesco(cod_particular,cod_pariente,grado) VALUES (123456,000069,'P');
INSERT INTO Parentesco(cod_particular,cod_pariente,grado) VALUES (234567,000069,'T');
INSERT INTO Parentesco(cod_particular,cod_pariente,grado) VALUES (000069,001452,'Q');
INSERT INTO Parentesco(cod_particular,cod_pariente,grado) VALUES (001452,000069,'Q');








