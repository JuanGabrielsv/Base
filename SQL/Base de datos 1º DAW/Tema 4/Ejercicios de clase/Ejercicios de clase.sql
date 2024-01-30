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

SELECT ADD_MONTHS(TO_DATE('24/05/2024'), 6) FROM dual;
SELECT TO_DATE ('25/06/24') + 1 FROM dual;

TO_CHAR(),TO_NUMBER(),TO_DATE()

SELECT TO_NUMBER ('75.83€','99.99L') * 5 + 54 - salario FROM futbolistas;
SELECT TO_NUMBER ('$75.83','$99.99') * 5 + 54 - salario FROM futbolistas;
SELECT TO_NUMBER ('-$75.83','S$99.99') * 5 + 54 - salario FROM futbolistas;

SELECT TO_CHAR(sysdate, 'HH:mm') FROM dual;
SELECT sysdate FROM dual;

SELECT TO_DATE('01/' || TO_CHAR(sysdate,'mm') || '/23') FROM dual; // dd/mm/yy hh:mm:ss

// Ejercicio 16
// 1. Convierte ‘1000.45’ a un número.
SELECT TO_NUMBER('1000.45','9999.99') FROM dual;

// 2. Convierte ‘1000.45€’ a un número.
SELECT TO_NUMBER('1000.45€','9999.99L') FROM dual;

// 3. Convierte ‘-$1000.45’ a un número.
SELECT TO_NUMBER('-$1,000.45','S$9999.99') FROM dual;

// 4. Muestra el día de hoy con los siguientes formatos: 12/02/2021, 12/02/21, 12-feb-2021, 12 de febrero de 2021
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD-mon-YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') || ' de ' ||
REPLACE(TO_CHAR(SYSDATE, 'month'),' ','') || ' de ' || TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;

// 5. Convierte el ID de la tabla FUTBOLISTAS en un número de tres cifras.
SELECT TO_NUMBER(SUBSTR(ID,2,LENGTH(ID)-1),'99999')FROM FUTBOLISTAS;

// 6. Muestra todos los años de nacimiento de los futbolistas (solo el año, ej.: 1990, 1991, etc.). Ordénalos de menor a mayor año.
SELECT TO_CHAR(FECHA_NACIMIENTO,'YYYY') FROM FUTBOLISTAS ORDER BY 1;

//

UPDATE partidos SET arbitro = NULL WHERE ID = 6;

SELECT arbitro FROM partidos;
SELECT NVL(arbitro,'sin ánimo de lucro, algeciras') FROM partidos;

/*Ejercicio 17
1. Utiliza la función DECODE para mostrar, respecto de los
EQUIPOS, el valor 1000k si el presupuesto es de 1000000,
2000k si el presupuesto es de 2000000, o 3000k si el
presupuesto asciende a 3000000. Y si no es ninguna que ponga "ok"*/

SELECT decode(presupuesto,1000000,'1000K',2000000,'2000K',3000000,'3000K','ok') FROM equipos;

// AGRUPAMIENTO O AGREGADO

SELECT dlfkgj FROM sdlkfjg WHERE ____ GROUP BY _____ HAVING _____;

SELECT * FROM futbolistas;
SELECT count(*),posicion FROM futbolistas GROUP BY posicion HAVING posicion LIKE 'DE%';

//Quiero saber la suma total de los presupuestos de los equipos
SELECT * FROM equipos;
SELECT SUM(presupuesto) FROM equipos;
SELECT SUM(presupuesto) FROM equipos WHERE ID IN (1,2);
SELECT COUNT(*) FROM equipos;
SELECT COUNT(id) FROM equipos;
SELECT COUNT(id) FROM partidos;
SELECT COUNT(arbitro) FROM partidos;
SELECT COUNT(*) FROM partidos;

//MIN, MAX, AVG
SELECT MAX(presupuesto) FROM equipos;
SELECT MIN(presupuesto) FROM equipos;
SELECT AVG(presupuesto) FROM equipos;

//Cuantos futbolistas con delanteros?
SELECT COUNT(id) FROM futbolistas WHERE posicion='DELANTERO';
//Dame una lista con el número de futbolistas que hay por cada posicion
SELECT posicion, COUNT(*) FROM futbolistas GROUP BY posicion;
select count(*),posicion from futbolistas group by posicion having posicion like 'DE%';

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

SELECT * FROM futbolistas;

//Ejercicio 1 - Calcula:
//Obtén el nombre del futbolista más alto.
SELECT nombre FROM futbolistas WHERE altura = (SELECT MAX(altura) FROM futbolistas);

//Indica los apellidos del futbolista más delgado.
SELECT apellidos, peso FROM futbolistas WHERE peso = (SELECT MIN(peso) FROM
futbolistas);
SELECT CONCAT('peso: ',CONCAT(MIN(peso),' Kg')) FROM futbolistas;

//¿Cuántos futbolistas miden entre 1,75 y 1,82?
SELECT COUNT(*) FROM futbolistas WHERE altura BETWEEN 175 AND 182;
SELECT COUNT(*) FROM futbolistas WHERE altura >= 175 AND altura <= 182;

//¿Cuál es la media de altura de los futbolistas con dos decimales?
SELECT ROUND(AVG(altura),2) FROM futbolistas;

//¿Cuál es la media de peso de los futbolistas con un decimal?
SELECT ROUND(AVG(peso),1) FROM futbolistas;

//Ejercicio 2 Calcula:
//¿Cuál es el futbolista que cobra más dinero?
SELECT nombre FROM futbolistas WHERE salario = (SELECT MAX(salario) FROM futbolistas);

//¿En qué año nació el futbolista que cobra menos dinero?
SELECT fecha_nacimiento FROM futbolistas WHERE salario = (SELECT MIN(salario) FROM futbolistas);

--Ejercicio 3
--Calcula la media del sueldo de los futbolistas (con dos decimales) agrupado por la posición que ocupan.
select posicion,trunc(avg(salario),2) from futbolistas group by posicion;
--Obtén el número de futbolistas en cada equipo.
select id_equipo equipo,count(*) "total de futbolistas" from futbolistas group by id_equipo;
--Obtén ahora el número de futbolistas de cada equipo cuyo ID sea 1 o 2.
select id_equipo,count(*) from futbolistas group by id_equipo having id_equipo = 1 or id_equipo = 2; --in...

/* 1. Devuelve el nombre del futbolista cuyo salario es el más bajo posible de todos los futbolistas nacidos entre 1985 y 1990. */

-- Esta es la forma lógica que he hecho pero no funciona porque siempre busca el valor mínimo de salario, si cambiamos la fecha el resultado sale en blanco lo he intentado de dos formas.
select nombre from futbolistas where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990 and salario = (select min(salario) from futbolistas where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990);

SELECT SYSDATE-TO_DATE('03/07/1970') FROM dual;
SELECT SYSDATE-TO_DATE('03071970') FROM dual;
SELECT FLOOR(SYSDATE-TO_DATE('03071970')) FROM dual;

//MULTITABLAS

SELECT * FROM equipos,partidos;
SELECT * FROM equipos,partidos WHERE id_equipo_casa = equipos.id;

/* Ejercicio 2 Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo. */

SELECT * FROM futbolistas WHERE;
SELECT * FROM equipos;
SELECT futbolistas.nombre "Futbolistas", equipos.nombre "Equipo" FROM futbolistas,equipos WHERE futbolistas.id_equipo = equipos.id;

SELECT * FROM futbolistas CROSS JOIN equipos;

SELECT * FROM emp NATURAL JOIN dept;

/*
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
*/

/* Ejercicio 6
Muestra el nombre de los futbolistas
seguido del nombre del equipo en el
que juega utilizando JOIN … ON. */

SELECT futbolistas.nombre, equipos.nombre FROM futbolistas JOIN equipos ON futbolistas.id_equipo = equipos.id;
SELECT futbolistas.nombre, equipos.nombre FROM futbolistas JOIN equipos ON equipos.id = futbolistas.id_equipo;

SELECT * FROM futbolistas JOIN equipos ON equipos.id = futbolistas.id_equipo; //megatabla

SELECT * FROM futbolistas INNER JOIN equipos ON futbolistas.id_equipo = equipos.id;

INSERT INTO futbolistas VALUES ('F11120','NOMBRE','APELL',null,'PORTERO',3000000,null,180,83);
INSERT INTO equipos VALUES (4,'REAL BETIS BALOMPIE','BENITO VILLAMARIN',80000000);
SELECT * FROM futbolistas;
SELECT * FROM equipos;

SELECT * FROM futbolistas LEFT JOIN equipos ON futbolistas.id_equipo = equipos.id;

SELECT * FROM futbolistas RIGHT JOIN equipos ON futbolistas.id_equipo = equipos.id;

SELECT * FROM futbolistas FULL OUTER JOIN equipos ON futbolistas.id_equipo = equipos.id;

--28 Calcular el numero de segundos transcurridos desde la ultima madianoche (máscara 'sssss' en to_char
SELECT TO_CHAR(SYSDATE,'sssss') FROM dual;

/* Ejercicio 8
Obtén el nombre, apellidos y nombre del equipo
de los futbolistas que sean defensas. */
SELECT futbolistas.nombre, futbolistas.apellidos, equipos.nombre FROM futbolistas JOIN equipos ON futbolistas.id_equipo = equipos.id WHERE posicion = 'DEFENSA';

/* 1. Devuelve el nombre del futbolista cuyo salario es el más bajo posible de todos los futbolistas nacidos 
entre 1985 y 1990.

--Obtener el salario más bajo posible 

select * from futbolistas;
select min(salario) from futbolistas;
select nombre 
    from futbolistas 
    where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990
        and salario = (
            select min(salario) 
                from futbolistas 
                where to_char(fecha_nacimiento,'yyyy') between 1985 and 1990
            );
/*
25. Seleccionar la fecha del sistema (nombre del día, día, nombre del mes, año, horas (24):minutos:segundos).
No debe haber espacios sobrantes en el nombre del día o del mes.

select  replace(to_char(sysdate,'DAY'),' '), 
        to_number(to_char(sysdate,'dd')),
        replace(to_char(sysdate,'month'),' ',''),
        to_number(to_char(sysdate,'yyyy')),
        to_char(sysdate,'hh24:mi:ss')
            from dual;
--TO_CHAR
to_char(valorquesequieremostraroconvertir,máscara)
 
--27. Calcular el número de días vividos hasta hoy por una persona nacida el día 3 de julio de 1970.
select sysdate-'03/07/1970' from dual;
select round((sysdate-to_date('03/07/1970'))*salario,2) from futbolistas;
select floor(sysdate-to_date('03071970')) from dual;
 
--10. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisión.
is not null
 
select * from equipos,partidos;
select * from equipos,partidos
    where id_equipo_casa = equipos.id;
 
/*    
Ejercicio 2
Muestra los datos de los nombres de los futbolistas junto al nombre de su equipo.
Necesitas multitablas, futbolistas y equipos. EMPLEA WHERE para relacionar FK de futbolistas y PK de equipos.

select * from futbolistas;
select * from equipos;
select futbolistas.nombre "Futbolista",equipos.nombre "Equipo" 
    from futbolistas,equipos 
    where futbolistas.id_equipo = equipos.id;
select * from futbolistas cross join equipos;
 
select * from emp natural join dept;
 
select futbolistas.nombre, equipos.nombre from futbolistas join equipos on equipos.id =  futbolistas.id_equipo;
select * from futbolistas join equipos on equipos.id =  futbolistas.id_equipo;
select * from futbolistas;
 
insert into equipos values (4,'REAL BETIS BALOMPIE','BENITO VILLAMARIN',80000000);
 
    
insert into futbolistas values ('F11120','NOMBRE','APELL',null,'PORTERO',3000000,null,180,83);
insert into equipos values (4,'REAL BETIS BALOMPIE','BENITO VILLAMARIN',80000000);
select * from futbolistas;
select * from equipos;
 
select * 
    from futbolistas
    left join equipos
    on futbolistas.id_equipo = equipos.id;
select * 
    from futbolistas
    right join equipos
    on futbolistas.id_equipo = equipos.id;
select * 
    from equipos
    left join futbolistas
    on futbolistas.id_equipo = equipos.id;
select * 
    from equipos
    full outer join futbolistas
    on futbolistas.id_equipo = equipos.id;
--28. Calcular el número de segundos transcurridos desde la última medianoche (máscara 'sssss' en to_char).
select to_char(sysdate,'sssss') from dual;
 
/*
Ejercicio 8
Obtén el nombre, apellidos y nombre del equipo de los futbolistas que sean defensas.

select f.nombre,f.apellidos,e.nombre from futbolistas f join equipos e on f.id_equipo = e.id where f.posicion = 'DEFENSA';
select futbolistas.nombre,futbolistas.apellidos,equipos.nombre from futbolistas join equipos on futbolistas.id_equipo = equipos.id where futbolistas.posicion = 'DEFENSA'; */

/*Ejercicio 9
Obtén el nombre, apellidos y nombre del equipo
de los futbolistas con un LEFT JOIN y un RIGHT
JOIN. ¿Cuál es la diferencia?*/

SELECT futbolistas.nombre, futbolistas.apellidos, equipos.nombre FROM futbolistas LEFT JOIN equipos ON futbolistas.id_equipo = equipos.id;
SELECT futbolistas.nombre, futbolistas.apellidos, equipos.nombre FROM futbolistas RIGHT JOIN equipos ON futbolistas.id_equipo = equipos.id;

SELECT * FROM futbolistas;

SELECT * FROM futbolistas WHERE salario > 1500000;

SELECT * FROM futbolistas WHERE posicion = 'PORTERO';

//UNION

/*DROP TABLE FUTBOLISTAS_2023 CASCADE CONSTRAINTS;
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

DELETE FROM FUTBOLISTAS_2023 WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';*/

//UNION

SELECT nombre, apellidos FROM futbolistas;
SELECT nombre, apellidos FROM futbolistas_2023;

SELECT nombre, apellidos FROM futbolistas UNION SELECT nombre, apellidos FROM futbolistas_2023;

SELECT nombre, apellidos FROM futbolistas INTERSECT SELECT nombre, apellidos FROM futbolistas_2023;

SELECT nombre, apellidos FROM futbolistas MINUS SELECT nombre, apellidos FROM futbolistas_2023; // hay 5

SELECT nombre, apellidos FROM futbolistas_2023 MINUS SELECT nombre, apellidos FROM futbolistas; // hay 4

/*create table dept(
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
);*/
 
 
--REPASO
--1. Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle.
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM emp JOIN dept ON emp.deptno = dept.deptno;
SELECT * FROM dept JOIN emp ON emp.deptno = dept.deptno; 
SELECT emp.ename, emp.sal FROM emp INNER JOIN dept ON emp.deptno = dept.deptno WHERE dept.loc = 'DALLAS';
--2. Indica el id, nombre y sueldo de los empleados que estén en departamentos donde haya otros compañeros 
--empleados con una letra 'u' en su nombre, y que además ganen sueldos mayores que la media de los sueldos 
--de la empresa.
SELECT empno, ename, sal FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename LIKE '%U%') and sal > (SELECT AVG(sal) FROM emp);

--3. Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive.
SELECT dept.deptno, emp.ename, emp.job FROM emp JOIN dept ON dept.deptno = emp.deptno WHERE dname = 'SALES';
 
--4. Muestra el nombre y salario de los empleados que tengan a KING como jefe directo.
SELECT ename, sal FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');

--4.1 Muestra el no mbre y salario de los empleados que estén en el mismo departamento de KING.
SELECT ename, sal FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'KING') and MGR IS NOT NULL;
 
--5. Devuelve el nombre y sueldo de los empleados que ganen más dinero que la media de la empresa, ordenado 
--por sueldo de mayor a menor.
SELECT emp.ename, emp.sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) ORDER BY sal DESC;

-- 1. Mostrar los nombres de los empleados que tengan un salario mayor que el de JAMES.
SELECT ename FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'JAMES');
-- 2. Mostrar los nombres de los empleados que trabajan en el mismo departamento que SMITH. Ordena el resultado.
SELECT ename FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'SMITH') AND ename != 'SMITH' ORDER BY ename DESC;
-- 5. Mostrar qué empleados del departamento donde trabaja FORD, ganan más que lo que gana JAMES. 
SELECT * FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'FORD') AND sal > (SELECT sal FROM emp WHERE ename = 'JAMES');
-- 7. ¿Cuántos empleados ganan menos que MILLER?
SELECT COUNT(*) FROM emp WHERE sal < (SELECT sal FROM emp WHERE ename = 'MILLER');

/* 34.Calcular cuanto debería haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese año).*/
SELECT ename, hiredate,sal, ROUND(MONTHS_BETWEEN(TO_DATE('31/12/' || TO_CHAR(hiredate, 'yyyy')),hiredate)*sal,2)"cuantía a cobrar el primer año" FROM emp;
select ename,round(months_between(to_date('31/12/' || to_char(hiredate,'yyyy')),hiredate) * sal,2) "Cuantía a cobrar el primer año" from emp;