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

/* 1.  Obt�n todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado �Demarcaciones�. */
SELECT DISTINCT posicion "Demarcaciones" FROM futbolistas;

/* 2.  Muestra todos los datos almacenados de todos los futbolistas. */
SELECT * FROM futbolistas;

/* 3.  Se quieren todos los datos de los futbolistas pero con los siguientes alias de columna: "id", "nombre", "apellidos", "fecha de nacimiento", "posici�n", "salario actual", "identificador equipo actual" */
SELECT id "id", nombre "Nombre", apellidos "Apellidos", fecha_nacimiento "Fecha de nacimiento", posicion "Posici�n", salario "Salario actual", id_equipo "identificador equipo actual" FROM futbolistas;

/* 4.  Devuelve los apellidos de los futbolistas que su posici�n sea DEFENSA. Aplica un alias a apellidos para que se muestre �Futbolista� y asigna el alias F a la tabla futbolistas. */
SELECT apellidos "FUTBOLISTA" FROM futbolistas f WHERE posicion = 'DEFENSA';

/* 5.  Devuelve los apellidos de los futbolistas que su posici�n sea DEFENSA ordenado de la Z a la A. */
SELECT apellidos FROM futbolistas WHERE posicion = 'DEFENSA' ORDER BY apellidos DESC;

/* 6.  Devuelve todos los datos de futbolistas ordenados primero por posici�n y luego por apellidos. */
SELECT * FROM futbolistas ORDER BY posicion, apellidos;

/* 7.  Obt�n el nombre de los futbolistas que cobran m�s de 150.000 euros (SALARIO). */
SELECT nombre, salario FROM futbolistas WHERE salario > 150000;

/* 8.  Muestra el ID de los futbolistas cuyo apellido sea G�MEZ. */
SELECT id FROM futbolistas WHERE apellidos = 'GOMEZ';

/* 9.  Indica los apellidos de los futbolistas que empiezan por G. */
SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G%';

/* 10. Devuelve todos los datos de los futbolistas cuya posici�n sea DEFENSA o DELANTERO. */
SELECT * FROM futbolistas WHERE posicion = 'DEFENSA' OR posicion = 'DELANTERO';

/* 11. Obt�n el nombre de los futbolistas que cobran entre 100.000 y 200.000 euros (SALARIO). */
SELECT nombre FROM futbolistas WHERE salario BETWEEN 100000 AND 200000;

/* 12. Se va a hacer un aumento de sueldo de los PORTEROS. Para ello obt�n el nombre, apellido y el nuevo salario de los PORTEROS si se aumenta un 10% del que tienen actualmente.
       La lista debe estar ordenada alfab�ticamente por los apellidos. */
SELECT nombre, apellidos, salario * 1.10 FROM futbolistas WHERE posicion = 'PORTERO' ORDER BY apellidos;
       
/* 13. Devuelve en una �nica columna el nombre del futbolista seguido de la palabra �es� y a continuaci�n la posici�n que ocupa. La columna debe llamarse �Posiciones�. */
SELECT nombre || ' es ' || posicion "Posiciones" FROM futbolistas;

/* 14. Queremos saber todos los datos de los futbolistas que ganen m�s de 150.000 euros y sean defensas. */
SELECT * FROM futbolistas WHERE salario > 150000 AND posicion = 'DEFENSA';

/* 15. Realiza una consulta que te devuelva los campos Nombre, Salario, Salario bruto terminado en la palabra �euros� y llamando a esa columna �Salario
       bruto�. Nota: el salario bruto de un futbolista se obtiene a�adi�ndole el 50% de impuestos, es decir multiplicando por 1,5. */
SELECT nombre, salario, salario * 1.5 || ' euros' "Salario bruto" FROM futbolistas;
       
/* 16. Calcula el valor absoluto de -10. */
SELECT ABS(-10) FROM dual;

/* 17. Obt�n el exponente en base e de 4. */
SELECT EXP(4) FROM dual;

/* 18. Redondea el n�mero 15,3 a 16. */
SELECT CEIL(15.3) FROM dual;

/* 19. Redondea el n�mero anterior (15,3) a 15. */
SELECT FLOOR(15.3) FROM dual;

/* 20. Calcula el resto de 15 entre 3 (15/3). */
SELECT MOD(15, 3) FROM dual;

/* 21. Eleva 15 al exponente 2 (152). */
SELECT POWER(15, 2) FROM dual;

/* 22. Redondea 15,789 con un decimal. */
SELECT ROUND(15.789, 1) FROM dual;

/* 23. Obt�n la ra�z cuadrada de 128. */
SELECT SQRT(128) FROM dual;

/* 24. Trunca 15,789 a 1 decimal. */
SELECT TRUNC(15.789, 1) FROM dual;

/* 25. Trunca 15,789 para dejarlo sin decimales (15). */
SELECT TRUNC(15.789, 0) FROM dual;

/* 26. Trunca 157,89 para dejarlo en 100. */
SELECT TRUNC(157.89, -2) FROM dual;

/* 27. Obt�n el signo de -15 (es decir -1). */
SELECT SIGN(-15) FROM dual;

/* 28. Obt�n en tres columnas independientes, el d�a, el mes y la fecha de hoy. */
SELECT EXTRACT(DAY FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(YEAR FROM SYSDATE) FROM dual;

/* 29. Muestra por pantalla la fecha que ser� dentro de 6 meses utilizando ADD_MONTHS. */
SELECT ADD_MONTHS(SYSDATE, 6) FROM dual;

/* 30. Muestra el n�mero de meses que hay entre hoy y la fecha de nacimiento de todos los futbolistas. */
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, fecha_nacimiento)) FROM futbolistas;

/* 31. �Cu�l es el �ltimo d�a de este mes? Mu�stralo. */
SELECT LAST_DAY(SYSDATE) FROM dual;

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