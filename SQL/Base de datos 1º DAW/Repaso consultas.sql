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

// BD FABRICANTES-ARTÍCULOS BD FABRICANTES-ARTÍCULOS BD FABRICANTES-ARTÍCULOS BD FABRICANTES-ARTÍCULOS BD FABRICANTES-ARTÍCULOS

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

/* 1. Obtén todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado “Demarcaciones”. */
/* 2. Muestra todos los datos almacenados de todos los futbolistas. */
/* 3. Se quieren todos los datos de los futbolistas pero con los siguientes alias de columna: "id", "nombre", "apellidos", "fecha de nacimiento", "posición", "salario actual", "identificador equipo actual" */
/* 4. Devuelve los apellidos de los futbolistas que su posición sea DEFENSA. Aplica un alias a apellidos para que se muestre “Futbolista” y asigna el alias F a la tabla futbolistas. */




/* 1. Se quieren saber todos los campos/datos de los partidos que se hayan disputado entre el 01-01-2020 y el 31-01-2020. */
/* 2. Devuelve todos los árbitros de los partidos sin repetir resultados. */
/* 3. Se quiere saber el id y resultado de la tabla partidos en los que el resultado haya terminado en -00. Debes usar un alias de tabla para partidos, que sea p, y debes usarlo en tus columnas id y resultado. */
/* 4. Devuelve el id, árbitro y estadio de los partidos pero ordenado de la siguiente forma: 1º por estadio en orden descendente, luego por árbitro y finalmente por id descendente. */
/* 5. Devuelve el nombre (solo mayúscula la primera letra), el presupuesto reducido en 250000 seguido por un espacio y la palabra euros,
      el presupuesto actual seguido por un espacio y la palabra euros, y el presupuesto más el 10% del mismo seguido de un espacio y la palabra euros,
      correspondiente a los equipos y ordenados por el presupuesto en orden descendente. Utiliza los siguientes alias de columna en este orden para los presupuestos: "2022-23", "2023-24", "2024-25". */
/* 6. Se quiere el nombre en minúsculas, la fecha de nacimiento y el salario dividido entre 12. Este salario debe redondearse para que tenga solo dos decimales,
      y concatenar usando la función CONCAT con un espacio y la palabra euros. Los resultados deben estar ordenados por orden descendete de salario de futbolista. */
/* 7. Devuelve el nombre (con tres caracteres) seguido de un "-" y el apellido de los fubtolistas en una columna que tenga por alias "NOM-APELLIDO" (emplea la función CONCAT),
      y en otra columna el tamaño/número de caracteres del campo apellido de los futbolistas,
      usando el alias de columna "CARACTERES APELLIDO". Debe ordenarse descendentemente por ese tamaño de caracteres de apellido. */
/* 8. Queremos un listado de los nombres de los futbolistas quitando los segundos nombres (nombres compuestos, por ejemplo, borrar LUIS de PEDRO LUIS, quedando solo PEDRO) y poner como alias de columna "SOLO NOMBRE". */
/* 9. Devuelve el nombre del futbolista cuyo salario es el más bajo posible de todos los futbolistas nacidos entre 1985 y 1990. */
/* 10. Indica cuántos futbolistas que no juegan de portero tienen un apellido que termina en ez. */
/* 11. Devuelve el id del equipo con alias "id equipo", el número de futbolistas con alias "Número de futbolistas" y
   el salario medio redondeado a 2 decimales con alias "Salario medio" de los futbolistas agrupado por el equipo en el que juegan. */
/* 12. ¿Cuántos partitos ha jugado como local EQUIPO A? Debes usar el campo nombre de equipos. */
/* 13. ¿Cuál es el nombre del equipo en el que juega el futbolista de menor peso? */
/* 14. Devuelve en una única columna la fase: El futbolista NOMBRE juega en el equipo NOMBRE, correspondiendo al campo nombre de futbolista y de equipo */
/* 15. Obtener el nombre de todos los departamentos en minúsculas. */
/* 16. Seleccionar todos los datos de la tabla empleados (todas las columnas). */
/* 17. Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisión. */
/* 18. Calcula cuántas semanas completas (de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado.
/* 19. Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retención es del 19% para el sueldo y de un 10% de la comisión,
   (redondear a 2 decimales). Si el empleado no tiene comisión, se debe mostrar el valor 0.*/
/* 20. Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000. */
/* 21. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK. */
/* 22. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK. */
/* 23. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500. */
/* 24. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisión. */
/* 25. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisión. */
/* 26. Seleccionar los empleados cuyo nombre empieza por 'A'. */
/* 27. Seleccionar los empleados cuyo nombre tienen una A en cualquier posición. */
/* 28. Seleccionar los empleados cuyo nombre no contiene ninguna 'A'. */
/* 29. Seleccionar los empleados cuyo nombre empieza por una vocal. */
/* 30. Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive). */
/* 31. Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000. */
/* 32. Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M. */
/* 33. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000. */
/* 34. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario máximo de todos los empleados. */
/* 35. Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
/* 36. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Dólar' (ej.: $1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
/* 37. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00€ de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
/* 38. Seleccionar la fecha del sistema (día, mes, año, horas (24):minutos:segundos). */
/* 39. Seleccionar la fecha del sistema (nombre del día, día, nombre del mes, año, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del día o del mes. */
/* 40. Seleccionar la fecha del día 1 de enero de 2005, medíante una tira de caracteres y su máscara de formato (ej.: 01012021). */
/* 41. Calcular el número de días vividos hasta hoy por una persona nacida el día 3 de julio de 1970. */
/* 42. Calcular el número de segundos transcurridos desde la última medianoche (máscara 'sssss' en to_char). */
/* 43. Calcular el número horas completas transcurridas desde la última medianoche. */
/* 44. Calcular el número de meses transcurridos entre la fecha de contratación de cada empleado y hoy. */
/* 45. Calcular el último dia del mes (fecha) del mes actual. */
/* 46. Calcular el último dia del mes (fecha) del mes actual, con horas, minutos y segundos. */
/* 47. Calcular en qué MES (cifras) se ha contratado cada empleado. */
/* 48. Calcular cuanto debería haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese año). */
/* 49. Cuantos oficios distintos hay en la tabla de empleados. */
/* 50. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%. */
/* 51. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario. */
/* 52. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisión, y 'No vendedor' si no la cobra. */
/* 53. Calcular cuánto se paga mensualmente a todos los empleados. */
/* 54. Calcular cuantos empleados hay. */
/* 55. Calcular el sueldo medio de todos los empleados. */
/* 56. Calcular la comisión media de todos los empleados (teniendo en cuenta aquellos que no tienen comisión). */
/* 57. Calcular la comisión media de los empleados que sí tienen comisión. */
/* 58. Calcular la suma de los sueldos de los empleados del Departamento 20. */
/* 59. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30. */
/* 60. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado). */
/* 61. Calcular cuantos empleados se han contratado cada año. */
/* 62. Calcular el sueldo máximo y mínimo de cada departamento. */
/* 63. Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales. */
/* 64. Cuántos dias de vacaciones correspondieron a cada empleado el primer año de trabajo (contando 1 día por semana entera trabajada). */
/* 65. Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle. */
/* 66. Indica el id, nombre y sueldo de los empleados que estén en departamentos donde haya otros compañeros empleados con una letra 'u' en su nombre,
   y que además ganen sueldos mayores que la media de los sueldos de la empresa. */
/* 65. Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive. */
/* 66. Muestra el nombre y salario de los empleados que tengan a KING como jefe directo. */
/* 67. Devuelve el nombre y sueldo de los empleados que ganen más dinero que la media de la empresa, ordenado por sueldo de mayor a menor. */
/* 68. Mostrar todos los datos de los empleados de aquellos que trabajan en el mismo departamento que SCOTT, ganen más que lo que gana SMITH y tenga el mismo oficio que MILLER. */
/* 69. Mostrar nombre y el salario de los empleados que trabajan en el mismo departamento que FORD y tengan su mismo sueldo.
       Ordenar primero por el nombre ascendentemente y luego por el salario descendentemente. */
/* 70. Obtener el nombre del futbolista más mayor que jugó en el equipo de casa el 01/01/20 y el nombre de su equipo. */
/* 71. Obtener los apellidos del futbolista de menor edad que jugó en el equipo de fuera el 08/01/20 y el nombre de su equipo */
/* 72. Devuelve el equipo y resultado del partido jugado el 15/01/20 con este formato "EQUIPO A 00-00 EQUIPO B" en una única columna. */
/* 73. ¿En qué ciudad trabaja el empleado que más cobra de la empresa? */
/* 74. ¿Cómo se llama el departamento del empleado que tiene menor salario? */
/* 75. ¿Cómo se llama el futbolista de más altura que jugó el día 22/01/20? */
/* 76. Se quiere saber el nombre del departamento y el nombre del empleado que tiene comisión y esta es mayor de 500. */
/* 77. Devuelve el nombre del empleado y el nombre del departamento de aquel que haya sido contratado antes en el año 1981. */
/* 78. Devuelve el nombre del empleado junto al nombre de su jefe con este formato en una columna: "El jefe de SMITH es JACOB". */
/* 79. Devuelve el nombre del departamento que tiene más trabajadores junto al número de trabajadores. */