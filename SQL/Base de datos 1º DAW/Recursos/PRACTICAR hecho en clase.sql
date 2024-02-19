// BD FUTBOLISTAS CON PESO BD FUTBOLISTAS CON PESO BD FUTBOLISTAS CON PESO BD FUTBOLISTAS CON PESO BD FUTBOLISTAS CON PESO
ALTER SESSION SET nls_date_format='DD-MM-YYYY HH24:MI:SS';
DROP TABLE FUTBOLISTAS CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS CASCADE CONSTRAINTS;
DROP TABLE PARTIDOS CASCADE CONSTRAINTS;

CREATE TABLE FUTBOLISTAS(
ID CHAR(6) PRIMARY KEY CHECK( REGEXP_LIKE( ID, 'F[0-9][0-9][0-9]20' )),
NOMBRE VARCHAR(100),
APELLIDOS VARCHAR(300),
FECHA_NACIMIENTO DATE,
POSICION VARCHAR(50) CHECK( POSICION LIKE 'PORTERO' OR POSICION LIKE 'DEFENSA' OR POSICION LIKE 'MEDIOCENTRO' OR POSICION LIKE 'DELANTERO' ),
SALARIO NUMBER(12,2) CHECK( SALARIO > 50000),
ID_EQUIPO INT
);

CREATE TABLE EQUIPOS(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(100),
ESTADIO VARCHAR(100),
PRESUPUESTO NUMBER(20,2)
);

CREATE TABLE PARTIDOS(
ID INT PRIMARY KEY,
ARBITRO VARCHAR(200),
RESULTADO VARCHAR(5) CHECK( REGEXP_LIKE( RESULTADO, '[0-9][0-9]-[0-9][0-9]' )),
ESTADIO VARCHAR(100),
FECHA DATE,
ID_EQUIPO_CASA INT,
ID_EQUIPO_FUERA INT
);

ALTER TABLE FUTBOLISTAS
ADD CHECK (FECHA_NACIMIENTO > '31/DEC/1974');
ALTER TABLE FUTBOLISTAS
ADD FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID);

ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS(ID);
ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS(ID);

DELETE FROM EQUIPOS;
INSERT INTO EQUIPOS VALUES (1,'EQUIPO A', 'ESTADIO A',1000000);
INSERT INTO EQUIPOS VALUES (2,'EQUIPO B', 'ESTADIO B',2000000);
INSERT INTO EQUIPOS VALUES (3,'EQUIPO C', 'ESTADIO C',3000000);

DELETE FROM FUTBOLISTAS;
INSERT INTO FUTBOLISTAS VALUES ('F00120','PEDRO','GOMEZ','22/01/1980','PORTERO',100000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00220','PEDRO LUIS','GOMEZ','20/04/1985','DEFENSA',110000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00320','LUIS','GALVEZ','12/01/1990','DELANTERO',80000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00420','ANTONIO','DOMINGUEZ','25/06/1981','PORTERO',340000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00520','JESUS','FERNANDEZ','02/01/1995','MEDIOCENTRO',140000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00620','DIEGO','DIAZ','05/04/1987','PORTERO',160000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00720','PABLO','CARO','27/01/1988','DEFENSA',200000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00820','ESTEBAN','BENITEZ','29/09/2000','DEFENSA',300000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00920','ENRIQUE','ALVAREZ','30/09/2001','MEDIOCENTRO',120000,3);

DELETE FROM PARTIDOS;
INSERT INTO PARTIDOS VALUES (1,'ARBITRO A','00-00','ESTADIO A','01/01/2020',1,2);
INSERT INTO PARTIDOS VALUES (2,'ARBITRO B','01-00','ESTADIO A','08/01/2020',1,3);
INSERT INTO PARTIDOS VALUES (3,'ARBITRO C','01-01','ESTADIO B','15/01/2020',2,3);
INSERT INTO PARTIDOS VALUES (4,'ARBITRO B','02-00','ESTADIO B','22/01/2020',2,1);
INSERT INTO PARTIDOS VALUES (5,'ARBITRO A','04-01','ESTADIO C','29/01/2020',3,1);
INSERT INTO PARTIDOS VALUES (6,'ARBITRO A','03-03','ESTADIO C','05/02/2020',3,2);

UPDATE FUTBOLISTAS SET ID_EQUIPO = 2 WHERE ID LIKE 'F00120';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 3 WHERE ID LIKE 'F00420';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 1 WHERE ID LIKE 'F00920';

DELETE FROM FUTBOLISTAS WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';

ALTER TABLE FUTBOLISTAS
ADD ALTURA INT;
ALTER TABLE FUTBOLISTAS
ADD PESO NUMBER(4,1);
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE 'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

// BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT BD EMP-DEPT

DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE emp CASCADE CONSTRAINTS;
create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  job      varchar2(9),
  mgr      number(4,0),
  hiredate date,
  sal      number(7,2),
  comm     number(7,2),
  deptno   number(2,0),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);

// BD FABRICANTES-ART�CULOS BD FABRICANTES-ART�CULOS BD FABRICANTES-ART�CULOS BD FABRICANTES-ART�CULOS BD FABRICANTES-ART�CULOS

drop table fabricantes cascade constraints;
drop table articulos cascade constraints;

create table fabricantes(
    codigo int primary key,
    nombre varchar(100)
);

create table articulos(
    codigo int primary key,
    nombre varchar(100),
    precio int,
    fabricante int
);

alter table articulos
    add constraint fk_fabricante_articulos 
    foreign key (fabricante)
    references fabricantes(codigo);
    
insert into fabricantes values (1,'LG');
insert into fabricantes values (2,'SAMSUNG');
insert into fabricantes values (3,'SIEMENS');
insert into fabricantes values (4,'SONY');

insert into articulos values (1, 'RADIO', 180, 1);
insert into articulos values (2, 'RADIO', 100, 2);
insert into articulos values (3, 'RADIO', 70, 3);
insert into articulos values (4, 'RADIO', 50, 4);
insert into articulos values (5, 'TELEVISION', 320, 1);
insert into articulos values (6, 'TELEVISION', 850, 2);
insert into articulos values (7, 'TELEVISION', 600, 3);
insert into articulos values (8, 'TELEVISION', 170, 4);

// BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE BD RESTAURANTE

drop table platos cascade constraints;
drop table ingredientes cascade constraints;
drop table ingredientes_platos cascade constraints;
drop table clientes cascade constraints;
drop table comandas cascade constraints;
create table platos (
    id int primary key,
    nombre varchar(100) not null,
    precio number(6,2),
    tiempo_preparacion int
);
create table ingredientes(
    id int primary key,
    nombre varchar(100) not null,
    categoria varchar(30) check(categoria in ('CARNE','PESCADO','CONDIMENTO','FRUTA','VERDURA','LACTEO','BEBIDA','LEGUMBRE','OTRO')),
    estado varchar(30) check( estado in ('SOLIDO','LIQUIDO'))
);
create table ingredientes_platos(
    id_ingrediente int,
    id_plato int,
    cantidad int
);
alter table ingredientes_platos
add foreign key (id_ingrediente) references ingredientes(id);
alter table ingredientes_platos
add foreign key (id_plato) references platos(id);
create table clientes(
    id int primary key,
    nombre varchar(100) not null,
    telefono varchar(10),
    localidad varchar(100) not null
);
create table comandas(
    id int primary key,
    mesa int,
    id_cliente int,
    id_plato int,
    estado varchar(30) check( estado in ('COCINA','SERVIDO','COBRADO','DEVUELTO')),
    fecha date,
    hora char(5)
);
alter table comandas
add foreign key (id_cliente) references clientes(id);
alter table comandas
add foreign key (id_plato) references platos(id);

insert into platos values (1,'Plato Arroz caldoso',12.50,25);
insert into platos values (2,'Plato Calamares con patatas',7.50,15);
insert into platos values (3,'Entrante bacalao en aceite',4.50,10);
insert into platos values (4,'Entrante Crema de zanahorias',3,10);
insert into platos values (5,'Tarta de queso',5.50,10);

insert into ingredientes values (1,'Ajo','VERDURA','SOLIDO');
insert into ingredientes values (2,'Aceite de oliva virgen extra','CONDIMENTO','LIQUIDO');
insert into ingredientes values (3,'Cebolla','VERDURA','SOLIDO');
insert into ingredientes values (4,'Calamar','PESCADO','SOLIDO');
insert into ingredientes values (5,'Patata','VERDURA','SOLIDO');
insert into ingredientes values (6,'Pimiento','VERDURA','SOLIDO');
insert into ingredientes values (7,'Vino blanco','BEBIDA','LIQUIDO');
insert into ingredientes values (8,'Sal','CONDIMENTO','SOLIDO');
insert into ingredientes values (9,'Pimienta','CONDIMENTO','SOLIDO');
insert into ingredientes values (10,'Costilla de cerdo','CARNE','SOLIDO');
insert into ingredientes values (11,'Guisante','VERDURA','SOLIDO');
insert into ingredientes values (12,'Tomate','VERDURA','SOLIDO');
insert into ingredientes values (13,'Pimenton dulce','CONDIMENTO','SOLIDO');
insert into ingredientes values (14,'Agua','BEBIDA','LIQUIDO');
insert into ingredientes values (15,'Caldo de ave','BEBIDA','LIQUIDO');
insert into ingredientes values (16,'Arroz','LEGUMBRE','SOLIDO');
insert into ingredientes values (17,'Bacalao','PESCADO','SOLIDO');
insert into ingredientes values (18,'Guindilla','CONDIMENTO','SOLIDO');
insert into ingredientes values (19,'Perejil','CONDIMENTO','SOLIDO');
insert into ingredientes values (20,'Zanahoria','VERDURA','SOLIDO');
insert into ingredientes values (21,'Caldo de verduras','CONDIMENTO','LIQUIDO');
insert into ingredientes values (22,'Nata liquida','LACTEO','LIQUIDO');
insert into ingredientes values (23,'Queso mascarpone','LACTEO','SOLIDO');
insert into ingredientes values (24,'Leche','LACTEO','SOLIDO');
insert into ingredientes values (25,'Esencia vainilla','CONDIMENTO','LIQUIDO');
insert into ingredientes values (26,'Huevo','OTRO','SOLIDO');
insert into ingredientes values (27,'Harina','OTRO','SOLIDO');
insert into ingredientes values (28,'Frutos rojos','FRUTA','SOLIDO');

insert into ingredientes_platos values (1,1,3);
insert into ingredientes_platos values (2,1,30);
insert into ingredientes_platos values (10,1,300);
insert into ingredientes_platos values (11,1,60);
insert into ingredientes_platos values (12,1,40);
insert into ingredientes_platos values (13,1,5);
insert into ingredientes_platos values (14,1,250);
insert into ingredientes_platos values (15,1,400);
insert into ingredientes_platos values (6,1,80);
insert into ingredientes_platos values (8,1,10);
insert into ingredientes_platos values (16,1,150);
insert into ingredientes_platos values (4,2,400);
insert into ingredientes_platos values (2,2,40);
insert into ingredientes_platos values (3,2,100);
insert into ingredientes_platos values (1,2,10);
insert into ingredientes_platos values (5,2,120);
insert into ingredientes_platos values (6,2,80);
insert into ingredientes_platos values (7,2,120);
insert into ingredientes_platos values (8,2,12);
insert into ingredientes_platos values (9,2,8);
insert into ingredientes_platos values (17,3,125);
insert into ingredientes_platos values (1,3,5);
insert into ingredientes_platos values (18,3,2);
insert into ingredientes_platos values (2,3,20);
insert into ingredientes_platos values (19,3,2);
insert into ingredientes_platos values (3,4,25);
insert into ingredientes_platos values (20,4,60);
insert into ingredientes_platos values (21,4,250);
insert into ingredientes_platos values (22,4,50);
insert into ingredientes_platos values (8,4,5);
insert into ingredientes_platos values (9,4,5);
insert into ingredientes_platos values (2,4,15);
insert into ingredientes_platos values (2,5,3);
insert into ingredientes_platos values (23,5,60);
insert into ingredientes_platos values (24,5,20);
insert into ingredientes_platos values (25,5,1);
insert into ingredientes_platos values (26,5,10);
insert into ingredientes_platos values (27,5,10);
insert into ingredientes_platos values (28,5,20);

insert into clientes values (1,'Pedro Juan','111222333','Bormujos');
insert into clientes values (2,'Jose Miguel','222333444','Bormujos');
insert into clientes values (3,'Maria','333444555','Gines');

insert into comandas values (1,1,1,3,'COCINA','01-03-2021','21:00');
insert into comandas values (2,1,1,1,'COCINA','01-03-2021','21:00');
insert into comandas values (3,2,2,3,'COCINA','01-03-2021','21:05');
insert into comandas values (4,2,2,4,'COCINA','01-03-2021','21:05');
insert into comandas values (5,1,1,3,'SERVIDO','01-03-2021','21:10');
insert into comandas values (6,2,2,3,'SERVIDO','01-03-2021','21:15');
insert into comandas values (7,2,2,4,'SERVIDO','01-03-2021','21:16');
insert into comandas values (8,2,2,2,'COCINA','01-03-2021','21:16');
insert into comandas values (9,1,1,1,'SERVIDO','01-03-2021','21:25');
insert into comandas values (10,1,1,5,'COCINA','01-03-2021','21:25');
insert into comandas values (11,2,2,5,'COCINA','01-03-2021','21:26');
insert into comandas values (12,2,2,2,'SERVIDO','01-03-2021','21:35');
insert into comandas values (13,1,1,5,'SERVIDO','01-03-2021','21:37');
insert into comandas values (14,2,2,5,'SERVIDO','01-03-2021','21:38');
insert into comandas values (15,1,1,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (16,1,1,1,'COBRADO','01-03-2021','21:50');
insert into comandas values (17,1,1,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (18,1,2,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (19,1,2,4,'COBRADO','01-03-2021','21:50');
insert into comandas values (20,1,2,2,'COBRADO','01-03-2021','21:50');
insert into comandas values (21,1,2,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (22,1,3,3,'COCINA','02-03-2021','21:05');
insert into comandas values (23,1,3,1,'COCINA','02-03-2021','21:10');
insert into comandas values (24,1,3,2,'COCINA','02-03-2021','21:12');
insert into comandas values (25,1,3,1,'DEVUELTO','02-03-2021','21:12');
insert into comandas values (26,1,3,3,'SERVIDO','02-03-2021','21:15');
insert into comandas values (27,1,3,2,'SERVIDO','02-03-2021','21:27');
insert into comandas values (28,1,3,5,'COCINA','02-03-2021','21:27');
insert into comandas values (29,1,3,5,'SERVIDO','02-03-2021','21:37');
insert into comandas values (30,1,3,3,'COBRADO','02-03-2021','21:55');
insert into comandas values (31,1,3,2,'COBRADO','02-03-2021','21:55');
insert into comandas values (32,1,3,5,'COBRADO','02-03-2021','21:55');

// BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023 BD FUTBOLISTAS 2023

DROP TABLE FUTBOLISTAS_2023 CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS_2023 CASCADE CONSTRAINTS;
DROP TABLE PARTIDOS_2023 CASCADE CONSTRAINTS;

CREATE TABLE FUTBOLISTAS_2023(
ID CHAR(6) PRIMARY KEY CHECK( REGEXP_LIKE( ID, 'F[0-9][0-9][0-9]20' )),
NOMBRE VARCHAR(100),
APELLIDOS VARCHAR(300),
FECHA_NACIMIENTO DATE,
POSICION VARCHAR(50) CHECK( POSICION LIKE 'PORTERO' OR POSICION LIKE 'DEFENSA' OR POSICION LIKE 'MEDIOCENTRO' OR POSICION LIKE 'DELANTERO' ),
SALARIO NUMBER(12,2) CHECK( SALARIO > 50000),
ID_EQUIPO INT
);

CREATE TABLE EQUIPOS_2023(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(100),
ESTADIO VARCHAR(100),
PRESUPUESTO NUMBER(20,2)
);

CREATE TABLE PARTIDOS_2023(
ID INT PRIMARY KEY,
ARBITRO VARCHAR(200),
RESULTADO VARCHAR(5) CHECK( REGEXP_LIKE( RESULTADO, '[0-9][0-9]-[0-9][0-9]' )),
ESTADIO VARCHAR(100),
FECHA DATE,
ID_EQUIPO_CASA INT,
ID_EQUIPO_FUERA INT
);

ALTER TABLE FUTBOLISTAS_2023
ADD CHECK (FECHA_NACIMIENTO > '31/DEC/1974');
ALTER TABLE FUTBOLISTAS_2023
ADD FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS_2023(ID);

ALTER TABLE PARTIDOS_2023
ADD FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS_2023(ID);
ALTER TABLE PARTIDOS_2023
ADD FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS_2023(ID);

DELETE FROM EQUIPOS_2023;
INSERT INTO EQUIPOS_2023 VALUES (1,'EQUIPO A', 'ESTADIO A',1000000);
INSERT INTO EQUIPOS_2023 VALUES (2,'EQUIPO B', 'ESTADIO B',2000000);
INSERT INTO EQUIPOS_2023 VALUES (3,'EQUIPO C', 'ESTADIO C',3000000);

DELETE FROM FUTBOLISTAS_2023;
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00120','PEDRO','GOMEZ','22/01/1980','PORTERO',100000,1);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00220','PEDRO LUIS','GOMEZ','20/04/1985','DEFENSA',110000,1);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00320','LUIS','GALVEZ','12/01/1990','DELANTERO',80000,1);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00420','ANTONIO','DOMINGUEZ','25/06/1981','PORTERO',340000,2);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00520','JESUS','FERNANDEZ','02/01/1995','MEDIOCENTRO',140000,2);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00620','PABLO','GOMEZ','05/04/1987','PORTERO',160000,2);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00720','PABLO','GUTIERREZ','27/01/1988','DEFENSA',200000,3);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00820','PEPE','ALVAREZ','29/09/2000','DEFENSA',300000,3);
INSERT INTO FUTBOLISTAS_2023 VALUES ('F00920','LUIS ANTONIO','ANTUNEZ','30/09/2001','MEDIOCENTRO',120000,3);

DELETE FROM PARTIDOS_2023;
INSERT INTO PARTIDOS_2023 VALUES (1,'ARBITRO A','00-00','ESTADIO A','01/01/2023',1,2);
INSERT INTO PARTIDOS_2023 VALUES (2,'ARBITRO B','01-00','ESTADIO A','08/01/2023',1,3);
INSERT INTO PARTIDOS_2023 VALUES (3,'ARBITRO C','01-01','ESTADIO B','15/01/2023',2,3);
INSERT INTO PARTIDOS_2023 VALUES (4,'ARBITRO B','02-00','ESTADIO B','22/01/2023',2,1);
INSERT INTO PARTIDOS_2023 VALUES (5,'ARBITRO A','04-01','ESTADIO C','29/01/2023',3,1);
INSERT INTO PARTIDOS_2023 VALUES (6,'ARBITRO A','03-03','ESTADIO C','05/02/2023',3,2);

UPDATE FUTBOLISTAS_2023 SET ID_EQUIPO = 2 WHERE ID LIKE 'F00120';
UPDATE FUTBOLISTAS_2023 SET ID_EQUIPO = 3 WHERE ID LIKE 'F00420';
UPDATE FUTBOLISTAS_2023 SET ID_EQUIPO = 1 WHERE ID LIKE 'F00920';

DELETE FROM FUTBOLISTAS_2023 WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';

INSERT INTO futbolistas VALUES ('F11120','NOMBRE','APELL',null,'PORTERO',3000000,null,180,83);
INSERT INTO equipos VALUES (4,'REAL BETIS BALOMPIE','BENITO VILLAMARIN',80000000);

// BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL BD EXAMEN EN PAPEL

DROP TABLE PRODUCTOS CASCADE CONSTRAINTS;
DROP TABLE CLIENTES CASCADE CONSTRAINTS;
DROP TABLE PROVEEDORES CASCADE CONSTRAINTS;
DROP TABLE COMPRAS CASCADE CONSTRAINTS;

CREATE TABLE PRODUCTOS(
    REF INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    TIPO VARCHAR(50) CHECK (TIPO IN ('ANILLO','PULSERA','COLGANTE','PENDIENTE')),
    PRECIO NUMBER(6,2),
    PROVEEDOR INT
);
CREATE TABLE CLIENTES(
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    CP INT
);
CREATE TABLE PROVEEDORES(
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    TFNO INT
);
CREATE TABLE COMPRAS(
    REF INT PRIMARY KEY,
    CLIENTE INT,
    PRODUCTO INT,
    FECHA DATE,
    PAGO VARCHAR(50) CHECK (PAGO IN ('METALICO','TARJETA'))
);
ALTER TABLE PRODUCTOS
ADD FOREIGN KEY (PROVEEDOR) REFERENCES PROVEEDORES(ID);
ALTER TABLE COMPRAS
ADD FOREIGN KEY (CLIENTE) REFERENCES CLIENTES(ID);
ALTER TABLE COMPRAS
ADD FOREIGN KEY (PRODUCTO) REFERENCES PRODUCTOS(REF);

INSERT INTO PROVEEDORES VALUES (1,'METALES S.L.',123456789);
INSERT INTO PROVEEDORES VALUES (2,'TODO PLATA',111111222);
INSERT INTO PROVEEDORES VALUES (3,'AROS',NULL);
INSERT INTO PRODUCTOS VALUES (1,'MOON','ANILLO',50,1);
INSERT INTO PRODUCTOS VALUES (2,'MARTE','PULSERA',75,1);
INSERT INTO PRODUCTOS VALUES (3,'MOON','COLGANTE',45.49,3);
INSERT INTO PRODUCTOS VALUES (4,'JUPITER','PENDIENTE',179.99,2);
INSERT INTO PRODUCTOS VALUES (5,'ESTRELLAS','PENDIENTE',15.50,1);
INSERT INTO PRODUCTOS VALUES (6,'COMETA','PENDIENTE',79.99,2);
INSERT INTO PRODUCTOS VALUES (7,'FUGAZ','ANILLO',399.99,2);
INSERT INTO CLIENTES VALUES (1,'PEDRO ALVAREZ',41110);
INSERT INTO CLIENTES VALUES (2,'GRACIA GOMEZ',41930);
INSERT INTO CLIENTES VALUES (3,'LUISA GUTIERREZ',41930);
INSERT INTO CLIENTES VALUES (4,'ANTONIO ALVAREZ',41927);
INSERT INTO CLIENTES VALUES (5,'ANA GARCIA',41930);
INSERT INTO CLIENTES VALUES (6,'MARIO GARCIA',41010);
INSERT INTO COMPRAS VALUES (1,1,1,'02/09/2022','METALICO');
INSERT INTO COMPRAS VALUES (2,2,4,'11/11/2022','METALICO');
INSERT INTO COMPRAS VALUES (3,3,4,'01/01/2023','TARJETA');
INSERT INTO COMPRAS VALUES (4,5,5,'22/06/2023','METALICO');
INSERT INTO COMPRAS VALUES (5,1,2,'02/09/2023','METALICO');
INSERT INTO COMPRAS VALUES (6,1,3,'12/10/2023','TARJETA');
INSERT INTO COMPRAS VALUES (7,5,6,'15/10/2023','TARJETA');
INSERT INTO COMPRAS VALUES (8,4,7,'07/11/2023','METALICO');
INSERT INTO COMPRAS VALUES (9,6,2,'28/12/2023','METALICO');
INSERT INTO COMPRAS VALUES (10,2,3,'02/02/2024','TARJETA');

// BD JARDINERIA BD JARDINERIA BD JARDINERIA BD JARDINERIA BD JARDINERIA BD JARDINERIA BD JARDINERIA BD JARDINERIA


CREATE TABLE oficina (
  codigo_oficina VARCHAR(10) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  descripcion_texto VARCHAR(250),
  descripcion_html VARCHAR(250),
  imagen VARCHAR(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios VARCHAR(250),
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25) NULL,
  proveedor VARCHAR(50) DEFAULT NULL,
  descripcion VARCHAR(2000) NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
-- Datos
INSERT INTO oficina VALUES ('BCN-ES','Barcelona','Espa�a','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
INSERT INTO oficina VALUES ('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102');
INSERT INTO oficina VALUES ('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
INSERT INTO oficina VALUES ('MAD-ES','Madrid','Espa�a','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32','');
INSERT INTO oficina VALUES ('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans','');
INSERT INTO oficina VALUES ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
INSERT INTO oficina VALUES ('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');
INSERT INTO oficina VALUES ('TAL-ES','Talavera de la Reina','Espa�a','Castilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5� piso (exterior)');
INSERT INTO oficina VALUES ('TOK-JP','Tokyo','Jap�n','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho','');

INSERT INTO empleado VALUES (1,'Marcos','Maga�a','Perez','3897','marcos@jardineria.es','TAL-ES',NULL,'Director General');
INSERT INTO empleado VALUES (2,'Ruben','L�pez','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing');
INSERT INTO empleado VALUES (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','TAL-ES',2,'Subdirector Ventas');
INSERT INTO empleado VALUES (4,'Maria','Sol�s','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria');
INSERT INTO empleado VALUES (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina');
INSERT INTO empleado VALUES (8,'Mariano','L�pez','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (9,'Lucio','Campoamor','Mart�n','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (10,'Hilario','Rodriguez','Huertas','2444','hrodriguez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (11,'Emmanuel','Maga�a','Perez','2518','manu@jardineria.es','BCN-ES',3,'Director Oficina');
INSERT INTO empleado VALUES (12,'Jos� Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (13,'David','Palma','Aceituno','2519','dpalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (15,'Francois','Fignon','','9981','ffignon@gardening.com','PAR-FR',3,'Director Oficina');
INSERT INTO empleado VALUES (16,'Lionel','Narvaez','','9982','lnarvaez@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO empleado VALUES (17,'Laurent','Serra','','9982','lserra@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO empleado VALUES (18,'Michael','Bolton','','7454','mbolton@gardening.com','SFC-USA',3,'Director Oficina');
INSERT INTO empleado VALUES (19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com','SFC-USA',18,'Representante Ventas');
INSERT INTO empleado VALUES (20,'Hilary','Washington','','7565','hwashington@gardening.com','BOS-USA',3,'Director Oficina');
INSERT INTO empleado VALUES (21,'Marcus','Paxton','','7565','mpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO empleado VALUES (22,'Lorena','Paxton','','7665','lpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO empleado VALUES (23,'Nei','Nishikori','','8734','nnishikori@gardening.com','TOK-JP',3,'Director Oficina');
INSERT INTO empleado VALUES (24,'Narumi','Riko','','8734','nriko@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO empleado VALUES (25,'Takuma','Nomura','','8735','tnomura@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO empleado VALUES (26,'Amy','Johnson','','3321','ajohnson@gardening.com','LON-UK',3,'Director Oficina');
INSERT INTO empleado VALUES (27,'Larry','Westfalls','','3322','lwestfalls@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO empleado VALUES (28,'John','Walton','','3322','jwalton@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO empleado VALUES (29,'Kevin','Fallmer','','3210','kfalmer@gardening.com','SYD-AU',3,'Director Oficina');
INSERT INTO empleado VALUES (30,'Julian','Bellinelli','','3211','jbellinelli@gardening.com','SYD-AU',29,'Representante Ventas');
INSERT INTO empleado VALUES (31,'Mariko','Kishi','','3211','mkishi@gardening.com','SYD-AU',29,'Representante Ventas');

INSERT INTO gama_producto VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Herramientas','Herramientas para todo tipo de acci�n',NULL,NULL);
INSERT INTO gama_producto VALUES ('Arom�ticas','Plantas arom�ticas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Frutales','�rboles peque�os de producci�n frutal',NULL,NULL);
INSERT INTO gama_producto VALUES ('Ornamentales','Plantas vistosas para la decoraci�n del jard�n',NULL,NULL);

INSERT INTO cliente VALUES (1,'GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000);
INSERT INTO cliente VALUES (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000);
INSERT INTO cliente VALUES (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue n�22',NULL,'New York',NULL,'USA','85495',22,12000);
INSERT INTO cliente VALUES (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street n�69',NULL,'Miami',NULL,'USA','696969',22,600000);
INSERT INTO cliente VALUES (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente VALUES (7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Spain','28942',11,20000);
INSERT INTO cliente VALUES (8,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Spain','28930',11,40000);
INSERT INTO cliente VALUES (9,'Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','Spain','28947',11,32000);
INSERT INTO cliente VALUES (10,'DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','Spain','28946',11,50000);
INSERT INTO cliente VALUES (11,'Madrile�a de riegos','Jose','Taca�o','655983045','916689215','C/Laga�as','Fuenlabrada','Madrid','Madrid','Spain','28943',11,20000);
INSERT INTO cliente VALUES (12,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente VALUES (13,'Camunas Jardines S.L.','Pedro','Camunas','34914873241','34914871541','C/Virgenes 45','C/Princesas 2 1�B','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481);
INSERT INTO cliente VALUES (14,'Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',NULL,'Madrid','Madrid','Spain','28003',8,321000);
INSERT INTO cliente VALUES (15,'Jardin de Flores','Javier','Villar','654865643','914538776','C/ O�a 34',NULL,'Madrid','Madrid','Spain','28950',30,40000);
INSERT INTO cliente VALUES (16,'Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',NULL,'Fuenlabrada','Madrid','Spain','28945',5,1500);
INSERT INTO cliente VALUES (17,'Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',NULL,'Montornes del valles','Barcelona','Spain','24586',5,3500);
INSERT INTO cliente VALUES (18,'Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magall�n 15',NULL,'Madrid','Madrid','Spain','28011',30,5050);
INSERT INTO cliente VALUES (19,'Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',NULL,'Santa cruz de Tenerife','Islas Canarias','Spain','38297',12,30000);
INSERT INTO cliente VALUES (20,'Americh Golf Management SL','Mario','Suarez','964493072','964493063','C/Letardo',NULL,'Barcelona','Catalu�a','Spain','12320',12,20000);
INSERT INTO cliente VALUES (21,'Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',NULL,'Canarias','Canarias','Spain','35488',12,50000);
INSERT INTO cliente VALUES (22,'El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',NULL,'Barcelona','Catalu�a','Spain','12320',12,30000);
INSERT INTO cliente VALUES (23,'Sotogrande','Maria','Santillana','915576622','914825645','C/Paseo del Parque',NULL,'Sotogrande','Cadiz','Spain','11310',12,60000);
INSERT INTO cliente VALUES (24,'Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',NULL,'Humanes','Madrid','Spain','28970',30,7430);
INSERT INTO cliente VALUES (25,'Fuenla City','Tony','Mu�oz Mena','675842139','915483754','C/Callo 52',NULL,'Fuenlabrada','Madrid','Spain','28574',5,4500);
INSERT INTO cliente VALUES (26,'Jardines y Mansiones Cactus SL','Eva Mar�a','S�nchez','916877445','914477777','Pol�gono Industrial Maspalomas, N�52','M�stoles','Madrid','Madrid','Spain','29874',9,76000);
INSERT INTO cliente VALUES (27,'Jardiner�as Mat�as SL','Mat�as','San Mart�n','916544147','917897474','C/Francisco Arce, N�44','Bustarviejo','Madrid','Madrid','Spain','37845',9,100500);
INSERT INTO cliente VALUES (28,'Agrojardin','Benito','Lopez','675432926','916549264','C/Mar Caspio 43',NULL,'Getafe','Madrid','Spain','28904',30,8040);
INSERT INTO cliente VALUES (29,'Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',NULL,'Humanes','Madrid','Spain','28574',5,5500);
INSERT INTO cliente VALUES (30,'Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',NULL,'Fuenlabrada','Madrid','Spain','27584',5,7500);
INSERT INTO cliente VALUES (31,'Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',NULL,'Fuenlabrada','Madrid','Spain','28945',30,3250);
INSERT INTO cliente VALUES (32,'france telecom','Fraçois','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15ème',NULL,'Paris',NULL,'France','75010',16,10000);
INSERT INTO cliente VALUES (33,'Mus�e du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',NULL,'Paris',NULL,'France','75058',16,30000);
INSERT INTO cliente VALUES (35,'Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',NULL,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000);
INSERT INTO cliente VALUES (36,'Flores S.L.','Antonio','Romero','654352981','685249700','Avenida Espa�a',NULL,'Madrid','Fuenlabrada','Spain','29643',18,6000);
INSERT INTO cliente VALUES (37,'The Magic Garden','Richard','Mcain','926523468','9364875882','Lihgting Park',NULL,'London','London','United Kingdom','65930',18,10000);
INSERT INTO cliente VALUES (38,'El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',NULL,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);

INSERT INTO pedido VALUES (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
INSERT INTO pedido VALUES (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5);
INSERT INTO pedido VALUES (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
INSERT INTO pedido VALUES (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);
INSERT INTO pedido VALUES (8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
INSERT INTO pedido VALUES (9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO pedido VALUES (10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
INSERT INTO pedido VALUES (11,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
INSERT INTO pedido VALUES (12,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
INSERT INTO pedido VALUES (13,'2009-01-12','2009-01-14','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido VALUES (14,'2009-01-02','2009-01-02',null,'Rechazado','mal pago',7);
INSERT INTO pedido VALUES (15,'2009-01-09','2009-01-12','2009-01-11','Entregado',NULL,7);
INSERT INTO pedido VALUES (16,'2009-01-06','2009-01-07','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido VALUES (17,'2009-01-08','2009-01-09','2009-01-11','Entregado','mal estado',7);
INSERT INTO pedido VALUES (18,'2009-01-05','2009-01-06','2009-01-07','Entregado',NULL,9);
INSERT INTO pedido VALUES (19,'2009-01-18','2009-02-12',NULL,'Pendiente','entregar en murcia',9);
INSERT INTO pedido VALUES (20,'2009-01-20','2009-02-15',NULL,'Pendiente',NULL,9);
INSERT INTO pedido VALUES (21,'2009-01-09','2009-01-09','2009-01-09','Rechazado','mal pago',9);
INSERT INTO pedido VALUES (22,'2009-01-11','2009-01-11','2009-01-13','Entregado',NULL,9);
INSERT INTO pedido VALUES (23,'2008-12-30','2009-01-10',NULL,'Rechazado','El pedido fue anulado por el cliente',5);
INSERT INTO pedido VALUES (24,'2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14);
INSERT INTO pedido VALUES (25,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
INSERT INTO pedido VALUES (26,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
INSERT INTO pedido VALUES (27,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
INSERT INTO pedido VALUES (28,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
INSERT INTO pedido VALUES (29,'2008-08-01','2008-09-01','2008-09-01','Rechazado','El cliente no est� conforme con el pedido',14);
INSERT INTO pedido VALUES (30,'2008-08-03','2008-09-03','2008-08-31','Entregado',NULL,13);
INSERT INTO pedido VALUES (31,'2008-09-04','2008-09-30','2008-10-04','Rechazado','El cliente ha rechazado por llegar 5 dias tarde',13);
INSERT INTO pedido VALUES (32,'2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardia, el cliente puso reclamacion',4);
INSERT INTO pedido VALUES (33,'2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4);
INSERT INTO pedido VALUES (34,'2007-06-20','2008-06-28','2008-06-28','Entregado','Pagado a plazos',4);
INSERT INTO pedido VALUES (35,'2008-03-10','2009-03-20',NULL,'Rechazado','Limite de credito superado',4);
INSERT INTO pedido VALUES (36,'2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14);
INSERT INTO pedido VALUES (37,'2008-11-03','2009-11-13',NULL,'Pendiente','El pedido nunca llego a su destino',4);
INSERT INTO pedido VALUES (38,'2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19);
INSERT INTO pedido VALUES (39,'2009-03-06','2009-03-07','2009-03-09','Pendiente',NULL,19);
INSERT INTO pedido VALUES (40,'2009-03-09','2009-03-10','2009-03-13','Rechazado',NULL,19);
INSERT INTO pedido VALUES (41,'2009-03-12','2009-03-13','2009-03-13','Entregado',NULL,19);
INSERT INTO pedido VALUES (42,'2009-03-22','2009-03-23','2009-03-27','Entregado',NULL,19);
INSERT INTO pedido VALUES (43,'2009-03-25','2009-03-26','2009-03-28','Pendiente',NULL,23);
INSERT INTO pedido VALUES (44,'2009-03-26','2009-03-27','2009-03-30','Pendiente',NULL,23);
INSERT INTO pedido VALUES (45,'2009-04-01','2009-03-04','2009-03-07','Entregado',NULL,23);
INSERT INTO pedido VALUES (46,'2009-04-03','2009-03-04','2009-03-05','Rechazado',NULL,23);
INSERT INTO pedido VALUES (47,'2009-04-15','2009-03-17','2009-03-17','Entregado',NULL,23);
INSERT INTO pedido VALUES (48,'2008-03-17','2008-03-30','2008-03-29','Entregado','Seg�n el Cliente, el pedido lleg� defectuoso',26);
INSERT INTO pedido VALUES (49,'2008-07-12','2008-07-22','2008-07-30','Entregado','El pedido lleg� 1 d�a tarde, pero no hubo queja por parte de la empresa compradora',26);
INSERT INTO pedido VALUES (50,'2008-03-17','2008-08-09',NULL,'Pendiente','Al parecer, el pedido se ha extraviado a la altura de Sotalbo (�vila)',26);
INSERT INTO pedido VALUES (51,'2008-10-01','2008-10-14','2008-10-14','Entregado','Todo se entreg� a tiempo y en perfecto estado, a pesar del p�simo estado de las carreteras.',26);
INSERT INTO pedido VALUES (52,'2008-12-07','2008-12-21',NULL,'Pendiente','El transportista ha llamado a Eva Mar�a para indicarle que el pedido llegar� m�s tarde de lo esperado.',26);
INSERT INTO pedido VALUES (53,'2008-10-15','2008-11-15','2008-11-09','Entregado','El pedido llega 6 dias antes',13);
INSERT INTO pedido VALUES (54,'2009-01-11','2009-02-11',NULL,'Pendiente',NULL,14);
INSERT INTO pedido VALUES (55,'2008-12-10','2009-01-10','2009-01-11','Entregado','Retrasado 1 dia por problemas de transporte',14);
INSERT INTO pedido VALUES (56,'2008-12-19','2009-01-20',NULL,'Rechazado','El cliente a anulado el pedido el dia 2009-01-10',13);
INSERT INTO pedido VALUES (57,'2009-01-05','2009-02-05',NULL,'Pendiente',NULL,13);
INSERT INTO pedido VALUES (58,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',3);
INSERT INTO pedido VALUES (59,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
INSERT INTO pedido VALUES (60,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO pedido VALUES (61,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
INSERT INTO pedido VALUES (62,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
INSERT INTO pedido VALUES (63,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
INSERT INTO pedido VALUES (64,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',1);
INSERT INTO pedido VALUES (65,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
INSERT INTO pedido VALUES (66,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
INSERT INTO pedido VALUES (67,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
INSERT INTO pedido VALUES (68,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
INSERT INTO pedido VALUES (74,'2009-01-14','2009-01-22',NULL,'Rechazado','El pedido no llego el dia que queria el cliente por fallo del transporte',15);
INSERT INTO pedido VALUES (75,'2009-01-11','2009-01-13','2009-01-13','Entregado','El pedido llego perfectamente',15);
INSERT INTO pedido VALUES (76,'2008-11-15','2008-11-23','2008-11-23','Entregado',NULL,15);
INSERT INTO pedido VALUES (77,'2009-01-03','2009-01-08',NULL,'Pendiente','El pedido no pudo ser entregado por problemas meteorologicos',15);
INSERT INTO pedido VALUES (78,'2008-12-15','2008-12-17','2008-12-17','Entregado','Fue entregado, pero faltaba mercancia que sera entregada otro dia',15);
INSERT INTO pedido VALUES (79,'2009-01-12','2009-01-13','2009-01-13','Entregado',NULL,28);
INSERT INTO pedido VALUES (80,'2009-01-25','2009-01-26',NULL,'Pendiente','No termin� el pago',28);
INSERT INTO pedido VALUES (81,'2009-01-18','2009-01-24',NULL,'Rechazado','Los producto estaban en mal estado',28);
INSERT INTO pedido VALUES (82,'2009-01-20','2009-01-29','2009-01-29','Entregado','El pedido llego un poco mas tarde de la hora fijada',28);
INSERT INTO pedido VALUES (83,'2009-01-24','2009-01-28',NULL,'Entregado',NULL,28);
INSERT INTO pedido VALUES (89,'2007-10-05','2007-12-13','2007-12-10','Entregado','La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho',35);
INSERT INTO pedido VALUES (90,'2009-02-07','2008-02-17',NULL,'Pendiente','Debido a la nevada ca�da en la sierra, el pedido no podr� llegar hasta el d�a ',27);
INSERT INTO pedido VALUES (91,'2009-03-18','2009-03-29','2009-03-27','Entregado','Todo se entreg� a su debido tiempo, incluso con un d�a de antelaci�n',27);
INSERT INTO pedido VALUES (92,'2009-04-19','2009-04-30','2009-05-03','Entregado','El pedido se entreg� tarde debido a la festividad celebrada en Espa�a durante esas fechas',27);
INSERT INTO pedido VALUES (93,'2009-05-03','2009-05-30','2009-05-17','Entregado','El pedido se entreg� antes de lo esperado.',27);
INSERT INTO pedido VALUES (94,'2009-10-18','2009-11-01',NULL,'Pendiente','El pedido est� en camino.',27);
INSERT INTO pedido VALUES (95,'2008-01-04','2008-01-19','2008-01-19','Entregado',NULL,35);
INSERT INTO pedido VALUES (96,'2008-03-20','2008-04-12','2008-04-13','Entregado','La entrega se retraso un dia',35);
INSERT INTO pedido VALUES (97,'2008-10-08','2008-11-25','2008-11-25','Entregado',NULL,35);
INSERT INTO pedido VALUES (98,'2009-01-08','2009-02-13',NULL,'Pendiente',NULL,35);
INSERT INTO pedido VALUES (99,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
INSERT INTO pedido VALUES (100,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
INSERT INTO pedido VALUES (101,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
INSERT INTO pedido VALUES (102,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
INSERT INTO pedido VALUES (103,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
INSERT INTO pedido VALUES (104,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
INSERT INTO pedido VALUES (105,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
INSERT INTO pedido VALUES (106,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
INSERT INTO pedido VALUES (107,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
INSERT INTO pedido VALUES (108,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
INSERT INTO pedido VALUES (109,'2006-05-25','2006-07-28','2006-07-28','Entregado',NULL,38);
INSERT INTO pedido VALUES (110,'2007-03-19','2007-04-24','2007-04-24','Entregado',NULL,38);
INSERT INTO pedido VALUES (111,'2008-03-05','2008-03-30','2008-03-30','Entregado',NULL,36);
INSERT INTO pedido VALUES (112,'2009-03-05','2009-04-06','2009-05-07','Pendiente',NULL,36);
INSERT INTO pedido VALUES (113,'2008-10-28','2008-11-09','2009-01-09','Rechazado','El producto ha sido rechazado por la tardanza de el envio',36);
INSERT INTO pedido VALUES (114,'2009-01-15','2009-01-29','2009-01-31','Entregado','El envio llego dos dias m�s tarde debido al mal tiempo',36);
INSERT INTO pedido VALUES (115,'2008-11-29','2009-01-26','2009-02-27','Pendiente',NULL,36);
INSERT INTO pedido VALUES (116,'2008-06-28','2008-08-01','2008-08-01','Entregado',NULL,38);
INSERT INTO pedido VALUES (117,'2008-08-25','2008-10-01',NULL,'Rechazado','El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente',38);
INSERT INTO pedido VALUES (118,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
INSERT INTO pedido VALUES (119,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
INSERT INTO pedido VALUES (120,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
INSERT INTO pedido VALUES (121,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
INSERT INTO pedido VALUES (122,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
INSERT INTO pedido VALUES (123,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
INSERT INTO pedido VALUES (124,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
INSERT INTO pedido VALUES (125,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
INSERT INTO pedido VALUES (126,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
INSERT INTO pedido VALUES (127,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
INSERT INTO pedido VALUES (128,'2008-11-10','2008-12-10','2008-12-29','Rechazado','El pedido ha sido rechazado por el cliente por el retraso en la entrega',38);

INSERT INTO producto VALUES ('11679','Sierra de Poda 400MM','Herramientas','0,258','HiperGarden Tools','Gracias a la poda se consigue manipular un poco la naturaleza, d�ndole la forma que m�s nos guste. Este trabajo b�sico de jardiner�a tambi�n facilita que las plantas crezcan de un modo m�s equilibrado, y que las flores y los frutos vuelvan cada a�o con regularidad. Lo mejor es dar forma cuando los ejemplares son j�venes, de modo que exijan pocos cuidados cuando sean adultos. Adem�s de saber cu�ndo y c�mo hay que podar, tener unas herramientas adecuadas para esta labor es tambi�n de vital importancia.',15,14,11);
INSERT INTO producto VALUES ('21636','Pala','Herramientas','0,156','HiperGarden Tools','Palas de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetraci�n en tierras muy compactas.',15,14,13);
INSERT INTO producto VALUES ('22225','Rastrillo de Jard�n','Herramientas','1,064','HiperGarden Tools','Fabuloso rastillo que le ayudar� a eliminar piedras, hojas, ramas y otros elementos inc�modos en su jard�n.',15,12,11);
INSERT INTO producto VALUES ('30310','Azad�n','Herramientas','0,168','HiperGarden Tools','Longitud:24cm. Herramienta fabricada en acero y pintura epoxi,alargando su durabilidad y preveniendo la corrosi�n.Dise�o pensado para el ahorro de trabajo.',15,12,11);
INSERT INTO producto VALUES ('AR-001','Ajedrea','Arom�ticas','15-20','Murcia Seasons','Planta arom�tica que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes',140,1,0);
INSERT INTO producto VALUES ('AR-002','Lav�ndula Dentata','Arom�ticas','15-20','Murcia Seasons','Espliego de jard�n, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: Espa�a y Portugal. Mata de unos 60 cm de alto. Las hojas son arom�ticas, dentadas y de color verde gris�ceas.  Produce compactas espigas de flores peque�as, ligeramente arom�ticas, tubulares,de color azulado y con br�cteas p�rpuras.  Frutos: nuececillas alargadas encerradas en el tubo del c�liz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandas.  Tiene propiedades aromatizantes y calmantes. Adecuadas para la formaci�n de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para las plantas vecinas.',140,1,0);
INSERT INTO producto VALUES ('AR-003','Mejorana','Arom�ticas','15-20','Murcia Seasons','Origanum majorana. No hay que confundirlo con el or�gano. Su sabor se parece m�s al tomillo, pero es m�s dulce y arom�tico.Se usan las hojas frescas o secas, picadas, machacadas o en polvo, en sopas, rellenos, quiches y tartas, tortillas, platos con papas y, como aderezo, en ramilletes de hierbas.El sabor delicado de la mejorana se elimina durante la cocci�n, de manera que es mejor agregarla cuando el plato est� en su punto o en aqu�llos que apenas necesitan cocci�n.',140,1,0);
INSERT INTO producto VALUES ('AR-004','Melissa ','Arom�ticas','15-20','Murcia Seasons','Es una planta perenne (dura varios a�os) conocida por el agradable y caracter�stico olor a lim�n que desprenden en verano. Nunca debe faltar en la huerta o jard�n por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy f�cil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por d�a. Cada a�o, su abonado mineral correspondiente.En oto�o, la melisa pierde el agradable olor a lim�n que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotar� de forma densa en primavera.',140,1,0);
INSERT INTO producto VALUES ('AR-005','Mentha Sativa','Arom�ticas','15-20','Murcia Seasons','�Qui�n no conoce la Hierbabuena? Se trata de una plantita muy arom�tica, agradable y cultivada extensamente por toda Espa�a. Es hierba perenne (por tanto vive varios a�os, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jard�n o en un rinc�n del huerto. Lo m�s importante es que cuente con bastante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los agujeros en hojas consecuencia de su ataque, ret�ralas una a una a mano; no uses insecticidas qu�micos.',140,1,0);
INSERT INTO producto VALUES ('AR-006','Petrosilium Hortense (Peregil)','Arom�ticas','15-20','Murcia Seasons','Nombre cient�fico o latino: Petroselinum hortense, Petroselinum crispum. Nombre com�n o vulgar: Perejil, Perejil rizado Familia: Umbelliferae (Umbel�feras). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta naturalizada en casi toda Europa. Se utiliza como condimento y para adorno, pero tambi�n en ensaladas. Se suele regalar en las fruter�as y verduler�as.El perejil lo hay de 2 tipos: de hojas planas y de hojas rizadas.',140,1,0);
INSERT INTO producto VALUES ('AR-007','Salvia Mix','Arom�ticas','15-20','Murcia Seasons','La Salvia es un peque�o arbusto que llega hasta el metro de alto.Tiene una vida breve, de unos pocos a�os.En el jard�n, como otras arom�ticas, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un camino de Salvia. Abona despu�s de cada corte y recorta el arbusto una vez pase la floraci�n.',140,1,0);
INSERT INTO producto VALUES ('AR-008','Thymus Citriodra (Tomillo lim�n)','Arom�ticas','15-20','Murcia Seasons','Nombre com�n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Regi�n mediterr�nea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque�as, de unos 6 mm de longitud; seg�n la variedad pueden ser verdes, verdes gris�ceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la �poca estival y se presentan en racimos terminales que habitualmente son de color violeta o p�rpura aunque tambi�n pueden ser blancas. Esta planta despide un intenso y t�pico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est� en flor. El tomillo atrae a avispas y abejas. En jardiner�a se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a�ad�los a un popurri, introd�zcalos en saquitos de hierbas o en la almohada.Tambi�n puede usar las ramas secas con flores para a�adir aroma y textura a cestos abiertos.',140,1,0);
INSERT INTO producto VALUES ('AR-009','Thymus Vulgaris','Arom�ticas','15-20','Murcia Seasons','Nombre com�n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Regi�n mediterr�nea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque�as, de unos 6 mm de longitud; seg�n la variedad pueden ser verdes, verdes gris�ceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la �poca estival y se presentan en racimos terminales que habitualmente son de color violeta o p�rpura aunque tambi�n pueden ser blancas. Esta planta despide un intenso y t�pico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est� en flor. El tomillo atrae a avispas y abejas.\r\n En jardiner�a se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a�ad�los a un popurri, introd�zcalos en saquitos de hierbas o en la almohada. Tambi�n puede usar las ramas secas con flores para a�adir aroma y textura a cestos abiertos.',140,1,0);
INSERT INTO producto VALUES ('AR-010','Santolina Chamaecyparys','Arom�ticas','15-20','Murcia Seasons','',140,1,0);
INSERT INTO producto VALUES ('FR-1','Expositor C�tricos Mix','Frutales','100-120','Frutales Talavera S.A','',15,7,5);
INSERT INTO producto VALUES ('FR-10','Limonero 2 a�os injerto','Frutales','','NaranjasValencianas.com','El limonero, pertenece al grupo de los c�tricos, teniendo su origen hace unos 20 millones de a�os en el sudeste asi�tico. Fue introducido por los �rabes en el �rea mediterr�nea entre los a�os 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selecci�n natural mediante hibridaciones espont�neas como a las producidas por el hombre, en este caso buscando las necesidades del mercado.',15,7,5);
INSERT INTO producto VALUES ('FR-100','Nectarina','Frutales','8/10','Frutales Talavera S.A','Se trata de un �rbol derivado por mutaci�n de los melocotoneros comunes, y los �nicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros',50,11,8);
INSERT INTO producto VALUES ('FR-101','Nogal','Frutales','8/10','Frutales Talavera S.A','',50,13,10);
INSERT INTO producto VALUES ('FR-102','Olea-Olivos','Frutales','8/10','Frutales Talavera S.A','Existen dos hip�tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L�bano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m�s tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr�neas espa�olas coinciden con el dominio romano, aunque fueron posteriormente los �rabes los que impulsaron su cultivo en Andaluc�a, convirtiendo a Espa�a en el primer pa�s productor de aceite de oliva a nivel mundial.',50,18,14);
INSERT INTO producto VALUES ('FR-103','Olea-Olivos','Frutales','10/12','Frutales Talavera S.A','Existen dos hip�tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L�bano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m�s tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr�neas espa�olas coinciden con el dominio romano, aunque fueron posteriormente los �rabes los que impulsaron su cultivo en Andaluc�a, convirtiendo a Espa�a en el primer pa�s productor de aceite de oliva a nivel mundial.',50,25,20);
INSERT INTO producto VALUES ('FR-104','Olea-Olivos','Frutales','12/4','Frutales Talavera S.A','Existen dos hip�tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L�bano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m�s tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr�neas espa�olas coinciden con el dominio romano, aunque fueron posteriormente los �rabes los que impulsaron su cultivo en Andaluc�a, convirtiendo a Espa�a en el primer pa�s productor de aceite de oliva a nivel mundial.',50,49,39);
INSERT INTO producto VALUES ('FR-105','Olea-Olivos','Frutales','14/16','Frutales Talavera S.A','Existen dos hip�tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L�bano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m�s tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr�neas espa�olas coinciden con el dominio romano, aunque fueron posteriormente los �rabes los que impulsaron su cultivo en Andaluc�a, convirtiendo a Espa�a en el primer pa�s productor de aceite de oliva a nivel mundial.',50,70,56);
INSERT INTO producto VALUES ('FR-106','Peral','Frutales','8/10','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',50,11,8);
INSERT INTO producto VALUES ('FR-107','Peral','Frutales','10/12','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',50,22,17);
INSERT INTO producto VALUES ('FR-108','Peral','Frutales','12/14','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',50,32,25);
INSERT INTO producto VALUES ('FR-11','Limonero 30/40','Frutales','','NaranjasValencianas.com','El limonero, pertenece al grupo de los c�tricos, teniendo su origen hace unos 20 millones de a�os en el sudeste asi�tico. Fue introducido por los �rabes en el �rea mediterr�nea entre los a�os 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selecci�n natural mediante hibridaciones espont�neas como a las producidas por el',15,100,80);
INSERT INTO producto VALUES ('FR-12','Kunquat ','Frutales','','NaranjasValencianas.com','su nombre cient�fico se origina en honor a un hoticultor escoc�s que recolect� espec�menes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del lat�n margaritus-a-um = perla, en alusi�n a sus peque�os y brillantes frutos. Se trata de un arbusto o �rbol peque�o de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el �pice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el env�s m�s p�lido.Pec�olo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo m�s caracter�stico, es el m�s peque�o de todos los c�tricos y el �nico cuya c�scara se puede comer.Frutos peque�os, con semillas, de corteza fina, dulce, arom�tica y comestible, y de pulpa naranja amarillenta y ligeramente �cida.Sus frutos son muy peque�os y tienen un car�cter principalmente ornamental.',15,21,16);
INSERT INTO producto VALUES ('FR-13','Kunquat  EXTRA con FRUTA','Frutales','150-170','NaranjasValencianas.com','su nombre cient�fico se origina en honor a un hoticultor escoc�s que recolect� espec�menes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del lat�n margaritus-a-um = perla, en alusi�n a sus peque�os y brillantes frutos. Se trata de un arbusto o �rbol peque�o de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el �pice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el env�s m�s p�lido.Pec�olo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo m�s caracter�stico, es el m�s peque�o de todos los c�tricos y el �nico cuya c�scara se puede comer.Frutos peque�os, con semillas, de corteza fina, dulce, arom�tica y comestible, y de pulpa naranja amarillenta y ligeramente �cida.Sus frutos son muy peque�os y tienen un car�cter principalmente ornamental.',15,57,45);
INSERT INTO producto VALUES ('FR-14','Calamondin Mini','Frutales','','Frutales Talavera S.A','Se trata de un peque�o arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son peque�as, el�pticas de 5-10 cm de longitud, con los pec�olos estrechamente alados.Posee 1 o 2 flores en situaci�n axilar, al final de las ramillas.Sus frutos son muy peque�os (3-3,5 cm de di�metro), con pocas semillas, esf�ricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y f�cilmente separable de la pulpa, que es dulce, �cida y comestible..',15,10,8);
INSERT INTO producto VALUES ('FR-15','Calamondin Copa ','Frutales','','Frutales Talavera S.A','Se trata de un peque�o arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son peque�as, el�pticas de 5-10 cm de longitud, con los pec�olos estrechamente alados.Posee 1 o 2 flores en situaci�n axilar, al final de las ramillas.Sus frutos son muy peque�os (3-3,5 cm de di�metro), con pocas semillas, esf�ricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y f�cilmente separable de la pulpa, que es dulce, �cida y comestible..',15,25,20);
INSERT INTO producto VALUES ('FR-16','Calamondin Copa EXTRA Con FRUTA','Frutales','100-120','Frutales Talavera S.A','Se trata de un peque�o arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son peque�as, el�pticas de 5-10 cm de longitud, con los pec�olos estrechamente alados.Posee 1 o 2 flores en situaci�n axilar, al final de las ramillas.Sus frutos son muy peque�os (3-3,5 cm de di�metro), con pocas semillas, esf�ricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y f�cilmente separable de la pulpa, que es dulce, �cida y comestible..',15,45,36);
INSERT INTO producto VALUES ('FR-17','Rosal bajo 1ª -En maceta-inicio brotaci�n','Frutales','','Frutales Talavera S.A','',15,2,1);
INSERT INTO producto VALUES ('FR-18','ROSAL TREPADOR','Frutales','','Frutales Talavera S.A','',350,4,3);
INSERT INTO producto VALUES ('FR-19','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Frutales','','NaranjasValencianas.com','',350,4,3);
INSERT INTO producto VALUES ('FR-2','Naranjo -Plant�n joven 1 a�o injerto','Frutales','','NaranjasValencianas.com','El naranjo es un �rbol peque�o, que no supera los 3-5 metros de altura, con una copa compacta, c�nica, transformada en es�rica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, cori�ceas, de un verde intenso y brillante, con forma oval o el�ptico-lanceolada. Poseen, en el caso del naranjo amargo, un t�pico peciolo alado en forma de coraz�n, que en el naranjo dulce es m�s estrecho y menos patente.',15,6,4);
INSERT INTO producto VALUES ('FR-20','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Frutales','','Frutales Talavera S.A','',350,4,3);
INSERT INTO producto VALUES ('FR-21','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Frutales','','Frutales Talavera S.A','',350,4,3);
INSERT INTO producto VALUES ('FR-22','Pitimini rojo','Frutales','','Frutales Talavera S.A','',350,4,3);
INSERT INTO producto VALUES ('FR-23','Rosal copa ','Frutales','','Frutales Talavera S.A','',400,8,6);
INSERT INTO producto VALUES ('FR-24','Albaricoquero Corbato','Frutales','','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',400,8,6);
INSERT INTO producto VALUES ('FR-25','Albaricoquero Moniqui','Frutales','','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',400,8,6);
INSERT INTO producto VALUES ('FR-26','Albaricoquero Kurrot','Frutales','','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',400,8,6);
INSERT INTO producto VALUES ('FR-27','Cerezo Burlat','Frutales','','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',400,8,6);
INSERT INTO producto VALUES ('FR-28','Cerezo Picota','Frutales','','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',400,8,6);
INSERT INTO producto VALUES ('FR-29','Cerezo Napole�n','Frutales','','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',400,8,6);
INSERT INTO producto VALUES ('FR-3','Naranjo 2 a�os injerto','Frutales','','NaranjasValencianas.com','El naranjo es un �rbol peque�o, que no supera los 3-5 metros de altura, con una copa compacta, c�nica, transformada en es�rica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, cori�ceas, de un verde intenso y brillante, con forma oval o el�ptico-lanceolada. Poseen, en el caso del naranjo amargo, un t�pico peciolo alado en forma de coraz�n, que en el naranjo dulce es m�s estrecho y menos patente.',15,7,5);
INSERT INTO producto VALUES ('FR-30','Ciruelo R. Claudia Verde   ','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-31','Ciruelo Santa Rosa','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-32','Ciruelo Golden Japan','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-33','Ciruelo Friar','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-34','Ciruelo Reina C. De Ollins','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-35','Ciruelo Claudia Negra','Frutales','','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-36','Granado Mollar de Elche','Frutales','','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',400,9,7);
INSERT INTO producto VALUES ('FR-37','Higuera Napolitana','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',400,9,7);
INSERT INTO producto VALUES ('FR-38','Higuera Verdal','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',400,9,7);
INSERT INTO producto VALUES ('FR-39','Higuera Breva','Frutales','','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',400,9,7);
INSERT INTO producto VALUES ('FR-4','Naranjo calibre 8/10','Frutales','','NaranjasValencianas.com','El naranjo es un �rbol peque�o, que no supera los 3-5 metros de altura, con una copa compacta, c�nica, transformada en es�rica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, cori�ceas, de un verde intenso y brillante, con forma oval o el�ptico-lanceolada. Poseen, en el caso del naranjo amargo, un t�pico peciolo alado en forma de coraz�n, que en el naranjo dulce es m�s estrecho y menos patente.',15,29,23);
INSERT INTO producto VALUES ('FR-40','Manzano Starking Delicious','Frutales','','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',400,8,6);
INSERT INTO producto VALUES ('FR-41','Manzano Reineta','Frutales','','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',400,8,6);
INSERT INTO producto VALUES ('FR-42','Manzano Golden Delicious','Frutales','','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',400,8,6);
INSERT INTO producto VALUES ('FR-43','Membrillero Gigante de Wranja','Frutales','','Frutales Talavera S.A','',400,8,6);
INSERT INTO producto VALUES ('FR-44','Melocotonero Spring Crest','Frutales','','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6);
INSERT INTO producto VALUES ('FR-45','Melocotonero Amarillo de Agosto','Frutales','','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6);
INSERT INTO producto VALUES ('FR-46','Melocotonero Federica','Frutales','','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6);
INSERT INTO producto VALUES ('FR-47','Melocotonero Paraguayo','Frutales','','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',400,8,6);
INSERT INTO producto VALUES ('FR-48','Nogal Com�n','Frutales','','Frutales Talavera S.A','',400,9,7);
INSERT INTO producto VALUES ('FR-49','Parra Uva de Mesa','Frutales','','Frutales Talavera S.A','',400,8,6);
INSERT INTO producto VALUES ('FR-5','Mandarino -Plant�n joven','Frutales','','Frutales Talavera S.A','',15,6,4);
INSERT INTO producto VALUES ('FR-50','Peral Castell','Frutales','','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',400,8,6);
INSERT INTO producto VALUES ('FR-51','Peral Williams','Frutales','','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',400,8,6);
INSERT INTO producto VALUES ('FR-52','Peral Conference','Frutales','','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',400,8,6);
INSERT INTO producto VALUES ('FR-53','Peral Blanq. de Aranjuez','Frutales','','Frutales Talavera S.A','�rbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por t�rmino medio vive 65 a�os.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando �ngulo agudo con el tronco (45�), de corteza lisa, primero verde y luego gris-viol�cea, con numerosas lenticelas.',400,8,6);
INSERT INTO producto VALUES ('FR-54','N�spero Tanaca','Frutales','','Frutales Talavera S.A','Aunque originario del Sudeste de China, el n�spero lleg� a Europa procedente de Jap�n en el siglo XVIII como �rbol ornamental. En el siglo XIX se inici� el consumo de los frutos en toda el �rea mediterr�nea, donde se adapt� muy bien a las zonas de cultivo de los c�tricos.El cultivo intensivo comenz� a desarrollarse a finales de los a�os 60 y principios de los 70, cuando comenzaron a implantarse las variedades y t�cnicas de cultivo actualmente utilizadas.',400,9,7);
INSERT INTO producto VALUES ('FR-55','Olivo Cipresino','Frutales','','Frutales Talavera S.A','Existen dos hip�tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L�bano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m�s tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr�neas espa�olas coinciden con el dominio romano, aunque fueron posteriormente los �rabes los que impulsaron su cultivo en Andaluc�a, convirtiendo a Espa�a en el primer pa�s productor de aceite de oliva a nivel mundial.',400,8,6);
INSERT INTO producto VALUES ('FR-56','Nectarina','Frutales','','Frutales Talavera S.A','',400,8,6);
INSERT INTO producto VALUES ('FR-57','Kaki Rojo Brillante','Frutales','','NaranjasValencianas.com','De crecimiento algo lento los primeros a�os, llega a alcanzar hasta doce metros de altura o m�s, aunque en cultivo se prefiere algo m�s bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte m�s o menos piramidal, aunque con la edad se hace m�s globoso.',400,9,7);
INSERT INTO producto VALUES ('FR-58','Albaricoquero','Frutales','8/10','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',200,11,8);
INSERT INTO producto VALUES ('FR-59','Albaricoquero','Frutales','10/12','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',200,22,17);
INSERT INTO producto VALUES ('FR-6','Mandarino 2 a�os injerto','Frutales','','Frutales Talavera S.A','',15,7,5);
INSERT INTO producto VALUES ('FR-60','Albaricoquero','Frutales','12/14','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',200,32,25);
INSERT INTO producto VALUES ('FR-61','Albaricoquero','Frutales','14/16','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',200,49,39);
INSERT INTO producto VALUES ('FR-62','Albaricoquero','Frutales','16/18','Melocotones de Cieza S.A.','�rbol que puede pasar de los 6 m de altura, en la regi�n mediterr�nea con ramas formando una copa redondeada. La corteza del tronco es pardo-viol�cea, agrietada; las ramas son rojizas y extendidas cuando j�venes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.',200,70,56);
INSERT INTO producto VALUES ('FR-63','Cerezo','Frutales','8/10','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',300,11,8);
INSERT INTO producto VALUES ('FR-64','Cerezo','Frutales','10/12','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',15,22,17);
INSERT INTO producto VALUES ('FR-65','Cerezo','Frutales','12/14','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',200,32,25);
INSERT INTO producto VALUES ('FR-66','Cerezo','Frutales','14/16','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',50,49,39);
INSERT INTO producto VALUES ('FR-67','Cerezo','Frutales','16/18','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',50,70,56);
INSERT INTO producto VALUES ('FR-68','Cerezo','Frutales','18/20','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',50,80,64);
INSERT INTO producto VALUES ('FR-69','Cerezo','Frutales','20/25','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", h�brido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundi�ndose despu�s hacia Europa y Asia, llevado por los p�jaros y las migraciones humanas. Fue uno de los frutales m�s apreciados por los griegos y con el Imperio Romano se extendi� a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y pa�ses del mundo con clima templado',50,91,72);
INSERT INTO producto VALUES ('FR-7','Mandarino calibre 8/10','Frutales','','Frutales Talavera S.A','',15,29,23);
INSERT INTO producto VALUES ('FR-70','Ciruelo','Frutales','8/10','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',50,11,8);
INSERT INTO producto VALUES ('FR-71','Ciruelo','Frutales','10/12','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',50,22,17);
INSERT INTO producto VALUES ('FR-72','Ciruelo','Frutales','12/14','Frutales Talavera S.A','�rbol de tama�o mediano que alcanza una altura m�xima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, peque�as, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',50,32,25);
INSERT INTO producto VALUES ('FR-73','Granado','Frutales','8/10','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',50,13,10);
INSERT INTO producto VALUES ('FR-74','Granado','Frutales','10/12','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',50,22,17);
INSERT INTO producto VALUES ('FR-75','Granado','Frutales','12/14','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',50,32,25);
INSERT INTO producto VALUES ('FR-76','Granado','Frutales','14/16','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',50,49,39);
INSERT INTO producto VALUES ('FR-77','Granado','Frutales','16/18','Frutales Talavera S.A','peque�o �rbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color gris�ceo. Las ramitas j�venes son m�s o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color caf� gris�ceo, la mayor�a de las ramas, pero especialmente las peque�as ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.',50,70,56);
INSERT INTO producto VALUES ('FR-78','Higuera','Frutales','8/10','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,15,12);
INSERT INTO producto VALUES ('FR-79','Higuera','Frutales','10/12','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,22,17);
INSERT INTO producto VALUES ('FR-8','Limonero -Plant�n joven','Frutales','','NaranjasValencianas.com','El limonero, pertenece al grupo de los c�tricos, teniendo su origen hace unos 20 millones de a�os en el sudeste asi�tico. Fue introducido por los �rabes en el �rea mediterr�nea entre los a�os 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selecci�n natural mediante hibridaciones espont�neas como a las producidas por el',15,6,4);
INSERT INTO producto VALUES ('FR-80','Higuera','Frutales','12/14','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,32,25);
INSERT INTO producto VALUES ('FR-81','Higuera','Frutales','14/16','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,49,39);
INSERT INTO producto VALUES ('FR-82','Higuera','Frutales','16/18','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,70,56);
INSERT INTO producto VALUES ('FR-83','Higuera','Frutales','18/20','Frutales Talavera S.A','La higuera (Ficus carica L.) es un �rbol t�pico de secano en los pa�ses mediterr�neos. Su rusticidad y su f�cil multiplicaci�n hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como �rbol que no requiere cuidado alguno una vez plantado y arraigado, limit�ndose el hombre a recoger de �l los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las �nicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el inter�s econ�mico de su primera cosecha, la de brevas.',50,80,64);
INSERT INTO producto VALUES ('FR-84','Kaki','Frutales','8/10','NaranjasValencianas.com','De crecimiento algo lento los primeros a�os, llega a alcanzar hasta doce metros de altura o m�s, aunque en cultivo se prefiere algo m�s bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte m�s o menos piramidal, aunque con la edad se hace m�s globoso.',50,13,10);
INSERT INTO producto VALUES ('FR-85','Kaki','Frutales','16/18','NaranjasValencianas.com','De crecimiento algo lento los primeros a�os, llega a alcanzar hasta doce metros de altura o m�s, aunque en cultivo se prefiere algo m�s bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte m�s o menos piramidal, aunque con la edad se hace m�s globoso.',50,70,56);
INSERT INTO producto VALUES ('FR-86','Manzano','Frutales','8/10','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',50,11,8);
INSERT INTO producto VALUES ('FR-87','Manzano','Frutales','10/12','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',50,22,17);
INSERT INTO producto VALUES ('FR-88','Manzano','Frutales','12/14','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',50,32,25);
INSERT INTO producto VALUES ('FR-89','Manzano','Frutales','14/16','Frutales Talavera S.A','alcanza como m�ximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del �rbol. Tiene una vida de unos 60-80 a�os. Las ramas se insertan en �ngulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o viol�ceo. Los brotes j�venes terminan con frecuencia en una espina',50,49,39);
INSERT INTO producto VALUES ('FR-9','Limonero calibre 8/10','Frutales','','NaranjasValencianas.com','El limonero, pertenece al grupo de los c�tricos, teniendo su origen hace unos 20 millones de a�os en el sudeste asi�tico. Fue introducido por los �rabes en el �rea mediterr�nea entre los a�os 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selecci�n natural mediante hibridaciones espont�neas como a las producidas por el',15,29,23);
INSERT INTO producto VALUES ('FR-90','N�spero','Frutales','16/18','Frutales Talavera S.A','Aunque originario del Sudeste de China, el n�spero lleg� a Europa procedente de Jap�n en el siglo XVIII como �rbol ornamental. En el siglo XIX se inici� el consumo de los frutos en toda el �rea mediterr�nea, donde se adapt� muy bien a las zonas de cultivo de los c�tricos.El cultivo intensivo comenz� a desarrollarse a finales de los a�os 60 y principios de los 70, cuando comenzaron a implantarse las variedades y t�cnicas de cultivo actualmente utilizadas.',50,70,56);
INSERT INTO producto VALUES ('FR-91','N�spero','Frutales','18/20','Frutales Talavera S.A','Aunque originario del Sudeste de China, el n�spero lleg� a Europa procedente de Jap�n en el siglo XVIII como �rbol ornamental. En el siglo XIX se inici� el consumo de los frutos en toda el �rea mediterr�nea, donde se adapt� muy bien a las zonas de cultivo de los c�tricos.El cultivo intensivo comenz� a desarrollarse a finales de los a�os 60 y principios de los 70, cuando comenzaron a implantarse las variedades y t�cnicas de cultivo actualmente utilizadas.',50,80,64);
INSERT INTO producto VALUES ('FR-92','Melocotonero','Frutales','8/10','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,11,8);
INSERT INTO producto VALUES ('FR-93','Melocotonero','Frutales','10/12','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,22,17);
INSERT INTO producto VALUES ('FR-94','Melocotonero','Frutales','12/14','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,32,25);
INSERT INTO producto VALUES ('FR-95','Melocotonero','Frutales','14/16','Melocotones de Cieza S.A.','�rbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo m�s claras por el env�s. El melocotonero est� muy arraigado en la cultura asi�tica.\r\nEn Jap�n, el noble heroe Momotaro, una especie de Cid japon�s, naci� del interior de un enorme melocot�n que flotaba r�o abajo.\r\nEn China se piensa que comer melocot�n confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.',50,49,39);
INSERT INTO producto VALUES ('FR-96','Membrillero','Frutales','8/10','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, gris�cea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas j�venes tomentosas',50,11,8);
INSERT INTO producto VALUES ('FR-97','Membrillero','Frutales','10/12','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, gris�cea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas j�venes tomentosas',50,22,17);
INSERT INTO producto VALUES ('FR-98','Membrillero','Frutales','12/14','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, gris�cea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas j�venes tomentosas',50,32,25);
INSERT INTO producto VALUES ('FR-99','Membrillero','Frutales','14/16','Frutales Talavera S.A','arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, gris�cea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas j�venes tomentosas',50,49,39);
INSERT INTO producto VALUES ('OR-001','Arbustos Mix Maceta','Ornamentales','40-60','Valencia Garden Service','',25,5,4);
INSERT INTO producto VALUES ('OR-100','Mimosa Injerto CLASICA Dealbata ','Ornamentales','100-110','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,12,9);
INSERT INTO producto VALUES ('OR-101','Expositor Mimosa Semilla Mix','Ornamentales','170-200','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,6,4);
INSERT INTO producto VALUES ('OR-102','Mimosa Semilla Bayleyana  ','Ornamentales','170-200','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,6,4);
INSERT INTO producto VALUES ('OR-103','Mimosa Semilla Bayleyana   ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,10,8);
INSERT INTO producto VALUES ('OR-104','Mimosa Semilla Cyanophylla    ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,10,8);
INSERT INTO producto VALUES ('OR-105','Mimosa Semilla Espectabilis  ','Ornamentales','160-170','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,6,4);
INSERT INTO producto VALUES ('OR-106','Mimosa Semilla Longifolia   ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,10,8);
INSERT INTO producto VALUES ('OR-107','Mimosa Semilla Floribunda 4 estaciones','Ornamentales','120-140','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,6,4);
INSERT INTO producto VALUES ('OR-108','Abelia Floribunda','Ornamentales','35-45','Viveros EL OASIS','',100,5,4);
INSERT INTO producto VALUES ('OR-109','Callistemom (Mix)','Ornamentales','35-45','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ah� lo de \"llor�n\")..',100,5,4);
INSERT INTO producto VALUES ('OR-110','Callistemom (Mix)','Ornamentales','40-60','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ah� lo de \"llor�n\")..',100,2,1);
INSERT INTO producto VALUES ('OR-111','Corylus Avellana \"Contorta\"','Ornamentales','35-45','Viveros EL OASIS','',100,5,4);
INSERT INTO producto VALUES ('OR-112','Escallonia (Mix)','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-113','Evonimus Emerald Gayeti','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-114','Evonimus Pulchellus','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-115','Forsytia Intermedia \"Lynwood\"','Ornamentales','35-45','Viveros EL OASIS','',120,7,5);
INSERT INTO producto VALUES ('OR-116','Hibiscus Syriacus  \"Diana\" -Blanco Puro','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podas, pueden ser f�cilmente moldeadas como bons�i en el transcurso de pocos a�os. Flores de muchos colores seg�n la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 d�a, pero continuamente aparecen nuevas y la floraci�n se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5);
INSERT INTO producto VALUES ('OR-117','Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podas, pueden ser f�cilmente moldeadas como bons�i en el transcurso de pocos a�os. Flores de muchos colores seg�n la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 d�a, pero continuamente aparecen nuevas y la floraci�n se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5);
INSERT INTO producto VALUES ('OR-118','Hibiscus Syriacus \"Pink Giant\" Rosa','Ornamentales','35-45','Viveros EL OASIS','Por su capacidad de soportar podas, pueden ser f�cilmente moldeadas como bons�i en el transcurso de pocos a�os. Flores de muchos colores seg�n la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 d�a, pero continuamente aparecen nuevas y la floraci�n se prolonga durante todo el periodo de crecimiento vegetativo.',120,7,5);
INSERT INTO producto VALUES ('OR-119','Laurus Nobilis Arbusto - Ramificado Bajo','Ornamentales','40-50','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-120','Lonicera Nitida ','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-121','Lonicera Nitida \"Maigrum\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-122','Lonicera Pileata','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-123','Philadelphus \"Virginal\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-124','Prunus pisardii  ','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-125','Viburnum Tinus \"Eve Price\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-126','Weigelia \"Bristol Ruby\"','Ornamentales','35-45','Viveros EL OASIS','',120,5,4);
INSERT INTO producto VALUES ('OR-127','Camelia japonica','Ornamentales','40-60','Viveros EL OASIS','Arbusto excepcional por su floraci�n oto�al, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el �pice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de di� metro y tienen 5 s�palos y 5 p�talos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,7,5);
INSERT INTO producto VALUES ('OR-128','Camelia japonica ejemplar','Ornamentales','200-250','Viveros EL OASIS','Arbusto excepcional por su floraci�n oto�al, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el �pice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de di� metro y tienen 5 s�palos y 5 p�talos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,98,78);
INSERT INTO producto VALUES ('OR-129','Camelia japonica ejemplar','Ornamentales','250-300','Viveros EL OASIS','Arbusto excepcional por su floraci�n oto�al, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el �pice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de di� metro y tienen 5 s�palos y 5 p�talos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.',50,110,88);
INSERT INTO producto VALUES ('OR-130','Callistemom COPA','Ornamentales','110/120','Viveros EL OASIS','Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ah� lo de \"llor�n\")..',50,18,14);
INSERT INTO producto VALUES ('OR-131','Leptospermum formado PIRAMIDE','Ornamentales','80-100','Viveros EL OASIS','',50,18,14);
INSERT INTO producto VALUES ('OR-132','Leptospermum COPA','Ornamentales','110/120','Viveros EL OASIS','',50,18,14);
INSERT INTO producto VALUES ('OR-133','Nerium oleander-CALIDAD \"GARDEN\"','Ornamentales','40-45','Viveros EL OASIS','',50,2,1);
INSERT INTO producto VALUES ('OR-134','Nerium Oleander Arbusto GRANDE','Ornamentales','160-200','Viveros EL OASIS','',100,38,30);
INSERT INTO producto VALUES ('OR-135','Nerium oleander COPA  Calibre 6/8','Ornamentales','50-60','Viveros EL OASIS','',100,5,4);
INSERT INTO producto VALUES ('OR-136','Nerium oleander ARBOL Calibre 8/10','Ornamentales','225-250','Viveros EL OASIS','',100,18,14);
INSERT INTO producto VALUES ('OR-137','ROSAL TREPADOR','Ornamentales','','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-138','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Ornamentales','','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-139','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Ornamentales','','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-140','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Ornamentales','','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-141','Pitimini rojo','Ornamentales','','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-142','Solanum Jazminoide','Ornamentales','150-160','Viveros EL OASIS','',100,2,1);
INSERT INTO producto VALUES ('OR-143','Wisteria Sinensis  azul, rosa, blanca','Ornamentales','','Viveros EL OASIS','',100,9,7);
INSERT INTO producto VALUES ('OR-144','Wisteria Sinensis INJERTADAS DECÓ','Ornamentales','140-150','Viveros EL OASIS','',100,12,9);
INSERT INTO producto VALUES ('OR-145','Bougamvillea Sanderiana Tutor','Ornamentales','80-100','Viveros EL OASIS','',100,2,1);
INSERT INTO producto VALUES ('OR-146','Bougamvillea Sanderiana Tutor','Ornamentales','125-150','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-147','Bougamvillea Sanderiana Tutor','Ornamentales','180-200','Viveros EL OASIS','',100,7,5);
INSERT INTO producto VALUES ('OR-148','Bougamvillea Sanderiana Espaldera','Ornamentales','45-50','Viveros EL OASIS','',100,7,5);
INSERT INTO producto VALUES ('OR-149','Bougamvillea Sanderiana Espaldera','Ornamentales','140-150','Viveros EL OASIS','',100,17,13);
INSERT INTO producto VALUES ('OR-150','Bougamvillea roja, naranja','Ornamentales','110-130','Viveros EL OASIS','',100,2,1);
INSERT INTO producto VALUES ('OR-151','Bougamvillea Sanderiana, 3 tut. piramide','Ornamentales','','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-152','Expositor �rboles clima continental','Ornamentales','170-200','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-153','Expositor �rboles clima mediterr�neo','Ornamentales','170-200','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-154','Expositor �rboles borde del mar','Ornamentales','170-200','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-155','Acer Negundo  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-156','Acer platanoides  ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8);
INSERT INTO producto VALUES ('OR-157','Acer Pseudoplatanus ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8);
INSERT INTO producto VALUES ('OR-158','Brachychiton Acerifolius  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-159','Brachychiton Discolor  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-160','Brachychiton Rupestris','Ornamentales','170-200','Viveros EL OASIS','',100,10,8);
INSERT INTO producto VALUES ('OR-161','Cassia Corimbosa  ','Ornamentales','200-225','Viveros EL OASIS','',100,6,4);
INSERT INTO producto VALUES ('OR-162','Cassia Corimbosa ','Ornamentales','200-225','Viveros EL OASIS','',100,10,8);
INSERT INTO producto VALUES ('OR-163','Chitalpa Summer Bells   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-164','Erytrina Kafra','Ornamentales','170-180','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-165','Erytrina Kafra','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-166','Eucalyptus Citriodora  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-167','Eucalyptus Ficifolia  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-168','Eucalyptus Ficifolia   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-169','Hibiscus Syriacus  Var. Injertadas 1 Tallo ','Ornamentales','170-200','Viveros EL OASIS','',80,12,9);
INSERT INTO producto VALUES ('OR-170','Lagunaria Patersonii  ','Ornamentales','140-150','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-171','Lagunaria Patersonii   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-172','Lagunaria patersonii  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS','',80,18,14);
INSERT INTO producto VALUES ('OR-173','Morus Alba  ','Ornamentales','200-225','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-174','Morus Alba  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS','',80,18,14);
INSERT INTO producto VALUES ('OR-175','Platanus Acerifolia   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-176','Prunus pisardii  ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-177','Robinia Pseudoacacia Casque Rouge   ','Ornamentales','200-225','Viveros EL OASIS','',80,15,12);
INSERT INTO producto VALUES ('OR-178','Salix Babylonica  Pendula  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-179','Sesbania Punicea   ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-180','Tamarix  Ramosissima Pink Cascade   ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-181','Tamarix  Ramosissima Pink Cascade   ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-182','Tecoma Stands   ','Ornamentales','200-225','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-183','Tecoma Stands  ','Ornamentales','200-225','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-184','Tipuana Tipu  ','Ornamentales','170-200','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-185','Pleioblastus distichus-Bamb� enano','Ornamentales','15-20','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-186','Sasa palmata ','Ornamentales','20-30','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-187','Sasa palmata ','Ornamentales','40-45','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-188','Sasa palmata ','Ornamentales','50-60','Viveros EL OASIS','',80,25,20);
INSERT INTO producto VALUES ('OR-189','Phylostachys aurea','Ornamentales','180-200','Viveros EL OASIS','',80,22,17);
INSERT INTO producto VALUES ('OR-190','Phylostachys aurea','Ornamentales','250-300','Viveros EL OASIS','',80,32,25);
INSERT INTO producto VALUES ('OR-191','Phylostachys Bambusa Spectabilis','Ornamentales','180-200','Viveros EL OASIS','',80,24,19);
INSERT INTO producto VALUES ('OR-192','Phylostachys biseti','Ornamentales','160-170','Viveros EL OASIS','',80,22,17);
INSERT INTO producto VALUES ('OR-193','Phylostachys biseti','Ornamentales','160-180','Viveros EL OASIS','',80,20,16);
INSERT INTO producto VALUES ('OR-194','Pseudosasa japonica (Metake)','Ornamentales','225-250','Viveros EL OASIS','',80,20,16);
INSERT INTO producto VALUES ('OR-195','Pseudosasa japonica (Metake) ','Ornamentales','30-40','Viveros EL OASIS','',80,6,4);
INSERT INTO producto VALUES ('OR-196','Cedrus Deodara ','Ornamentales','80-100','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-197','Cedrus Deodara \"Feeling Blue\" Novedad','Ornamentales','rastrero','Viveros EL OASIS','',80,12,9);
INSERT INTO producto VALUES ('OR-198','Juniperus chinensis \"Blue Alps\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-199','Juniperus Chinensis Stricta','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-200','Juniperus horizontalis Wiltonii','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-201','Juniperus squamata \"Blue Star\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-202','Juniperus x media Phitzeriana verde','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-203','Pinus Canariensis','Ornamentales','80-100','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-204','Pinus Halepensis','Ornamentales','160-180','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-205','Pinus Pinea -Pino Pi�onero','Ornamentales','70-80','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-206','Thuja Esmeralda ','Ornamentales','80-100','Viveros EL OASIS','',80,5,4);
INSERT INTO producto VALUES ('OR-207','Tuja Occidentalis Woodwardii','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-208','Tuja orientalis \"Aurea nana\"','Ornamentales','20-30','Viveros EL OASIS','',80,4,3);
INSERT INTO producto VALUES ('OR-209','Archontophoenix Cunninghamiana','Ornamentales','80 - 100','Viveros EL OASIS','',80,10,8);
INSERT INTO producto VALUES ('OR-210','Beucarnea Recurvata','Ornamentales','130  - 150','Viveros EL OASIS','',2,39,31);
INSERT INTO producto VALUES ('OR-211','Beucarnea Recurvata','Ornamentales','180 - 200','Viveros EL OASIS','',5,59,47);
INSERT INTO producto VALUES ('OR-212','Bismarckia Nobilis','Ornamentales','200 - 220','Viveros EL OASIS','',4,217,173);
INSERT INTO producto VALUES ('OR-213','Bismarckia Nobilis','Ornamentales','240 - 260','Viveros EL OASIS','',4,266,212);
INSERT INTO producto VALUES ('OR-214','Brahea Armata','Ornamentales','45 - 60','Viveros EL OASIS','',0,10,8);
INSERT INTO producto VALUES ('OR-215','Brahea Armata','Ornamentales','120 - 140','Viveros EL OASIS','',100,112,89);
INSERT INTO producto VALUES ('OR-216','Brahea Edulis','Ornamentales','80 - 100','Viveros EL OASIS','',100,19,15);
INSERT INTO producto VALUES ('OR-217','Brahea Edulis','Ornamentales','140 - 160','Viveros EL OASIS','',100,64,51);
INSERT INTO producto VALUES ('OR-218','Butia Capitata','Ornamentales','70 - 90','Viveros EL OASIS','',100,25,20);
INSERT INTO producto VALUES ('OR-219','Butia Capitata','Ornamentales','90 - 110','Viveros EL OASIS','',100,29,23);
INSERT INTO producto VALUES ('OR-220','Butia Capitata','Ornamentales','90 - 120','Viveros EL OASIS','',100,36,28);
INSERT INTO producto VALUES ('OR-221','Butia Capitata','Ornamentales','85 - 105','Viveros EL OASIS','',100,59,47);
INSERT INTO producto VALUES ('OR-222','Butia Capitata','Ornamentales','130 - 150','Viveros EL OASIS','',100,87,69);
INSERT INTO producto VALUES ('OR-223','Chamaerops Humilis','Ornamentales','40 - 45','Viveros EL OASIS','',100,4,3);
INSERT INTO producto VALUES ('OR-224','Chamaerops Humilis','Ornamentales','50 - 60','Viveros EL OASIS','',100,7,5);
INSERT INTO producto VALUES ('OR-225','Chamaerops Humilis','Ornamentales','70 - 90','Viveros EL OASIS','',100,10,8);
INSERT INTO producto VALUES ('OR-226','Chamaerops Humilis','Ornamentales','115 - 130','Viveros EL OASIS','',100,38,30);
INSERT INTO producto VALUES ('OR-227','Chamaerops Humilis','Ornamentales','130 - 150','Viveros EL OASIS','',100,64,51);
INSERT INTO producto VALUES ('OR-228','Chamaerops Humilis \"Cerifera\"','Ornamentales','70 - 80','Viveros EL OASIS','',100,32,25);
INSERT INTO producto VALUES ('OR-229','Chrysalidocarpus Lutescens -ARECA','Ornamentales','130 - 150','Viveros EL OASIS','',100,22,17);
INSERT INTO producto VALUES ('OR-230','Cordyline Australis -DRACAENA','Ornamentales','190 - 210','Viveros EL OASIS','',100,38,30);
INSERT INTO producto VALUES ('OR-231','Cycas Revoluta','Ornamentales','55 - 65','Viveros EL OASIS','',100,15,12);
INSERT INTO producto VALUES ('OR-232','Cycas Revoluta','Ornamentales','80 - 90','Viveros EL OASIS','',100,34,27);
INSERT INTO producto VALUES ('OR-233','Dracaena Drago','Ornamentales','60 - 70','Viveros EL OASIS','',1,13,10);
INSERT INTO producto VALUES ('OR-234','Dracaena Drago','Ornamentales','130 - 150','Viveros EL OASIS','',2,64,51);
INSERT INTO producto VALUES ('OR-235','Dracaena Drago','Ornamentales','150 - 175','Viveros EL OASIS','',2,92,73);
INSERT INTO producto VALUES ('OR-236','Jubaea Chilensis','Ornamentales','','Viveros EL OASIS','',100,49,39);
INSERT INTO producto VALUES ('OR-237','Livistonia Australis','Ornamentales','100 - 125','Viveros EL OASIS','',50,19,15);
INSERT INTO producto VALUES ('OR-238','Livistonia Decipiens','Ornamentales','90 - 110','Viveros EL OASIS','',50,19,15);
INSERT INTO producto VALUES ('OR-239','Livistonia Decipiens','Ornamentales','180 - 200','Viveros EL OASIS','',50,49,39);
INSERT INTO producto VALUES ('OR-240','Phoenix Canariensis','Ornamentales','110 - 130','Viveros EL OASIS','',50,6,4);
INSERT INTO producto VALUES ('OR-241','Phoenix Canariensis','Ornamentales','180 - 200','Viveros EL OASIS','',50,19,15);
INSERT INTO producto VALUES ('OR-242','Rhaphis Excelsa','Ornamentales','80 - 100','Viveros EL OASIS','',50,21,16);
INSERT INTO producto VALUES ('OR-243','Rhaphis Humilis','Ornamentales','150- 170','Viveros EL OASIS','',50,64,51);
INSERT INTO producto VALUES ('OR-244','Sabal Minor','Ornamentales','60 - 75','Viveros EL OASIS','',50,11,8);
INSERT INTO producto VALUES ('OR-245','Sabal Minor','Ornamentales','120 - 140','Viveros EL OASIS','',50,34,27);
INSERT INTO producto VALUES ('OR-246','Trachycarpus Fortunei','Ornamentales','90 - 105','Viveros EL OASIS','',50,18,14);
INSERT INTO producto VALUES ('OR-247','Trachycarpus Fortunei','Ornamentales','250-300','Viveros EL OASIS','',2,462,369);
INSERT INTO producto VALUES ('OR-248','Washingtonia Robusta','Ornamentales','60 - 70','Viveros EL OASIS','',15,3,2);
INSERT INTO producto VALUES ('OR-249','Washingtonia Robusta','Ornamentales','130 - 150','Viveros EL OASIS','',15,5,4);
INSERT INTO producto VALUES ('OR-250','Yucca Jewel','Ornamentales','80 - 105','Viveros EL OASIS','',15,10,8);
INSERT INTO producto VALUES ('OR-251','Zamia Furfuracaea','Ornamentales','90 - 110','Viveros EL OASIS','',15,168,134);
INSERT INTO producto VALUES ('OR-99','Mimosa DEALBATA Gaulois Astier  ','Ornamentales','200-225','Viveros EL OASIS','Acacia dealbata. Nombre com�n o vulgar: Mimosa fina, Mimosa, Mimosa com�n, Mimosa plateada, Aromo franc�s. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floraci�n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r�pido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre�idos entre las semillas, que se disponen en el fruto longitudinalmente...',100,14,11);

INSERT INTO detalle_pedido VALUES (1,'FR-67',10,70,3);
INSERT INTO detalle_pedido VALUES (1,'OR-127',40,4,1);
INSERT INTO detalle_pedido VALUES (1,'OR-141',25,4,2);
INSERT INTO detalle_pedido VALUES (1,'OR-241',15,19,4);
INSERT INTO detalle_pedido VALUES (1,'OR-99',23,14,5);
INSERT INTO detalle_pedido VALUES (2,'FR-4',3,29,6);
INSERT INTO detalle_pedido VALUES (2,'FR-40',7,8,7);
INSERT INTO detalle_pedido VALUES (2,'OR-140',50,4,3);
INSERT INTO detalle_pedido VALUES (2,'OR-141',20,5,2);
INSERT INTO detalle_pedido VALUES (2,'OR-159',12,6,5);
INSERT INTO detalle_pedido VALUES (2,'OR-227',67,64,1);
INSERT INTO detalle_pedido VALUES (2,'OR-247',5,462,4);
INSERT INTO detalle_pedido VALUES (3,'FR-48',120,9,6);
INSERT INTO detalle_pedido VALUES (3,'OR-122',32,5,4);
INSERT INTO detalle_pedido VALUES (3,'OR-123',11,5,5);
INSERT INTO detalle_pedido VALUES (3,'OR-213',30,266,1);
INSERT INTO detalle_pedido VALUES (3,'OR-217',15,65,2);
INSERT INTO detalle_pedido VALUES (3,'OR-218',24,25,3);
INSERT INTO detalle_pedido VALUES (4,'FR-31',12,8,7);
INSERT INTO detalle_pedido VALUES (4,'FR-34',42,8,6);
INSERT INTO detalle_pedido VALUES (4,'FR-40',42,9,8);
INSERT INTO detalle_pedido VALUES (4,'OR-152',3,6,5);
INSERT INTO detalle_pedido VALUES (4,'OR-155',4,6,3);
INSERT INTO detalle_pedido VALUES (4,'OR-156',17,9,4);
INSERT INTO detalle_pedido VALUES (4,'OR-157',38,10,2);
INSERT INTO detalle_pedido VALUES (4,'OR-222',21,59,1);
INSERT INTO detalle_pedido VALUES (8,'FR-106',3,11,1);
INSERT INTO detalle_pedido VALUES (8,'FR-108',1,32,2);
INSERT INTO detalle_pedido VALUES (8,'FR-11',10,100,3);
INSERT INTO detalle_pedido VALUES (9,'AR-001',80,1,3);


INSERT INTO detalle_pedido VALUES (9,'AR-008',450,1,2);


INSERT INTO detalle_pedido VALUES (9,'FR-106',80,8,1);
INSERT INTO detalle_pedido VALUES (9,'FR-69',15,91,2);
INSERT INTO detalle_pedido VALUES (10,'FR-82',5,70,2);
INSERT INTO detalle_pedido VALUES (10,'FR-91',30,75,1);
INSERT INTO detalle_pedido VALUES (10,'OR-234',5,64,3);
INSERT INTO detalle_pedido VALUES (11,'AR-006',180,1,3);
INSERT INTO detalle_pedido VALUES (11,'OR-247',80,8,1);


INSERT INTO detalle_pedido VALUES (12,'AR-009',290,1,1);


INSERT INTO detalle_pedido VALUES (13,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (13,'21636',12,14,2);
INSERT INTO detalle_pedido VALUES (13,'FR-11',5,100,3);
INSERT INTO detalle_pedido VALUES (14,'FR-100',8,11,2);
INSERT INTO detalle_pedido VALUES (14,'FR-13',13,57,1);
INSERT INTO detalle_pedido VALUES (15,'FR-84',4,13,3);
INSERT INTO detalle_pedido VALUES (15,'OR-101',2,6,2);
INSERT INTO detalle_pedido VALUES (15,'OR-156',6,10,1);
INSERT INTO detalle_pedido VALUES (15,'OR-203',9,10,4);
INSERT INTO detalle_pedido VALUES (16,'30310',12,12,1);
INSERT INTO detalle_pedido VALUES (16,'FR-36',10,9,2);
INSERT INTO detalle_pedido VALUES (17,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (17,'22225',5,12,3);
INSERT INTO detalle_pedido VALUES (17,'FR-37',5,9,2);
INSERT INTO detalle_pedido VALUES (17,'FR-64',5,22,4);
INSERT INTO detalle_pedido VALUES (17,'OR-136',5,18,5);
INSERT INTO detalle_pedido VALUES (18,'22225',4,12,2);
INSERT INTO detalle_pedido VALUES (18,'FR-22',2,4,1);
INSERT INTO detalle_pedido VALUES (18,'OR-159',10,6,3);
INSERT INTO detalle_pedido VALUES (19,'30310',9,12,5);
INSERT INTO detalle_pedido VALUES (19,'FR-23',6,8,4);
INSERT INTO detalle_pedido VALUES (19,'FR-75',1,32,2);
INSERT INTO detalle_pedido VALUES (19,'FR-84',5,13,1);
INSERT INTO detalle_pedido VALUES (19,'OR-208',20,4,3);
INSERT INTO detalle_pedido VALUES (20,'11679',14,14,1);
INSERT INTO detalle_pedido VALUES (20,'30310',8,12,2);
INSERT INTO detalle_pedido VALUES (21,'21636',5,14,3);
INSERT INTO detalle_pedido VALUES (21,'FR-18',22,4,1);
INSERT INTO detalle_pedido VALUES (21,'FR-53',3,8,2);
INSERT INTO detalle_pedido VALUES (22,'OR-240',1,6,1);
INSERT INTO detalle_pedido VALUES (23,'AR-002',110,1,4);
INSERT INTO detalle_pedido VALUES (23,'FR-107',50,22,3);
INSERT INTO detalle_pedido VALUES (23,'FR-85',4,70,2);
INSERT INTO detalle_pedido VALUES (23,'OR-249',30,5,1);
INSERT INTO detalle_pedido VALUES (24,'22225',3,15,1);
INSERT INTO detalle_pedido VALUES (24,'FR-1',4,7,4);
INSERT INTO detalle_pedido VALUES (24,'FR-23',2,7,2);
INSERT INTO detalle_pedido VALUES (24,'OR-241',10,20,3);
INSERT INTO detalle_pedido VALUES (25,'FR-77',15,69,1);
INSERT INTO detalle_pedido VALUES (25,'FR-9',4,30,3);
INSERT INTO detalle_pedido VALUES (25,'FR-94',10,30,2);
INSERT INTO detalle_pedido VALUES (26,'FR-15',9,25,3);
INSERT INTO detalle_pedido VALUES (26,'OR-188',4,25,1);
INSERT INTO detalle_pedido VALUES (26,'OR-218',14,25,2);
INSERT INTO detalle_pedido VALUES (27,'OR-101',22,6,2);
INSERT INTO detalle_pedido VALUES (27,'OR-102',22,6,3);
INSERT INTO detalle_pedido VALUES (27,'OR-186',40,6,1);
INSERT INTO detalle_pedido VALUES (28,'FR-11',8,99,3);
INSERT INTO detalle_pedido VALUES (28,'OR-213',3,266,2);
INSERT INTO detalle_pedido VALUES (28,'OR-247',1,462,1);
INSERT INTO detalle_pedido VALUES (29,'FR-82',4,70,4);
INSERT INTO detalle_pedido VALUES (29,'FR-9',4,28,1);
INSERT INTO detalle_pedido VALUES (29,'FR-94',20,31,5);
INSERT INTO detalle_pedido VALUES (29,'OR-129',2,111,2);
INSERT INTO detalle_pedido VALUES (29,'OR-160',10,9,3);
INSERT INTO detalle_pedido VALUES (30,'AR-004',10,1,6);
INSERT INTO detalle_pedido VALUES (30,'FR-108',2,32,2);
INSERT INTO detalle_pedido VALUES (30,'FR-12',2,19,3);
INSERT INTO detalle_pedido VALUES (30,'FR-72',4,31,5);
INSERT INTO detalle_pedido VALUES (30,'FR-89',10,45,1);
INSERT INTO detalle_pedido VALUES (30,'OR-120',5,5,4);


INSERT INTO detalle_pedido VALUES (31,'AR-009',25,2,3);


INSERT INTO detalle_pedido VALUES (31,'FR-102',1,20,1);
INSERT INTO detalle_pedido VALUES (31,'FR-4',6,29,2);
INSERT INTO detalle_pedido VALUES (32,'11679',1,14,4);
INSERT INTO detalle_pedido VALUES (32,'21636',4,15,5);
INSERT INTO detalle_pedido VALUES (32,'22225',1,15,3);
INSERT INTO detalle_pedido VALUES (32,'OR-128',29,100,2);
INSERT INTO detalle_pedido VALUES (32,'OR-193',5,20,1);
INSERT INTO detalle_pedido VALUES (33,'FR-17',423,2,4);
INSERT INTO detalle_pedido VALUES (33,'FR-29',120,8,3);
INSERT INTO detalle_pedido VALUES (33,'OR-214',212,10,2);
INSERT INTO detalle_pedido VALUES (33,'OR-247',150,462,1);
INSERT INTO detalle_pedido VALUES (34,'FR-3',56,7,4);
INSERT INTO detalle_pedido VALUES (34,'FR-7',12,29,3);
INSERT INTO detalle_pedido VALUES (34,'OR-172',20,18,1);
INSERT INTO detalle_pedido VALUES (34,'OR-174',24,18,2);
INSERT INTO detalle_pedido VALUES (35,'21636',12,14,4);
INSERT INTO detalle_pedido VALUES (35,'FR-47',55,8,3);
INSERT INTO detalle_pedido VALUES (35,'OR-165',3,10,2);
INSERT INTO detalle_pedido VALUES (35,'OR-181',36,10,1);
INSERT INTO detalle_pedido VALUES (35,'OR-225',72,10,5);
INSERT INTO detalle_pedido VALUES (36,'30310',4,12,2);
INSERT INTO detalle_pedido VALUES (36,'FR-1',2,7,3);
INSERT INTO detalle_pedido VALUES (36,'OR-147',6,7,4);
INSERT INTO detalle_pedido VALUES (36,'OR-203',1,12,5);
INSERT INTO detalle_pedido VALUES (36,'OR-99',15,13,1);
INSERT INTO detalle_pedido VALUES (37,'FR-105',4,70,1);
INSERT INTO detalle_pedido VALUES (37,'FR-57',203,8,2);
INSERT INTO detalle_pedido VALUES (37,'OR-176',38,10,3);
INSERT INTO detalle_pedido VALUES (38,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (38,'21636',2,14,2);
INSERT INTO detalle_pedido VALUES (39,'22225',3,12,1);
INSERT INTO detalle_pedido VALUES (39,'30310',6,12,2);
INSERT INTO detalle_pedido VALUES (40,'AR-001',4,1,1);
INSERT INTO detalle_pedido VALUES (40,'AR-002',8,1,2);
INSERT INTO detalle_pedido VALUES (41,'AR-003',5,1,1);
INSERT INTO detalle_pedido VALUES (41,'AR-004',5,1,2);
INSERT INTO detalle_pedido VALUES (42,'AR-005',3,1,1);
INSERT INTO detalle_pedido VALUES (42,'AR-006',1,1,2);
INSERT INTO detalle_pedido VALUES (43,'AR-007',9,1,1);



INSERT INTO detalle_pedido VALUES (44,'AR-008',5,1,1);


INSERT INTO detalle_pedido VALUES (45,'AR-009',6,1,1);


INSERT INTO detalle_pedido VALUES (45,'AR-010',4,1,2);
INSERT INTO detalle_pedido VALUES (46,'FR-1',4,7,1);
INSERT INTO detalle_pedido VALUES (46,'FR-10',8,7,2);
INSERT INTO detalle_pedido VALUES (47,'FR-100',9,11,1);
INSERT INTO detalle_pedido VALUES (47,'FR-101',5,13,2);
INSERT INTO detalle_pedido VALUES (48,'FR-102',1,18,1);
INSERT INTO detalle_pedido VALUES (48,'FR-103',1,25,2);
INSERT INTO detalle_pedido VALUES (48,'OR-234',50,64,1);
INSERT INTO detalle_pedido VALUES (48,'OR-236',45,49,2);
INSERT INTO detalle_pedido VALUES (48,'OR-237',50,19,3);
INSERT INTO detalle_pedido VALUES (49,'OR-204',50,10,1);
INSERT INTO detalle_pedido VALUES (49,'OR-205',10,10,2);
INSERT INTO detalle_pedido VALUES (49,'OR-206',5,5,3);
INSERT INTO detalle_pedido VALUES (50,'OR-225',12,10,1);
INSERT INTO detalle_pedido VALUES (50,'OR-226',15,38,2);
INSERT INTO detalle_pedido VALUES (50,'OR-227',44,64,3);
INSERT INTO detalle_pedido VALUES (51,'OR-209',50,10,1);
INSERT INTO detalle_pedido VALUES (51,'OR-210',80,39,2);
INSERT INTO detalle_pedido VALUES (51,'OR-211',70,59,3);
INSERT INTO detalle_pedido VALUES (53,'FR-2',1,7,1);
INSERT INTO detalle_pedido VALUES (53,'FR-85',1,70,3);
INSERT INTO detalle_pedido VALUES (53,'FR-86',2,11,2);
INSERT INTO detalle_pedido VALUES (53,'OR-116',6,7,4);
INSERT INTO detalle_pedido VALUES (54,'11679',3,14,3);
INSERT INTO detalle_pedido VALUES (54,'FR-100',45,10,2);
INSERT INTO detalle_pedido VALUES (54,'FR-18',5,4,1);
INSERT INTO detalle_pedido VALUES (54,'FR-79',3,22,4);
INSERT INTO detalle_pedido VALUES (54,'OR-116',8,7,6);
INSERT INTO detalle_pedido VALUES (54,'OR-123',3,5,5);
INSERT INTO detalle_pedido VALUES (54,'OR-168',2,10,7);
INSERT INTO detalle_pedido VALUES (55,'OR-115',9,7,1);
INSERT INTO detalle_pedido VALUES (55,'OR-213',2,266,2);
INSERT INTO detalle_pedido VALUES (55,'OR-227',6,64,5);
INSERT INTO detalle_pedido VALUES (55,'OR-243',2,64,4);
INSERT INTO detalle_pedido VALUES (55,'OR-247',1,462,3);
INSERT INTO detalle_pedido VALUES (56,'OR-129',1,115,5);
INSERT INTO detalle_pedido VALUES (56,'OR-130',10,18,6);
INSERT INTO detalle_pedido VALUES (56,'OR-179',1,6,3);
INSERT INTO detalle_pedido VALUES (56,'OR-196',3,10,4);
INSERT INTO detalle_pedido VALUES (56,'OR-207',4,4,2);
INSERT INTO detalle_pedido VALUES (56,'OR-250',3,10,1);
INSERT INTO detalle_pedido VALUES (57,'FR-69',6,91,4);
INSERT INTO detalle_pedido VALUES (57,'FR-81',3,49,3);
INSERT INTO detalle_pedido VALUES (57,'FR-84',2,13,1);
INSERT INTO detalle_pedido VALUES (57,'FR-94',6,9,2);
INSERT INTO detalle_pedido VALUES (58,'OR-102',65,18,3);
INSERT INTO detalle_pedido VALUES (58,'OR-139',80,4,1);
INSERT INTO detalle_pedido VALUES (58,'OR-172',69,15,2);
INSERT INTO detalle_pedido VALUES (58,'OR-177',150,15,4);
INSERT INTO detalle_pedido VALUES (74,'FR-67',15,70,1);
INSERT INTO detalle_pedido VALUES (74,'OR-227',34,64,2);
INSERT INTO detalle_pedido VALUES (74,'OR-247',42,8,3);
INSERT INTO detalle_pedido VALUES (75,'AR-006',60,1,2);
INSERT INTO detalle_pedido VALUES (75,'FR-87',24,22,3);
INSERT INTO detalle_pedido VALUES (75,'OR-157',46,10,1);


INSERT INTO detalle_pedido VALUES (76,'AR-009',250,1,5);


INSERT INTO detalle_pedido VALUES (76,'FR-79',40,22,3);
INSERT INTO detalle_pedido VALUES (76,'FR-87',24,22,4);
INSERT INTO detalle_pedido VALUES (76,'FR-94',35,9,1);
INSERT INTO detalle_pedido VALUES (76,'OR-196',25,10,2);
INSERT INTO detalle_pedido VALUES (77,'22225',34,12,2);
INSERT INTO detalle_pedido VALUES (77,'30310',15,12,1);
INSERT INTO detalle_pedido VALUES (78,'FR-53',25,8,2);
INSERT INTO detalle_pedido VALUES (78,'FR-85',56,70,3);
INSERT INTO detalle_pedido VALUES (78,'OR-157',42,10,4);
INSERT INTO detalle_pedido VALUES (78,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (79,'OR-240',50,6,1);
INSERT INTO detalle_pedido VALUES (80,'FR-11',40,100,3);
INSERT INTO detalle_pedido VALUES (80,'FR-36',47,9,2);
INSERT INTO detalle_pedido VALUES (80,'OR-136',75,18,1);
INSERT INTO detalle_pedido VALUES (81,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (82,'OR-227',34,64,1);
INSERT INTO detalle_pedido VALUES (83,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (89,'FR-108',3,32,2);
INSERT INTO detalle_pedido VALUES (89,'FR-3',15,7,6);
INSERT INTO detalle_pedido VALUES (89,'FR-42',12,8,4);
INSERT INTO detalle_pedido VALUES (89,'FR-66',5,49,1);
INSERT INTO detalle_pedido VALUES (89,'FR-87',4,22,3);
INSERT INTO detalle_pedido VALUES (89,'OR-157',8,10,5);
INSERT INTO detalle_pedido VALUES (90,'AR-001',19,1,1);
INSERT INTO detalle_pedido VALUES (90,'AR-002',10,1,2);
INSERT INTO detalle_pedido VALUES (90,'AR-003',12,1,3);
INSERT INTO detalle_pedido VALUES (91,'FR-100',52,11,1);
INSERT INTO detalle_pedido VALUES (91,'FR-101',14,13,2);
INSERT INTO detalle_pedido VALUES (91,'FR-102',35,18,3);
INSERT INTO detalle_pedido VALUES (92,'FR-108',12,23,1);
INSERT INTO detalle_pedido VALUES (92,'FR-11',20,100,2);
INSERT INTO detalle_pedido VALUES (92,'FR-12',30,21,3);
INSERT INTO detalle_pedido VALUES (93,'FR-54',25,9,1);
INSERT INTO detalle_pedido VALUES (93,'FR-58',51,11,2);
INSERT INTO detalle_pedido VALUES (93,'FR-60',3,32,3);
INSERT INTO detalle_pedido VALUES (94,'11679',12,14,1);
INSERT INTO detalle_pedido VALUES (94,'FR-11',33,100,3);
INSERT INTO detalle_pedido VALUES (94,'FR-4',79,29,2);
INSERT INTO detalle_pedido VALUES (95,'FR-10',9,7,2);
INSERT INTO detalle_pedido VALUES (95,'FR-75',6,32,1);
INSERT INTO detalle_pedido VALUES (95,'FR-82',5,70,3);
INSERT INTO detalle_pedido VALUES (96,'FR-43',6,8,1);
INSERT INTO detalle_pedido VALUES (96,'FR-6',16,7,4);
INSERT INTO detalle_pedido VALUES (96,'FR-71',10,22,3);
INSERT INTO detalle_pedido VALUES (96,'FR-90',4,70,2);
INSERT INTO detalle_pedido VALUES (97,'FR-41',12,8,1);
INSERT INTO detalle_pedido VALUES (97,'FR-54',14,9,2);
INSERT INTO detalle_pedido VALUES (97,'OR-156',10,10,3);
INSERT INTO detalle_pedido VALUES (98,'FR-33',14,8,4);
INSERT INTO detalle_pedido VALUES (98,'FR-56',16,8,3);
INSERT INTO detalle_pedido VALUES (98,'FR-60',8,32,1);
INSERT INTO detalle_pedido VALUES (98,'FR-8',18,6,5);
INSERT INTO detalle_pedido VALUES (98,'FR-85',6,70,2);
INSERT INTO detalle_pedido VALUES (99,'OR-157',15,10,2);
INSERT INTO detalle_pedido VALUES (99,'OR-227',30,64,1);
INSERT INTO detalle_pedido VALUES (100,'FR-87',20,22,1);
INSERT INTO detalle_pedido VALUES (100,'FR-94',40,9,2);
INSERT INTO detalle_pedido VALUES (101,'AR-006',50,1,1);



INSERT INTO detalle_pedido VALUES (101,'AR-009',159,1,2);



INSERT INTO detalle_pedido VALUES (102,'22225',32,12,2);
INSERT INTO detalle_pedido VALUES (102,'30310',23,12,1);
INSERT INTO detalle_pedido VALUES (103,'FR-53',12,8,2);
INSERT INTO detalle_pedido VALUES (103,'OR-208',52,4,1);
INSERT INTO detalle_pedido VALUES (104,'FR-85',9,70,1);
INSERT INTO detalle_pedido VALUES (104,'OR-157',113,10,2);
INSERT INTO detalle_pedido VALUES (105,'OR-227',21,64,2);
INSERT INTO detalle_pedido VALUES (105,'OR-240',27,6,1);


INSERT INTO detalle_pedido VALUES (106,'AR-009',231,1,1);



INSERT INTO detalle_pedido VALUES (106,'OR-136',47,18,2);
INSERT INTO detalle_pedido VALUES (107,'30310',143,12,2);
INSERT INTO detalle_pedido VALUES (107,'FR-11',15,100,1);
INSERT INTO detalle_pedido VALUES (108,'FR-53',53,8,1);
INSERT INTO detalle_pedido VALUES (108,'OR-208',59,4,2);
INSERT INTO detalle_pedido VALUES (109,'FR-22',8,4,5);
INSERT INTO detalle_pedido VALUES (109,'FR-36',12,9,3);
INSERT INTO detalle_pedido VALUES (109,'FR-45',14,8,4);
INSERT INTO detalle_pedido VALUES (109,'OR-104',20,10,1);
INSERT INTO detalle_pedido VALUES (109,'OR-119',10,5,2);
INSERT INTO detalle_pedido VALUES (109,'OR-125',3,5,6);
INSERT INTO detalle_pedido VALUES (109,'OR-130',2,18,7);
INSERT INTO detalle_pedido VALUES (110,'AR-010',6,1,3);
INSERT INTO detalle_pedido VALUES (110,'FR-1',14,7,1);
INSERT INTO detalle_pedido VALUES (110,'FR-16',1,45,2);
INSERT INTO detalle_pedido VALUES (116,'21636',5,14,1);
INSERT INTO detalle_pedido VALUES (116,'AR-001',32,1,2);
INSERT INTO detalle_pedido VALUES (116,'AR-005',18,1,5);
INSERT INTO detalle_pedido VALUES (116,'FR-33',13,8,3);
INSERT INTO detalle_pedido VALUES (116,'OR-200',10,4,4);
INSERT INTO detalle_pedido VALUES (117,'FR-78',2,15,1);
INSERT INTO detalle_pedido VALUES (117,'FR-80',1,32,3);
INSERT INTO detalle_pedido VALUES (117,'OR-146',17,4,2);
INSERT INTO detalle_pedido VALUES (117,'OR-179',4,6,4);
INSERT INTO detalle_pedido VALUES (128,'AR-004',15,1,1);
INSERT INTO detalle_pedido VALUES (128,'OR-150',18,2,2);
INSERT INTO detalle_pedido VALUES (52,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (59,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (60,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (61,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (62,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (63,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (64,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (65,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (66,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (67,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (68,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (111,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (112,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (113,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (114,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (115,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (118,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (119,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (120,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (121,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (122,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (123,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (124,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (125,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (126,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (127,'FR-67',10,70,1);

INSERT INTO pago VALUES (1,'PayPal','ak-std-000001','2008-11-10',2000);
INSERT INTO pago VALUES (1,'PayPal','ak-std-000002','2008-12-10',2000);
INSERT INTO pago VALUES (3,'PayPal','ak-std-000003','2009-01-16',5000);
INSERT INTO pago VALUES (3,'PayPal','ak-std-000004','2009-02-16',5000);
INSERT INTO pago VALUES (3,'PayPal','ak-std-000005','2009-02-19',926);
INSERT INTO pago VALUES (4,'PayPal','ak-std-000006','2007-01-08',20000);
INSERT INTO pago VALUES (4,'PayPal','ak-std-000007','2007-01-08',20000);
INSERT INTO pago VALUES (4,'PayPal','ak-std-000008','2007-01-08',20000);
INSERT INTO pago VALUES (4,'PayPal','ak-std-000009','2007-01-08',20000);
INSERT INTO pago VALUES (4,'PayPal','ak-std-000010','2007-01-08',1849);
INSERT INTO pago VALUES (5,'Transferencia','ak-std-000011','2006-01-18',23794);
INSERT INTO pago VALUES (7,'Cheque','ak-std-000012','2009-01-13',2390);
INSERT INTO pago VALUES (9,'PayPal','ak-std-000013','2009-01-06',929);
INSERT INTO pago VALUES (13,'PayPal','ak-std-000014','2008-08-04',2246);
INSERT INTO pago VALUES (14,'PayPal','ak-std-000015','2008-07-15',4160);
INSERT INTO pago VALUES (15,'PayPal','ak-std-000016','2009-01-15',2081);
INSERT INTO pago VALUES (15,'PayPal','ak-std-000035','2009-02-15',10000);
INSERT INTO pago VALUES (16,'PayPal','ak-std-000017','2009-02-16',4399);
INSERT INTO pago VALUES (19,'PayPal','ak-std-000018','2009-03-06',232);
INSERT INTO pago VALUES (23,'PayPal','ak-std-000019','2009-03-26',272);
INSERT INTO pago VALUES (26,'PayPal','ak-std-000020','2008-03-18',18846);
INSERT INTO pago VALUES (27,'PayPal','ak-std-000021','2009-02-08',10972);
INSERT INTO pago VALUES (28,'PayPal','ak-std-000022','2009-01-13',8489);
INSERT INTO pago VALUES (30,'PayPal','ak-std-000024','2009-01-16',7863);
INSERT INTO pago VALUES (35,'PayPal','ak-std-000025','2007-10-06',3321);
INSERT INTO pago VALUES (38,'PayPal','ak-std-000026','2006-05-26',1171);

/* 1.  Obt�n todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado �Demarcaciones�. */
/* 2.  Muestra todos los datos almacenados de todos los futbolistas. */
/* 3.  Se quieren todos los datos de los futbolistas pero con los siguientes alias de columna: "id", "nombre", "apellidos", "fecha de nacimiento", "posici�n", "salario actual", "identificador equipo actual" */
/* 4.  Devuelve los apellidos de los futbolistas que su posici�n sea DEFENSA. Aplica un alias a apellidos para que se muestre �Futbolista� y asigna el alias F a la tabla futbolistas. */
/* 5.  Devuelve los apellidos de los futbolistas que su posici�n sea DEFENSA ordenador de la Z a la A. */
/* 6.  Devuelve todos los datos de futbolistas ordenados primero por posici�n y luego por apellidos. */
/* 7.  Obt�n el nombre de los futbolistas que cobran m�s de 150.000 euros (SALARIO). */
/* 8.  Muestra el ID de los futbolistas cuyo apellido sea G�MEZ. */
/* 9.  Indica los apellidos de los futbolistas que empiezan por G. */
/* 10. Devuelve todos los datos de los futbolistas cuya posici�n sea DEFENSA o DELANTERO. */
/* 11. Obt�n el nombre de los futbolistas que cobran entre 100.000 y 200.000 euros (SALARIO). */
/* 12. Se va a hacer un aumento de sueldo de los PORTEROS. Para ello obt�n el nombre, apellido y el nuevo salario de los PORTEROS si se aumenta un 10% el que tienen actualmente.
       La lista debe estar ordenada alfab�ticamente por los apellidos. */
/* 13. Devuelve en una �nica columna el nombre del futbolista seguido de la palabra �es� y a continuaci�n la posici�n que ocupa. La columna debe llamarse �Posiciones�. */      
/* 14. Queremos saber todos los datos de los futbolistas que ganen m�s de 150.000 euros y sean defensas. */
/* 15. Realiza una consulta que te devuelva los campos Nombre, Salario, Salario bruto terminado en la palabra �euros� y llamando a esa columna �Salario
       bruto�. Nota: el salario bruto de un futbolista se obtiene a�adi�ndole el 50% de impuestos, es decir multiplicando por 1,5. */
/* 16. Calcula el valor absoluto de -10. */
/* 17. Obt�n el exponente en base e de 4. */
/* 18. Redondea el n�mero 15,3 a 16. */
/* 19. Redondea el n�mero anterior (15,3) a 15. */
/* 20. Calcula el resto de 15 entre 3 (15/3). */
/* 21. Eleva 15 al exponente 2 (152). */
/* 22. Redondea 15,789 con un decimal. */
/* 23. Obt�n la ra�z cuadrada de 128. */
/* 24. Trunca 15,789 a 1 decimal. */
/* 25. Trunca 15,789 para dejarlo sin decimales (15). */
/* 26. Trunca 157,89 para dejarlo en 100. */
/* 27. Obt�n el signo de -15 (es decir -1). */
/* 28. Obt�n en tres columnas independientes, el d�a, el mes y la fecha de hoy. */
/* 29. Muestra por pantalla la fecha que ser� dentro de 6 meses utilizando ADD_MONTHS. */
/* 30. Muestra el n�mero de meses que hay entre hoy y la fecha de nacimiento de todos los futbolistas. */
/* 31. �Cu�l es el �ltimo d�a de este mes? Mu�stralo. */
/* 32. �Qu� d�a ser� el pr�ximo lunes? Ponlo por pantalla mediante una petici�n. */
/* 33. Muestra el d�a que era hace 4 d�as. �Y el d�a dema�ana? */
/* 34. Convierte �1000.45� a un n�mero. */
/* 35. Convierte �1000.45�� a un n�mero. */
/* 36. Convierte �-$1000.45� a un n�mero. */
/* 37. Muestra el d�a de hoy con los siguientes formatos: 12/02/2021, 12/02/21, 12-feb-2021, 12 de febrero de 2021 */
/* 38. Convierte el ID de la tabla FUTBOLISTAS en un n�mero de tres cifras. */
/* 39. Muestra todos los a�os de nacimiento de los futbolistas (solo el a�o, ej.: 1990, 1991, etc.). Ord�nalos de menor a mayor a�o. */
/* 40. Utiliza la funci�n DECODE para mostrar, respecto de los EQUIPOS, el valor 1000k si el presupuesto es de 1000000, 
       2000k si el presupuesto es de 2000000, o 3000k si el presupuesto asciende a 3000000. Y si no es ninguna que ponga "ok" */
/* 41. �Cu�ntos futbolistas son delanteros? */
/* 42. Dame una lista con el n�mero de futbolistas que hay por cada posicion */
/* 43. Obt�n el nombre del futbolista m�s alto. */
/* 44. Indica los apellidos del futbolista m�s delgado. */
/* 45. �Cu�ntos futbolistas miden entre 1,75 y 1,82? */
/* 46. �Cu�l es la media de altura de los futbolistas con dos decimales? */
/* 47. �Cu�l es la media de peso de los futbolistas con un decimal? */
/* 48. �Cu�l es el futbolista que cobra m�s dinero? */
/* 49. �En qu� a�o naci� el futbolista que cobra menos dinero? */
/* 50. Calcula la media del sueldo de los futbolistas (con dos decimales) agrupado por la posici�n que ocupan. */
/* 51. Obt�n el n�mero de futbolistas en cada equipo. */
/* 52. Obt�n ahora el n�mero de futbolistas de cada equipo cuyo ID sea 1 o 2. */
/* 53. Devuelve el nombre del futbolista cuyo salario es el m�s bajo posible de todos los futbolistas nacidos entre 1985 y 1990. */
/* 54. Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo. */
/* 55. Muestra el nombre de los futbolistas seguido del nombre del equipo en el que juega utilizando JOIN � ON. */
/* 56. Calcular el numero de segundos transcurridos desde la ultima madianoche (m�scara 'sssss' en to_char). */
/* 57. Obt�n el nombre, apellidos y nombre del equipo de los futbolistas que sean defensas. */
/* 58. Seleccionar la fecha del sistema (nombre del d�a, d�a, nombre del mes, a�o, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del d�a o del mes. */
/* 59. Calcular el n�mero de d�as vividos hasta hoy por una persona nacida el d�a 3 de julio de 1970. */
/* 60. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisi�n. */
/* 61. Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo. Necesitas multitablas, futbolistas y equipos. EMPLEA WHERE para relacionar FK de futbolistas y PK de equipos.*/
/* 62. Calcular el n�mero de segundos transcurridos desde la �ltima medianoche (m�scara 'sssss' en to_char). */
/* 63. Obt�n el nombre, apellidos y nombre del equipo de los futbolistas que sean defensas. */
/* 64. Obt�n el nombre, apellidos y nombre del equipo de los futbolistas con un LEFT JOIN y un RIGHT JOIN. �Cu�l es la diferencia? */
/* 65. Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle. */
/* 66. Indica el id, nombre y sueldo de los empleados que est�n en departamentos donde haya otros compa�eros 
       empleados con una letra 'u' en su nombre, y que adem�s ganen sueldos mayores que la media de los sueldos de la empresa. */
/* 67. Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive. */ 
/* 68. Muestra el nombre y salario de los empleados que tengan a KING como jefe directo. */
/* 69. Muestra el no mbre y salario de los empleados que est�n en el mismo departamento de KING. */ 
/* 70. Devuelve el nombre y sueldo de los empleados que ganen m�s dinero que la media de la empresa, ordenado por sueldo de mayor a menor. */
/* 71. Mostrar los nombres de los empleados que tengan un salario mayor que el de JAMES. */
/* 72. Mostrar los nombres de los empleados que trabajan en el mismo departamento que SMITH. Ordena el resultado. */
/* 73. Mostrar qu� empleados del departamento donde trabaja FORD, ganan m�s que lo que gana JAMES. */
/* 74. �Cu�ntos empleados ganan menos que MILLER? */
/* 75. Calcular cuanto deber�a haber cobrado cada empleado en su primer a�o de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese a�o).*/
/* 76. Mostrar todos los datos de los empleados de aquellos que trabajan en el mismo departamento que SCOTT, ganen m�s que lo que gana SMITH y tenga el mismo oficio que MILLER. */ 
/* 77. Mostrar nombre y el salario de los empleados que trabajan en el mismo departamento que FORD y tengan 
       su mismo sueldo. Ordenar primero por el nombre ascendentemente y luego por el salario descendentemente. */ 
/* 78. Obtener el nombre del futbolista m�s mayor que jug� en el equipo de casa el 01/01/20 y el nombre de su equipo */ 
/* 79. Obtener los apellidos del futbolista de menor edad que jug� en el equipo de fuera el 08/01/20 y el nombre de su equipo. */            
/* 80. Devuelve el equipo y resultado del partido jugado el 15/01/20 con este formato "EQUIPO A 00-00 EQUIPO B" en una �nica columna. */ 
/* 81. �En qu� ciudad trabaja el empleado que m�s cobra de la empresa? */ 
/* 82. �C�mo se llama el departamento del empleado que tiene menor salario? */ 
/* 83. �C�mo se llama el futbolista de m�s altura que jug� el d�a 22/01/20? */ 
/* 84. Se quiere saber el nombre del departamento y el nombre del empleado que tiene comisi�n y esta es mayor de 500 */ 
/* 85. Devuelve el nombre del empleado y el nombre del departamento de aquel que haya sido contratado antes en el a�o 1981. */
/* 86. Devuelve el nombre del empleado junto al nombre de su jefe con este formato en una columna: "El jefe de SMITH es JACOB". */
/* 87. Devuelve el nombre del departamento que tiene m�s trabajadores junto al n�mero de trabajadores. */
/* 88. Se quieren saber todos los campos/datos de los partidos que se hayan disputado entre el 01-01-2020 y el 31-01-2020. */
/* 89. Devuelve todos los �rbitros de los partidos sin repetir resultados. */
/* 90. Se quiere saber el id y resultado de la tabla partidos en los que el resultado haya terminado en -00. Debes usar un alias de tabla para partidos, que sea p, y debes usarlo en tus columnas id y resultado. */
/* 91. Devuelve el id, �rbitro y estadio de los partidos pero ordenado de la siguiente forma: 1� por estadio en orden descendente, luego por �rbitro y finalmente por id descendente. */
/* 92. Devuelve el nombre (solo may�scula la primera letra), el presupuesto reducido en 250000 seguido por un espacio y la palabra euros,
       el presupuesto actual seguido por un espacio y la palabra euros, y el presupuesto m�s el 10% del mismo seguido de un espacio y la palabra euros,
       correspondiente a los equipos y ordenados por el presupuesto en orden descendente. Utiliza los siguientes alias de columna en este orden para los presupuestos: "2022-23", "2023-24", "2024-25". */
/* 93. Se quiere el nombre en min�sculas, la fecha de nacimiento y el salario dividido entre 12. Este salario debe redondearse para que tenga solo dos decimales,
       y concatenar usando la funci�n CONCAT con un espacio y la palabra euros. Los resultados deben estar ordenados por orden descendete de salario de futbolista. */
/* 94. Devuelve el nombre (con tres caracteres) seguido de un "-" y el apellido de los fubtolistas en una columna que tenga por alias "NOM-APELLIDO" (emplea la funci�n CONCAT),
       y en otra columna el tama�o/n�mero de caracteres del campo apellido de los futbolistas,
       usando el alias de columna "CARACTERES APELLIDO". Debe ordenarse descendentemente por ese tama�o de caracteres de apellido. */
/* 95. Queremos un listado de los nombres de los futbolistas quitando los segundos nombres (nombres compuestos, por ejemplo, borrar LUIS de PEDRO LUIS, quedando solo PEDRO) y poner como alias de columna "SOLO NOMBRE". */
/* 96. Devuelve el nombre del futbolista cuyo salario es el m�s bajo posible de todos los futbolistas nacidos entre 1985 y 1990. */
/* 97. Indica cu�ntos futbolistas que no juegan de portero tienen un apellido que termina en ez. */
/* 98. Devuelve el id del equipo con alias "id equipo", el n�mero de futbolistas con alias "N�mero de futbolistas" y
       el salario medio redondeado a 2 decimales con alias "Salario medio" de los futbolistas agrupado por el equipo en el que juegan. */
/* 99. �Cu�ntos partitos ha jugado como local EQUIPO A? Debes usar el campo nombre de equipos. */
/* 100.�Cu�l es el nombre del equipo en el que juega el futbolista de menor peso? */
/* 101.Devuelve en una �nica columna la fase: El futbolista NOMBRE juega en el equipo NOMBRE, correspondiendo al campo nombre de futbolista y de equipo */
/* 102.Obtener el nombre de todos los departamentos en min�sculas. */
/* 103.Seleccionar todos los datos de la tabla empleados (todas las columnas). */
/* 104.Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisi�n. */
/* 105.Calcula cu�ntas semanas completas (de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado.
/* 106.Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retenci�n es del 19% para el sueldo y de un 10% de la comisi�n,
       (redondear a 2 decimales). Si el empleado no tiene comisi�n, se debe mostrar el valor 0.*/
/* 107.Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000. */
/* 108.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK. */
/* 109.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK. */
/* 110.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500. */
/* 111.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisi�n. */
/* 112.Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisi�n. */
/* 113.Seleccionar los empleados cuyo nombre empieza por 'A'. */
/* 114.Seleccionar los empleados cuyo nombre tienen una A en cualquier posici�n. */
/* 115.Seleccionar los empleados cuyo nombre no contiene ninguna 'A'. */
/* 116.Seleccionar los empleados cuyo nombre empieza por una vocal. */
/* 117.Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive). */
/* 118.Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000. */
/* 119.Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M. */
/* 120.Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000. */
/* 121.Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario m�ximo de todos los empleados. */
/* 123.Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las m�scaras de to_number en to_char. */
/* 124.Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'D�lar' (ej.: $1,000.00) de todos los empleados. Se puede usar las m�scaras de to_number en to_char. */
/* 125.Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00� de todos los empleados. Se puede usar las m�scaras de to_number en to_char. */
/* 126.Seleccionar la fecha del sistema (d�a, mes, a�o, horas (24):minutos:segundos). */
/* 127.Seleccionar la fecha del sistema (nombre del d�a, d�a, nombre del mes, a�o, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del d�a o del mes. */
/* 128.Seleccionar la fecha del d�a 1 de enero de 2005, med�ante una tira de caracteres y su m�scara de formato (ej.: 01012021). */
/* 129.Calcular el n�mero de d�as vividos hasta hoy por una persona nacida el d�a 3 de julio de 1970. */
/* 130.Calcular el n�mero de segundos transcurridos desde la �ltima medianoche (m�scara 'sssss' en to_char). */
/* 131.Calcular el n�mero horas completas transcurridas desde la �ltima medianoche. */
/* 132.Calcular el n�mero de meses transcurridos entre la fecha de contrataci�n de cada empleado y hoy. */
/* 133.Calcular el �ltimo dia del mes (fecha) del mes actual. */
/* 134.Calcular el �ltimo dia del mes (fecha) del mes actual, con horas, minutos y segundos. */
/* 135.Calcular en qu� MES (cifras) se ha contratado cada empleado. */
/* 136.Calcular cuanto deber�a haber cobrado cada empleado en su primer a�o de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese a�o). */
/* 137.Cuantos oficios distintos hay en la tabla de empleados. */
/* 138.Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%. */
/* 139.Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario. */
/* 138.Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisi�n, y 'No vendedor' si no la cobra. */
/* 139.Calcular cu�nto se paga mensualmente a todos los empleados. */
/* 140.Calcular cuantos empleados hay. */
/* 141.Calcular el sueldo medio de todos los empleados. */
/* 142.Calcular la comisi�n media de todos los empleados (teniendo en cuenta aquellos que no tienen comisi�n). */
/* 143.Calcular la comisi�n media de los empleados que s� tienen comisi�n. */
/* 144.Calcular la suma de los sueldos de los empleados del Departamento 20. */
/* 145.Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30. */
/* 146.Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado). */
/* 147.Calcular cuantos empleados se han contratado cada a�o. */
/* 148.Calcular el sueldo m�ximo y m�nimo de cada departamento. */
/* 149.Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales. */
/* 150.Cu�ntos dias de vacaciones correspondieron a cada empleado el primer a�o de trabajo (contando 1 d�a por semana entera trabajada). */
/* 151.Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle. */
/* 152.Indica el id, nombre y sueldo de los empleados que est�n en departamentos donde haya otros compa�eros empleados con una letra 'u' en su nombre,
       y que adem�s ganen sueldos mayores que la media de los sueldos de la empresa. */
/* 153.Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive. */
/* 154.Muestra el nombre y salario de los empleados que tengan a KING como jefe directo. */
/* 155.Devuelve el nombre y sueldo de los empleados que ganen m�s dinero que la media de la empresa, ordenado por sueldo de mayor a menor. */
/* 156.Mostrar todos los datos de los empleados de aquellos que trabajan en el mismo departamento que SCOTT, ganen m�s que lo que gana SMITH y tenga el mismo oficio que MILLER. */
/* 157.Mostrar nombre y el salario de los empleados que trabajan en el mismo departamento que FORD y tengan su mismo sueldo.
       Ordenar primero por el nombre ascendentemente y luego por el salario descendentemente. */
/* 158.Obtener el nombre del futbolista m�s mayor que jug� en el equipo de casa el 01/01/20 y el nombre de su equipo. */
/* 159.Obtener los apellidos del futbolista de menor edad que jug� en el equipo de fuera el 08/01/20 y el nombre de su equipo */
/* 160.Devuelve el equipo y resultado del partido jugado el 15/01/20 con este formato "EQUIPO A 00-00 EQUIPO B" en una �nica columna. */
/* 161.�En qu� ciudad trabaja el empleado que m�s cobra de la empresa? */
/* 162.�C�mo se llama el departamento del empleado que tiene menor salario? */
/* 163.�C�mo se llama el futbolista de m�s altura que jug� el d�a 22/01/20? */
/* 164.Se quiere saber el nombre del departamento y el nombre del empleado que tiene comisi�n y esta es mayor de 500. */
/* 165.Devuelve el nombre del empleado y el nombre del departamento de aquel que haya sido contratado antes en el a�o 1981. */
/* 166.Devuelve el nombre del empleado junto al nombre de su jefe con este formato en una columna: "El jefe de SMITH es JACOB". */
/* 167.Devuelve el nombre del departamento que tiene m�s trabajadores junto al n�mero de trabajadores. */
/* 168.Quiero saber la suma total de los presupuestos de los equipos. */
/* 169.Indica el nombre de todos los productos. */
/* 170.�Cu�ntos productos son del tipo PENDIENTE?. */
/* 171.Indica el nombre y el precio de los productos cuyo precio est� entre 100 y 500 euros. */
/* 172.Indica los diferentes tipos de productos que hay, sin repetir, y ordenados de la Z a la A. */
/* 173.�Cu�l es el precio medio (AVG) de los productos cuyo nombre empieza por la letra M?. */
/* 174.�Cu�l es el CP de los clientes que se apellidan ALVAREZ?. */
/* 175.Indica solo el nombre (sin el apellido) de los clientes donde est� en may�sculas solo la primera letra. */
/* 176.�Cu�ntos clientes viven en Bormujos? (Son los que tienen el CP igual a 41930). */
/* 177.Queremos saber el nombre y el tel�fono de los proveedores que si tienen tel�fono (no es null). */
/* 178.�A cu�ntos proveedores les falta el tel�fono?. */
/* 179.�Cu�l es la suma total de las ventas de productos hasta ahora (registros de la tabla compras)?. */
/* 180.Se quiere saber el nombre de los productos, sin repetir, que ha comprado PEDRO ALVAREZ (utiliza el nombre del cliente, no su id). */
/* 181.Indica el nombre y el precio del producto m�s caro (solo el m�s caro) que ha comprado GRACIA GOMEZ. */
/* 182.�Cu�l es el nombre del proveedor del producto que ha comprado ANTONIO ALVAREZ?. */
/* 183.�Cu�ntas compras ha hecho ANA GARC�A? Indica solo el n�mero. */
/* 184.Indica el nombre del producto m�s caro del tipo ANILLO. */
/* 185.Indica el nombre del prodcuto m�s barato del tipo PENDIENTE. */
/* 186.Indica el nombre y el c�digo postal de los clientes de Bormujos (41930) y Mairena del Aljarafe (41927). Para ello emplea UNION de ambos select. */
/* 187.Di todos los datos de los proveedore que tengan al menos una vocal O en su nombre. */
/* 188.Devuelve el precio del producto cuyo nombre es JUPITER redondeado a un �nico decimal. */
/* 189.�Cu�ntas compras se hicieron en 2022? */
/* 190.Muestra en una lista agrupada los a�os y los n�meros de compras hechas en cada uno de esos a�os (una fila por a�o). */
/* 191.Se quiere mostrar lo que ha comprado Mario con este formato: "El d�a DD/MM/YYYY, Mario compr� PRODUCTO en metalico". 
       Es importante respetar la may�scula inicial y las min�sculas indicadas en el ejemplo, mostranto los datos de la compra de MARIO GARCIA. */
/* 192.Se quiere saber el nombre de los productos que se han comprado sin repetir el nombre. */
/* 193.�Qu� d�a de la semana fue cuando se hizo la primera compra (Ej: lunes, martes, etc ?. */

/* 194.Indica el nombre de los futbolistas y el nombre del equipo en el que juegan. */
/* 195.�Cu�l es el nombre del equipo donde juega el jugador m�s alto?. */
/* 196.�C�mo se llama el jugador m�s alto?. */
/* 197.�Cu�nto mide el jugador m�s alto?. */
/* 198.Utiliza UNION para mostrar el nombre de los futbolistas del equipo A, y los del equipo B. */
/* 199.�Cu�ntos futbolistas han nacido antes de 1995?. */
/* 200.Devuelve una lista agrupada por posici�n y n�mero de jugadores que juegan en dicha posici�n. POSICION NUM_JUGADORES Ej.: MEDIOCENTRO 3 DEFENSA 2 PORTERO 1. */
/* 201.�Cu�ntos partidos se han jugado en enero?. */
/* 202.Devuelve una lista agrupada con los nombres de los equipos y el salario medio de los futbolistas de dichos equipos. */
/* 203.�Cu�ntos meses han pasado entre el primer partido disputado y el �ltimo partido jugado?. */
/* 204.Se quiere el nombre y los apellidos de los futbolistas y tengan un salario superior a 130000. 
       Debe devolverse una �nica columna con este formato: apellidos, nombre (todo en min�sculas). */
/* 205.Devuelve el nombre del estadio, junto al nombre del �rbitro (la primera letra en may�sculas y el resto 
       en min�sculas para ambos campos) de aquellos partidos que se hayan jugado en domingo. */
/* 206.Devuelve el nombre de los �rbitros sin repetir. */
/* 207.Se quiere cambiar el formato de los resultados de los partidos, se quiere que en lugar de ser 01-00, se muestre 1-0. */
/* 208.�Cu�ntos goles en total se han marcado hasta ahora? */

/* 209.Muestra la ciudad y el codigo postal de las oficinas de Espa�a. */
SELECT ciudad, codigo_postal FROM oficina WHERE pais = 'Espa�a';

/* 210.Obtener el nombre y apellidos del jefe de la empresa. */
SELECT nombre, apellido1, apellido2 FROM empleado WHERE puesto = 'Director General';
SELECT nombre, apellido1 || ' ' || apellido2 "Apellidos" FROM empleado WHERE codigo_jefe IS NULL;

/* 211.Mostrar el nombre y cargo de los empleados que no sean directores de oficina. */
SELECT nombre, puesto FROM empleado WHERE puesto != 'Director Oficina';

/* 212.Muestra el n�mero de empleados que hay en la empresa. */
SELECT COUNT(codigo_empleado) FROM empleado;

/* 213.Muestra el n�mero de clientes norteamericanos. */
SELECT COUNT(*) FROM cliente WHERE pais IN ('USA', 'Mexico', 'Canada');

/* 214.N�mero de clientes de cada pa�s. */
SELECT pais, COUNT(pais) FROM cliente GROUP BY pais;

/* 215.Muestra el nombre del cliente y el nombre de su representante de ventas (si lo tiene). */
SELECT cliente.nombre_cliente, empleado.nombre FROM cliente JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

/* 216.Nombre de los clientes que hayan hecho un pago en 2007 */
SELECT DISTINCT cliente.nombre_cliente FROM pago JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente WHERE fecha_pago BETWEEN '2007-01-01' AND '2007-12-31';
SELECT DISTINCT cliente.nombre_cliente FROM pago JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente WHERE to_char(fecha_pago, 'YYYY') = 2007;

/* 217.Los posibles estados de un pedido. */
SELECT estado FROM pedido GROUP BY estado;

/* 218.Muestra el n�mero de pedido, el nombre del cliente, la fecha de entrega y la fecha requerida de los pedidos que no han sido entregados a tiempo. */


/* 219.Muestra el c�digo, nombre y gama de los productos que nunca se han pedido (detalle pedidos). */
/* 220.Muestra el nombre y apellidos de los empleados que trabajan en Barcelona. */
/* 221.Muestra el c�digo y la cantidad de veces que se ha pedido un producto al menos una vez. */
/* 222.Muestra el nombre de los clientes de Miami que han realizado alg�n pedido. */
/* 223.Mostrar el precio final de cada pedido. */
/* 224.Mostrar lo que ha pagado cada cliente. */
/* 225.Mostrar el numero de productos de cada gama. */
/* 226.Mostrar el codigo de los pedidos donde se haya vendido el producto de la gama �Arom�ticas� mas caro. */
/* 227.Mostrar el codigo de los pedidos donde se hayan vendido mas de 6 productos. */
/* 228.Mostrar el codigo de los pedidos donde el precio del pedido sea superior a la media de todos los pedidos. */
/* 229.Mostrar los datos de un empleado (nombre, apellidos, ciudad de la oficina) y lo mismo para su jefe (en la misma fila). */
/* 230.Mostrar el codigo de pedido y su total en euros. */
/* 231.Mostrar la informaci�n del pedido (codigo, fechapedido, fechaesperada, fechaentrega, nombre cliente y total en euros) ordenado por total de forma descendente. */
/* 232.Devolverme la gama de productos mas vendida. */
/* 233.Devolverme la gama de productos mas vendida. */
/* 234.Muestra el pais(cliente) donde menos pedidos se hacen. */

/* 235.Qu� d�a de la semana se contrat� a cada empleado. */
/* 236.Calcular la paga de beneficios que corresponde a cada empleado (3 salarios mensuales incrementados un: 10% para PRESIDENT, 20% para los MANAGER, 30% para el resto). */
/* 237.Cuantos d�as han pasado desde el 25 julio de 1992. */
/* 238.Seleccionar el nombre de cada empleado junto al nombre del departamento en el que est�. */
/* 239.Seleccionar el nombre y puesto de cada empleado junto al nombre del departamento al que pertenece y la localizaci�n del departamento. */
/* 240.Seleccionar el nombre de cada empleado, el nombre de! departamento al que pertenece, y el codigo de departamento del empleado. */
/* 241.Listar el nombre del empleado y el nombre de su jefe. */
/* 242.Listar el nombre del empleado y el nombre de su jefe. Incluir empleados que no tengan jefe. */
/* 243.Seleccionar nombre del empleado, nombre del jefe, fechas contrato del trabajador y del jefe, de forma que la fecha de contrato del empleado sea anterior a la de su jefe. */
/* 244.Seleccionar nombre del empleado, nombre del jefe, salarios del trabajador y del jefe, de forma que el sueldo del empleado sea inferior a la mitad del salario de su jefe. */
/* 245.Seleccionar las distintas ubicaciones de los departamentos. */
/* 246.Seleccionar la ubicaci�n y el nombre empleado. Incluir tambi�n las ubicaciones de departamentos sin empleados. */
/* 247.Seleccionar el nombre de los empleados, y el departamento al que pertenecen, para los empleados que ganan menos de 1000$. */
/*.248.Seleccionar el nombre del empleado, y el departamento al que pertenecen, para los empleados que ganan m�s de 1000$. */
/* 249.Consultar todos los valores de la tabla emp. */
/* 250.Listar el nombre, el oficio y sueldo de los empleados. */
/* 251.Calcular el sueldo anual que percibe cada empleado. */
/* 252.Consultar los datos de la tabla DEPTS. */
/* 253.Listar los diferentes puestos de los empleados sin repetir. */
/* 254.Listar en una sola columna el nombre y el puesto de cada empleado. */
/* 255.Listar todas las columnas de la tabla EMP en una �nica columna, separando cada campo por comas. */
/* 256.Listar el nombre y sueldo de los empleados que ganan m�s de 2000$. */
/* 257.Listar el nombre y c�digo de de departamento del empleado con id=30. */
/* 258.Listar el nombre y sueldo de los empleados que NO ganan entre 5000 y 12000 d�lares. Muestra el sueldo con el s�mbolo de $ delante de la cifra. */
/* 259.Listar el nombre, puesto y fecha contrato de los empleados contratados entre el 20 febrero 1981 y el 1 de mayo de 1981. Ordenar por fecha descendente. */
/* 260.Listar el nombre y el cod departamento de los empleados pertenecientes a los departamentos 20 o 40. */
/* 261.Listar el nombre (alias: Empleado) y sueldo (alias: Salario mensual) de los empleados pertenecientes a los departamentos 20 o 40, que ganen entre 2000 y 4000 d�lares. */
/* 262.Listar el nombre y fecha contrato de empleados contratados el a�o 1984. */
/* 263.Listar el nombre y el puesto de los empleados que no tengan jefe asignado. */
/* 264.Listar el nombre, sueldo y % comisi�n de los empleados que cobran comisi�n. Ordenar por salario y comisi�n, de forma que los m�s altos salgan primero. */
/* 265.Listar el nombre de los empleados que tengan una 'a' en la 3a letra del nombre. */
/* 266.Listar el nombre de los empleados que tengan una 'a' y una 'e' en el nombre. */
/* 267.Listar el nombre, puesto y sueldo de los empleados 'CLERK' o 'SALESMAN', y con salario distinto de: 2500, 3500 y 7000. */
/* 268.Listar el nombre (alias: Empleado), sueldo (alias: Salario mensual) y nombre del departamento de todos los empleados cuya comisi�n sea mayor de 400. */
/* 269.Listar el nombre y salario de los empleados, de forma que est�n separados por una l�nea de puntos, y que de extremo a extremo haya 30 caracteres (por ejemplo: "KING......................5000"). */
/* 270.Listar los nombres de los empleados, reemplazando la letra 'a' por un '1'. */
/* 271.Obtener la fecha del sistema (hoy) con alias: Fecha en el formato por defecto (sin tocar nada). */
/* 272.Listar el id, nombre, salario de los empleados, y adem�s otra columna con el salario incrementado un 15% su valor y redondeado (alias: Nuevo salario). */
/* 273.Listar el id, nombre, salario de los empleados, el salario incrementado un 15% redondeado (alias: Nuevo salario) y adem�s otra columna con la cuant�a del incremento (alias: Incremento). */
/* 274.Listar el nombre y longitud del nombre de los empleados que empiecen por A, o M. (Los nombres tendr�n la inicial en may�scula y el resto en min�sculas). */
/* 275.Listar el nombre y n�mero de meses trabajados, redondeando al entero superior. Ordenar por n�mero de meses trabajados, de menor a mayor. */
/* 276.Componer una frase con el nombre, salario actual y el triple del salario de los empleados. Por ejemplo: "KING gana 5000 mensuales, pero querr�a ganar 15000" (alias: Sueldos so�ados). */
/* 278.Listar el nombre y salario de los empleados, rellenando por la izquierda hasta 15 caracteres con el s�mbolo "$". */
/* 279.Listar nombre, fecha contrato y fecha revisi�n contrato de los empleados, sabiendo que la revisi�n ser� el lunes siguiente a la fecha que cumple 6 meses de trabajo en la empresa. 
    Formatear esta fecha de acuerdo con el ejemplo: 'Lunes, 12th de noviembre de 2005'. */
/* 280.Listar nombre, fecha contrato y d�a de la semana en que fueron contratados los empleados, ordenando por d�a de la semana, 
    de forma que queden ordenados por lunes, martes, mi�rcoles, jueves, viernes, s�bado y domingo. */
/* 281.Listar nombre y comisi�n de los empleados. En el caso de que no gane comisi�n, sacar la frase "Sin comisi�n". */
/* 281.Listar nombre de los empleados, y una tira de asteriscos, de forma que haya un asterisco por cada 1000$ (redondeada) que gana el empleado. Titula la columna 'Empleado y su salario'. Ordenar esta
       columna de forma que los que m�s ganan aparezcan primero. Los nombres deben quedar ajustados a la longitud del nombre m�s largo. Ej.: "KING..:  *****" */
/* 282.Listar los distintos nombres de puestos de los empleados, de forma que : PRESIDENT se traduzca por A, MANAGER por B, ANALYST por C, CLERK por D y el resto por E. */
/* 283.Listar todos los campos de la tabla DEPT. */
/* 284.Seleccionar el nombre de departamento, y el nombre de la ciudad donde est�. */