/*ALTER SESSION SET nls_date_format='DD-MM-YYYY HH24:MI:SS';
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

DELETE FROM FUTBOLISTAS WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';*/

SELECT * FROM equipos;
SELECT * FROM equipos where nombre = 'EQUIPO B';
SELECT nombre FROM equipos;
SELECT nombre,estadio FROM equipos;
SELECT * FROM futbolistas;
SELECT posicion FROM futbolistas;
SELECT DISTINCT posicion FROM futbolistas;

SELECT nombre FROM futbolistas;
SELECT nombre,posicion FROM futbolistas;
SELECT DISTINCT posicion FROM futbolistas;

SELECT nombre "futbolistas" FROM futbolistas;

// Ejercicio 2
// Obt�n todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado �Demarcaciones�.
SELECT DISTINCT posicion "demarcaciones" FROM futbolistas;
// Muestra todos los datos almacenados de todos los futbolistas.
SELECT * FROM futbolistas;

/* Se quieren todos los datos de los futbolistas pero con los siguientes alias de columna:
- id
- nombre
- apellidos
- fecha de nacimiento
- posici�n
- salario actual
- identificador equipo actual
*/
SELECT id "id",
    nombre "nombre",
    apellidos "apellidos",
    fecha_nacimiento "fecha de nacimiento",
    posicion "posici�n",
    salario "salario actual",
    id_equipo "identificador equipo actual"
FROM futbolistas;

SELECT * FROM equipos;
SELECT * FROM futbolistas;
SELECT * FROM equipos,futbolistas WHERE id_equipo = equipos.id;
//INNER JOIN

// EJERCICIO 3
/* Devuelve los apellidos de los
futbolistas que su posici�n sea
DEFENSA. Aplica un alias a apellidos
para que se muestre �Futbolista� y
asigna el alias F a la tabla futbolistas. */

SELECT apellidos Futbolista FROM futbolistas F
    WHERE posicion = 'DEFENSA';

SELECT e.id, f.nombre FROM equipos e, futbolistas f;

//OBLIGATORIO
SELECT columnas FROM tabla;
//OPCIONALES
SELECT columnas FROM tablas WHERE condicion ORDER BY columnas;

//ORDENAR
SELECT nombre, apellidos, salario FROM futbolistas ORDER BY salario ASC;
SELECT nombre, apellidos, salario FROM futbolistas ORDER BY salario DESC;
SELECT nombre, apellidos, salario FROM futbolistas ORDER BY nombre DESC;
SELECT nombre, apellidos, salario FROM futbolistas ORDER BY salario ASC;
SELECT nombre, apellidos, salario FROM futbolistas ORDER BY apellidos DESC, salario DESC;

UPDATE futbolistas SET apellidos='GALVEZ' WHERE nombre='PABLO';

SELECT nombre, apellidos, salario FROM futbolistas ORDER BY 1 DESC, 3 DESC;

SELECT nombre, fecha_nacimiento FROM futbolistas;
SELECT nombre, fecha_nacimiento FROM futbolistas ORDER BY fecha_nacimiento DESC;

//EJERCICIO 4
/* Devuelve los apellidos de los
futbolistas que su posici�n sea
DEFENSA ordenador de la Z a la A. */

SELECT apellidos FROM futbolistas WHERE posicion = 'DEFENSA' ORDER BY apellidos DESC;

//EJERCICIO 5
/* Devuelve todos los datos de
futbolistas ordenados primero por
posici�n y luego por apellidos. */

SELECT * FROM futbolistas ORDER BY posicion, apellidos;

//EJERCICIO 6
/* Obt�n el nombre de los futbolistas
que cobran m�s de 150.000 euros
(SALARIO). */

SELECT nombre, salario FROM futbolistas WHERE salario > 150000;

/* Muestra el ID de los futbolistas cuyo
apellido sea G�MEZ. */

SELECT id, apellidos FROM futbolistas WHERE apellidos = 'GOMEZ';

/* Indica los apellidos de los futbolistas
que empiezan por G. */

SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G%';

/* Devuelve todos los datos de los
futbolistas cuya posici�n sea
DEFENSA o DELANTERO. */

SELECT posicion FROM futbolistas WHERE posicion IN ('DEFENSA', 'DELANTERO');
SELECT posicion FROM futbolistas WHERE posicion = 'DEFENSA' OR posicion = 'DELANTERO';

/* Obt�n el nombre de los futbolistas
que cobran entre 100.000 y 200.000
euros (SALARIO). */

SELECT nombre, salario FROM futbolistas WHERE salario BETWEEN 100000 AND 200000;
SELECT nombre, salario FROM futbolistas WHERE salario >= 100000 AND salario <= 200000;

SELECT 4+4*3 FROM dual; //s�lo un campo y una fila para hacer pruebas.
SELECT 4+4*3 || 'a' FROM dual; //concatenar
SELECT to_char (sysdate, 'dd/mm/yy hh:mi:ss') FROM dual;

SELECT COUNT(nombre) FROM futbolistas; //contar