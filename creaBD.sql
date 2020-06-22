-- Práctica 3 bases de datos 
-- Alumnos: Damián Maleno y Geovanny Risco
 
-- Creación de la base de datos con MariaDB 
DROP DATABASE IF EXISTS Practica;
CREATE DATABASE Practica;
USE Practica;
 
-- Creación de la tablas
CREATE TABLE Tipo(
    tipo varchar(30),
    CONSTRAINT pk_tipo PRIMARY KEY (tipo)
)ENGINE=InnoDB;
 
CREATE TABLE Juguetes(
    codigo_barras int(6) zerofill auto_increment,
    nombre varchar(25) not null,
    edad_min int(4),
    edad_max int(4),
    precio float(6,2) not null,
    tipo varchar(30) not null,
    complemento_de int(6) zerofill,
    CONSTRAINT pk_juguetes PRIMARY KEY (codigo_barras),
    CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES Tipo(tipo),
    CONSTRAINT fk_complemento FOREIGN KEY (complemento_de) REFERENCES Juguetes(codigo_barras)
)ENGINE=InnoDB;
 
CREATE TABLE Equivalente(
    juguete int(6) zerofill,
    juguete_equivalente int(6) zerofill,
    CONSTRAINT pk_equivalente PRIMARY KEY (juguete,juguete_equivalente),
    CONSTRAINT fk_juguete FOREIGN KEY (juguete) REFERENCES Juguetes(codigo_barras),
    CONSTRAINT fk_juguete_equi FOREIGN KEY (juguete_equivalente) REFERENCES Juguetes(codigo_barras)
)ENGINE=InnoDB;
 
CREATE TABLE Clientes(
    codigo int(6) zerofill,
    nombre varchar(25) not null,
    email varchar(30) not null,
    CONSTRAINT pk_codigo PRIMARY KEY (codigo)
)ENGINE=InnoDB;
 
CREATE TABLE Encargos(
    cod_cliente int(6) zerofill,
    cod_juguete int(6) zerofill,
    data date not null,
    cantidad int(4) not null,
    CONSTRAINT pk_encargos PRIMARY KEY (cod_cliente,cod_juguete),
    CONSTRAINT fk_encargos_cod_cliente FOREIGN KEY (cod_cliente) REFERENCES Clientes(codigo) ON DELETE CASCADE,
    CONSTRAINT fk_encargos_cod_juguete FOREIGN KEY (cod_juguete) REFERENCES Juguetes(codigo_barras) ON DELETE CASCADE,
    CHECK (cantidad>10 AND cantidad<1000)
)ENGINE=InnoDB;
 
CREATE TABLE Facturas(
    cod_cliente int(6) zerofill,
    fecha date,
    cod_juguete int(6) zerofill,
    cantidad int(4) not null,
    precio_unidad float(8,2) not null,
	CONSTRAINT pk_facturas PRIMARY KEY (cod_cliente, fecha, cod_juguete),
    CONSTRAINT fk_facturas_cod_cliente FOREIGN KEY (cod_cliente) REFERENCES Clientes(codigo) ON DELETE CASCADE,
    CONSTRAINT fk_facturas_cod_juguete FOREIGN KEY (cod_juguete) REFERENCES Juguetes(codigo_barras) ON DELETE CASCADE
)ENGINE=InnoDB;
 
 
CREATE TABLE Particulares(
    codigo_p int(6) zerofill,
    telefono varchar(9) unique,
    dni varchar(10),
	CONSTRAINT pk_particulares PRIMARY KEY (codigo_p),
    CONSTRAINT fk_particulares FOREIGN KEY (codigo_p) REFERENCES Clientes(codigo) ON DELETE CASCADE
)ENGINE=InnoDB;
 
CREATE TABLE Empresas(
    codigo_e int(6) zerofill,
    nif varchar(10) unique,
    CONSTRAINT pk_empresas PRIMARY KEY (codigo_e),
	CONSTRAINT fk_empresas FOREIGN KEY (codigo_e) REFERENCES Clientes(codigo) ON DELETE CASCADE
)ENGINE=InnoDB;

 
CREATE TABLE Hijos(
    nombre varchar(25),
    codigo_padre int(6) zerofill not null,
    fecha_nacimiento date,
    CONSTRAINT pk_hijos PRIMARY KEY (nombre),
    CONSTRAINT fk_hijo FOREIGN KEY (codigo_padre) REFERENCES Particulares(codigo_p) ON DELETE CASCADE
)ENGINE=InnoDB;
 
CREATE TABLE Personas_Contacto(
    nombre varchar(25),
    codigo_cont int(6) zerofill not null,
    telefono varchar(9) not null,
    CONSTRAINT pk_personas_contacto PRIMARY KEY (nombre),
    CONSTRAINT fk_personas_contacto_cod FOREIGN KEY (codigo_cont) REFERENCES Particulares(codigo_p) ON DELETE CASCADE
)ENGINE=InnoDB;
 
CREATE TABLE Parentesco(
    cod_particular int(6) zerofill,
    cod_pariente int(6) zerofill,
    grado enum('P','S','T','Q','C') not null,
    CONSTRAINT pk_parentesco PRIMARY KEY (cod_particular,cod_pariente),
    CONSTRAINT fk_parent_particular FOREIGN KEY (cod_particular) REFERENCES Particulares(codigo_p) ON DELETE CASCADE,
    CONSTRAINT fk_parent_pariente FOREIGN KEY (cod_pariente) REFERENCES Particulares(codigo_p) ON DELETE CASCADE,
    check(grado='P' OR grado='S' OR grado='T' OR grado='Q' OR grado='C')
)ENGINE=InnoDB;



DELIMITER $$

-- Herencia total y solapada de Clientes
CREATE PROCEDURE Insertar_cliente (IN codigo int(6), IN nombre varchar(25), IN email varchar(30), IN telefono varchar(9), IN dni varchar(10), IN nif varchar(10))
BEGIN
	INSERT INTO Clientes(codigo,nombre,email) VALUES (codigo,nombre,email);
IF (nif is not NULL) THEN
	INSERT INTO Empresas(codigo_e,nif) VALUES (codigo,nif);
END IF;
IF (telefono is not NULL) THEN
	INSERT INTO Particulares(codigo_p,telefono,dni) VALUES (codigo,telefono,dni);
END IF;
IF (nif is NULL and telefono is NULL) THEN
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Debe de especificar al menos uno de los campos "telefono" para Particular y "nif" para Empresas';
END IF;
END $$


-- La cantidad de encargos tiene que ser superior a 10 e inferior a 1000.
DROP TRIGGER IF EXISTS control_insertar_encargos$$
 
CREATE TRIGGER control_insertar_encargos
BEFORE INSERT ON Encargos
FOR EACH ROW
BEGIN
 
 IF ((NEW.cantidad<11 OR NEW.cantidad>1001) OR NEW.cantidad IS NULL)
 THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='La cantidad de un encargo ha de ser mayor de 10 e inferior a 1000.';
 END IF;
 
END $$

-- El parentesco es un caracter que ha de pertenecer a: {'P', 'S', 'T', 'Q', 'C'}
DROP TRIGGER IF EXISTS control_insertar_parentesco$$
 
CREATE TRIGGER control_insertar_parentesco
BEFORE UPDATE ON Parentesco
FOR EACH ROW
BEGIN
 
 IF ((NEW.grado!='P' AND NEW.grado!='S' AND NEW.grado!='T' AND NEW.grado!='Q' AND NEW.grado!='C') OR NEW.grado IS NULL)
 THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='El grado de parentesco ha de ser P, S, T, Q o C.';
 END IF;
 
END $$


-- Relacion de equivalencia en la tabla Equivalente solo en sentido (A,B). No permitimos (B,A).
DROP TRIGGER IF EXISTS control_insert_equivalente$$

CREATE TRIGGER control_insert_equivalente
BEFORE INSERT ON Equivalente
FOR EACH ROW
BEGIN

 IF ((NEW.juguete IN (SELECT juguete_equivalente FROM Equivalente)) OR (NEW.juguete_equivalente IN (SELECT juguete FROM Equivalente)))
 THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='La relacion de equivalencia ya existe';
 END IF;
 
END $$


-- Al borrar algun particular tambien lo borramos de la tabla Cliente
DROP TRIGGER IF EXISTS borrar_particular$$

CREATE TRIGGER borrar_particular
BEFORE DELETE ON Particulares
FOR EACH ROW
BEGIN
 DELETE FROM Clientes WHERE codigo=old.codigo_p;
END $$

-- Al borrar alguna empresa tambien la borramos de la tabla Cliente
DROP TRIGGER IF EXISTS borrar_empresa$$

CREATE TRIGGER borrar_empresa
BEFORE DELETE ON Empresas
FOR EACH ROW
BEGIN
 DELETE FROM Clientes WHERE codigo=old.codigo_e;
END $$


-- Relacion de equivalencia en la tabla Parentesco solo en sentido (A,B). No permitimos (B,A).
DROP TRIGGER IF EXISTS control_insert_parentesco$$
 
CREATE TRIGGER control_insert_parentesco
BEFORE INSERT ON Parentesco
FOR EACH ROW
BEGIN
 
 IF ((NEW.cod_particular IN (SELECT cod_pariente FROM Parentesco)) OR (NEW.cod_pariente IN (SELECT cod_particular FROM Parentesco)))
 THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='La relacion de parentesco entre los clientes ya existe';
 END IF;
 
END $$
