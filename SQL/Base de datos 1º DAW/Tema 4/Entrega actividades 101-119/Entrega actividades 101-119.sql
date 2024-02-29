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

// Entrega actividades 101-119.

/* 101. Listar las diferentes ciudades de la tabla sin repetici�n expl�citamente (aunque no haya datos que se repitan). */
SELECT DISTINCT(dept.loc) FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 102. Listar el nombre de departamento y nombre de ciudad para los departamentos ubicados en  en New York y Dallas. */
SELECT dept.dname, dept.loc FROM emp JOIN dept ON dept.deptno = emp.deptno WHERE dept.loc = 'NEW YORK' OR dept.loc = 'DALLAS';

/* 103. Seleccionar el nombre de los empleados y el nombre de la ciudad donde est� el departamento al que pertenecen. */
SELECT emp.ename, dept.loc FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 104. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son MANAGER. */
SELECT emp.ename, emp.job, dept.dname, dept.loc FROM emp JOIN dept ON dept.deptno = emp.deptno WHERE emp.job != 'MANAGER';

/* 105. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son ni ANALYST ni CLERK. */
SELECT emp.ename, emp.job, dept.dname, dept.loc FROM emp JOIN dept ON dept.deptno = emp.deptno WHERE emp.job != 'ANALYST' AND emp.job != 'CLERK';

/* 106. Seleccionar el nombre del empleado, c�digo y nombre del departamento al que pertenecen los empleados. */
SELECT emp.ename, emp.deptno, dept.dname FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 107. Seleccionar el nombre de los empleados que trabajan en el departamento cuyo c�digo es el m�s bajo de todos los existentes (utiliza subconsultas). */
SELECT * FROM emp JOIN dept ON dept.deptno = emp.deptno;

SELECT emp.ename FROM emp WHERE emp.deptno = MIN(emp.deptno);

/* 108. Seleccionar nombre de empleado, nombre de departamento y ubicaci�n del departamento para los empleados que tienen comisi�n. */
/* 109. Seleccionar nombre de empleado, nombre de departamento y localizaci�n, para los empleados que no tienen comisi�n (o esta vale cero). */
/* 110. Seleccionar nombre de empleado y nombre de departamento para los empleados que tengan una 'a' en su nombre. */
/* 111. Seleccionar nombre de empleado y nombre departamento para los empleados que tengan una vocal al menos (a, e, i, o, u) en su nombre. */
/* 112. Seleccionar nombre y puesto de empleado, c�digo de departamento y nombre de departamento de los empleados cuyo departamento est� ubicado en 'Chicago'. Todos los valores deben devolverse en min�sculas. */
/* 113. Seleccionar nombre, c�digo de empleado, nombre de su jefe y c�digo de empleado de su jefe para todos los empleados (no se deben mostrar los que no tienen jefe). */
/* 114. Seleccionar nombre, c�digo de empleado, nombre de su jefe y c�digo de empleado de su jefe para todos los empleados (se deben mostrar TODOS, incluso los que no tienen jefe). */
/* 115. Seleccionar c�digo departamento, nombre de empleado y nombre de jefe de cada empleado del departamento que est� en Boston. */
/* 116. Seleccionar nombre y fecha contrato de los empleados contratados posteriormente al empleado 'WARD'. */
/* 118. Seleccionar nombre y fecha de contrato de los empleados, adem�s del nombre y fecha de contrato de su jefe, siempre y cuando la fecha del contrato del empleado fuera anterior a la fecha de contrato de su jefe. */
/* 119. Listar todos los nombres cuya longitud sea menor que la media de todas las longitudes de nombres de empleados redondeado al entero superior. */
/* 120. Seleccionar el nombre de los empleados y el nombre del departamento al que pertenecen, siempre y cuando el nombre del departamento comience por la letra 'S'. */


