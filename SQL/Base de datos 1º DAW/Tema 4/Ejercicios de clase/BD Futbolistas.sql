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
// Obtén todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado “Demarcaciones”.
SELECT DISTINCT posicion "demarcaciones" FROM futbolistas;
// Muestra todos los datos almacenados de todos los futbolistas.
SELECT * FROM futbolistas;

/* Se quieren todos los datos de los futbolistas pero con los siguientes alias de columna:
- id
- nombre
- apellidos
- fecha de nacimiento
- posición
- salario actual
- identificador equipo actual
*/
SELECT id "id",
    nombre "nombre",
    apellidos "apellidos",
    fecha_nacimiento "fecha de nacimiento",
    posicion "posición",
    salario "salario actual",
    id_equipo "identificador equipo actual"
FROM futbolistas;

SELECT * FROM equipos;
SELECT * FROM futbolistas;
SELECT * FROM equipos,futbolistas WHERE id_equipo = equipos.id;
//INNER JOIN

// EJERCICIO 3
/* Devuelve los apellidos de los
futbolistas que su posición sea
DEFENSA. Aplica un alias a apellidos
para que se muestre “Futbolista” y
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
futbolistas que su posición sea
DEFENSA ordenador de la Z a la A. */

SELECT apellidos FROM futbolistas WHERE posicion = 'DEFENSA' ORDER BY apellidos DESC;

//EJERCICIO 5
/* Devuelve todos los datos de
futbolistas ordenados primero por
posición y luego por apellidos. */

SELECT * FROM futbolistas ORDER BY posicion, apellidos;

//EJERCICIO 6
/* Obtén el nombre de los futbolistas
que cobran más de 150.000 euros
(SALARIO). */

SELECT nombre, salario FROM futbolistas WHERE salario > 150000;

/* Muestra el ID de los futbolistas cuyo
apellido sea GÓMEZ. */

SELECT id, apellidos FROM futbolistas WHERE apellidos = 'GOMEZ';

/* Indica los apellidos de los futbolistas
que empiezan por G. */

SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G%';

/* Devuelve todos los datos de los
futbolistas cuya posición sea
DEFENSA o DELANTERO. */

SELECT posicion FROM futbolistas WHERE posicion IN ('DEFENSA', 'DELANTERO');
SELECT posicion FROM futbolistas WHERE posicion = 'DEFENSA' OR posicion = 'DELANTERO';

/* Obtén el nombre de los futbolistas
que cobran entre 100.000 y 200.000
euros (SALARIO). */

SELECT nombre, salario FROM futbolistas WHERE salario BETWEEN 100000 AND 200000;
SELECT nombre, salario FROM futbolistas WHERE salario >= 100000 AND salario <= 200000;

SELECT 4+4*3 FROM dual; //sólo un campo y una fila para hacer pruebas.
SELECT 4+4*3 || 'a' FROM dual; //concatenar
SELECT 4+4*3+null FROM dual; //Será siempre null las operaciones con null
SELECT to_char (sysdate, 'dd/mm/yy hh:mi:ss') FROM dual;

SELECT COUNT(nombre) FROM futbolistas; //contar
SELECT presupuesto + 50 FROM equipos; //operador entre valor y campos.
SELECT presupuesto + presupuesto FROM equipos; //operador entre dos campos

/* EJERCICIO 7
Se va a hacer un aumento de sueldo
de los PORTEROS. Para ello obtén el
nombre, apellido y el nuevo salario
de los PORTEROS si se aumenta un
10% el que tienen actualmente. La
lista debe estar ordenada
alfabéticamente por los apellidos. */

SELECT nombre, apellidos, salario * 1.10 FROM futbolistas WHERE posicion = 'PORTERO' ORDER BY apellidos;

//CONCATENACIONES

SELECT 'lo que sea ' || 'lo que sea' FROM dual;
SELECT 'lo que sea ' || salario FROM futbolistas;
SELECT apellidos || ', ' || nombre FROM futbolistas;

//MÉTODOS - FUNCIONES

nombredelafuncion()
SELECT LOWER(apellidos) || ', ' || nombre FROM futbolistas;
SELECT LOWER(apellidos || ', ' || nombre) FROM futbolistas;
SELECT INITCAP(apellidos || ', ' || nombre) "Futbolista" FROM futbolistas;

/* EJERCICIO 8
Devuelve en una única columna el
nombre del futbolista seguido de la
palabra “es” y a continuación la
posición que ocupa. La columna
debe llamarse “Posiciones”.*/

SELECT nombre || ' es', posicion "Posiciones" FROM futbolistas;

/* EJERCICIO 9
Queremos saber todos los datos de
los futbolistas que ganen más de
150.000 euros y sean defensas. */

SELECT * FROM futbolistas WHERE NOT (salario > 150000 AND posicion = 'DEFENSA');
SELECT * FROM futbolistas WHERE NOT salario > 150000 AND posicion = 'DEFENSA';

SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G%E%';
SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G__E%';
SELECT apellidos FROM futbolistas WHERE apellidos LIKE 'G__EZ';
SELECT * FROM futbolistas;

/* EJERCICIO 11
Realiza una consulta que te devuelva
los campos Nombre, Salario, Salario
bruto terminado en la palabra “euros”
y llamando a esa columna “Salario
bruto”.
Nota: el salario bruto de un futbolista se obtiene
añadiéndole el 50% de impuestos, es decir
multiplicando por 1,5.
*/

SELECT INITCAP(nombre), salario, salario * 1.50 || ' Euros' "Salario bruto" FROM futbolistas WHERE LOWER (posicion) = 'mediocentro' ORDER BY nombre;

/* Ejercicio 12
Realiza las siguientes operaciones
utilizando funciones numéricas:*/
//1. Calcula el valor absoluto de -10.
SELECT ABS (-10) FROM dual;

//2. Obtén el exponente en base e de 4.
SELECT EXP (3) FROM dual;

//3. Redondea el número 15,3 a 16.
SELECT CEIL (15.3) FROM dual;

//4. Redondea el número anterior (15,3) a 15.
SELECT FLOOR (15.3) FROM dual;

//5. Calcula el resto de 15 entre 3 (15/3).
SELECT MOD (15,3) FROM dual;

//6. Eleva 15 al exponente 2 (152). 
SELECT POWER (15,2) FROM dual;

/* Ejercicio 13
Realiza las siguientes operaciones
utilizando funciones numéricas:*/
//1. Redondea 15,789 con un decimal.
SELECT ROUND(15.789, 1) FROM dual;

//2. Obtén la raíz cuadrada de 128.
SELECT SQRT(128) FROM dual;

//3. Trunca 15,789 a 1 decimal.
SELECT TRUNC(15.789, 1) FROM dual;

//4. Trunca 15,789 para dejarlo sin decimales (15).
SELECT TRUNC(15.789) FROM dual;

//5. Trunca 157,89 para dejarlo en 100.
SELECT TRUNC(157.89, -2) FROM dual;

//6. Obtén el signo de -15 (es decir -1).
SELECT SIGN(-15) FROM dual;

//FUNCIONES DE CADENAS DE CARÁCTERES

SELECT CHR(124) FROM dual;
SELECT ASCII('A') FROM dual;
SELECT CONCAT(CONCAT (nombre,estadio), presupuesto) FROM equipos;
SELECT LPAD('nombre',10,' ') FROM dual; //quiero una cadena con 10 carácteres, si la cadena no llega a 10 lo rellena por la izq hasta 10
SELECT RPAD('nombre',10,' ') FROM dual; //Igual que LPAD pero del revés
SELECT INITCAP('nombre') FROM dual;
SELECT LOWER('NOMBRE') FROM dual;
SELECT UPPER('nombre') FROM dual;
SELECT REPLACE(nombre, 'QUI','KI') FROM equipos;
SELECT REPLACE(nombre, 'E','-') FROM futbolistas;
SELECT SUBSTR('holacar',2,4) FROM dual;
SELECT SUBSTR(nombre,7,4) FROM futbolistas;
SELECT LENGTH(nombre) FROM futbolistas;
SELECT TRIM (' hola ')  FROM dual;
SELECT LTRIM (' hola ')  FROM dual;
SELECT RTRIM (' hola ')  FROM dual;
SELECT nombre, INSTR(nombre,'E') "Primera E", INSTR(nombre, 'E',1,2) "Segunda E", INSTR(nombre, 'E',5,1) "Trampa" FROM futbolistas;
SELECT INSTR('la b no la d','a',3) FROM dual;
SELECT INSTR('la b no la d','a',-2,3) FROM dual;

// EJERCICIO 4 SEMANAL 2
SELECT nombre FROM futbolistas;
SELECT INSTR(nombre,' ') FROM futbolistas;
SELECT SUBSTR(nombre || ' ', 1, INSTR(nombre || ' ', ' ')) AS "SÓLO NOMBRE" FROM futbolistas;

//FUNCIONES PARA TRATAR FECHAS
SELECT SYSTIMESTAMP from dual;
SELECT SYSDATE FROM dual;
SELECT EXTRACT(DAY FROM fecha_nacimiento) FROM futbolistas;

// Ejercicio 15
// 1. Obtén en tres columnas independientes, el día, el mes y la fecha de hoy.
SELECT EXTRACT(DAY FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(YEAR FROM SYSDATE) FROM dual;

// 2. Muestra por pantalla la fecha que será dentro de 6 meses utilizando ADD_MONTHS.
SELECT ADD_MONTHS(SYSDATE, 6) FROM dual;

// 3. Muestra el número de meses que hay entre hoy y la fecha de nacimiento de todos los futbolistas.
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, fecha_nacimiento))FROM futbolistas;

// 4. ¿Cuál es el último día de este mes? Muéstralo.
SELECT LAST_DAY(SYSDATE) FROM dual;

// 5. ¿Qué día será el próximo lunes? Ponlo por pantalla mediante una petición.
SELECT NEXT_DAY(SYSDATE, 'LUNES') FROM dual;

// 6. Muestra el día que era hace 4 días. ¿Y el día demañana? 
SELECT SYSDATE - 4 "HACE 4D", SYSDATE + 1 "MAÑANA" FROM dual;

//FUNCIONES DE CONVERSIÓN




