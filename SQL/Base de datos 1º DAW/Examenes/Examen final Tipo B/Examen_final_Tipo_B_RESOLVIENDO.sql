SET SERVEROUTPUT ON;

DECLARE
BEGIN 
    dbms_output.put_line('Test');
END;
/

//BORRADO DE TABLAS

/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;*/

DROP TABLE equipos CASCADE CONSTRAINTS;
DROP TABLE futbolistas CASCADE CONSTRAINTS;
DROP TABLE partidos CASCADE CONSTRAINTS;

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
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO
LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE
'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

/* ### EJERCICIO 1
1. Crea una función llamada obtenerFutbolistasPorAnosDos que reciba como 
parámetros dos años con cuatro dígitos (ej.: 2015 y 2011). Debes mostrar 
por la salida el nombre del futbolista y el nombre del equipo en el que juega de
aquellos futbolistas nacidos entre esos dos años pasados por parámetro 
(ambos inclusives). NOTA: los años deben poder meterse con cualquier orden, da 
igual que el primero sea mayor que el segundo, al revés, o que ambos sean 
iguales, debe funcionar indistintamente. Se devolverá un número con el total de
futbolistas mostrados. Debe devolver 1 si lo hace correctamente, es decir, hay 
futbolistas, y -1 si no los hay. */
SELECT futbolistas.nombre, equipos.nombre, futbolistas.fecha_nacimiento FROM
    futbolistas JOIN equipos ON equipos.id = futbolistas.id_equipo;
    
CREATE OR REPLACE FUNCTION obtenerFutbolistasPorAnosDos(anyo1 INT, anyo2 INT) 
    RETURN INT
IS
    vContador INT := 0;
    CURSOR cDatos IS
        SELECT futbolistas.nombre AS futNombre, equipos.nombre AS equiNombre, 
        futbolistas.fecha_nacimiento FROM futbolistas 
        JOIN equipos ON equipos.id = futbolistas.id_equipo;
BEGIN
    FOR fila IN cDatos
        LOOP
            IF anyo1 > anyo2 THEN
                IF TO_NUMBER(TO_CHAR(fila.fecha_nacimiento, 'yyyy')) BETWEEN anyo2 AND anyo1 THEN
                    dbms_output.put_line(fila.futNombre);
                    vContador := vContador + 1;
                END IF;
            ELSIF anyo1 < anyo2 THEN
                IF TO_NUMBER(TO_CHAR(fila.fecha_nacimiento, 'yyyy')) BETWEEN anyo1 AND anyo2 THEN
                    dbms_output.put_line(fila.futNombre);
                    vContador := vContador + 1;
                END IF;
            ELSE 
                IF TO_NUMBER(TO_CHAR(fila.fecha_nacimiento, 'yyyy')) = anyo1 THEN
                    dbms_output.put_line(fila.futNombre);
                    vContador := vContador + 1;
                END IF;
            END IF;
        END LOOP;    
    IF vContador = 0 THEN
        RETURN -1;
    ELSE
        RETURN vContador;
    END IF;
END;
/

/* 2. Crea un programa que llame a obtenerFutbolistasPorAnosDos con estos tres
supuestos (respeta el orden de los parámetros): 
2.1. 1989 y 1984. 
2.2. 2001 y 2001. 
2.3. 2015 y 2017. */
BEGIN
    dbms_output.put_line(obtenerFutbolistasPorAnosDos(1989, 1984));
    dbms_output.put_line(obtenerFutbolistasPorAnosDos(2001, 2001));
    dbms_output.put_line(obtenerFutbolistasPorAnosDos(2015, 2017));
END;
/

/* ### EJERCICIO 2
Se va trabajar sobre la tabla FUTBOLISTAS y EQUIPOS. Se quiere hacer un CRUD 
completo por lo que necesitamos crear distintas funciones y procedimientos para 
poder crear, editar, consultar o borrar registros de esta tabla. Además, todas 
estas funciones y procedimientos deberán estar dentro de un paquete llamado 
paqFutbolistas. Se pide: */

/* 1.1 Crea una función meterFutbolista que tenga como parámetros todos los 
campos de la tabla FUTBOLISTAS. No hace falta que compruebas que estos datos se 
introducen bien o no, pero sí debes COMPROBAR que el ID introducido no existe 
previamente en la base de datos, y además es válido (recuerda que ese campo 
ID es PK con la restricción de que sea F seguido de 3 números y luego el 
número 20. Si tienes dudas mira la restricción en la tabla). 
Si el ID introducido como parámetro no es válido, muestra en la salida el 
mensaje "ID no válido" y devuelve -1. Si el ID no existe y el ID es válido, 
inserta en la base de datos a ese nuevo futbolista, muestra por la salida el 
mensaje "Futbolista creado correctamente" y devuelve 1. Si el ID ya existía en 
la base de datos, muestra por la salida el mensaje "Ese ID ya existe" y 
devuelve 0. */
CREATE OR REPLACE FUNCTION meterFutbolista(
    vId futbolistas.id%TYPE,
    vNombre futbolistas.nombre%TYPE,
    vApellidos futbolistas.apellidos%TYPE,
    vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
    vPosicion futbolistas.posicion%TYPE,
    vSalario futbolistas.salario%TYPE,
    vIdEquipo futbolistas.id_equipo%TYPE,
    vAltura futbolistas.altura%TYPE,
    vPeso futbolistas.peso%TYPE) RETURN INT
IS
    vExiste futbolistas.id%TYPE;
BEGIN
    SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
    dbms_output.put_line('Ese ID ya existe');
    RETURN 0;
EXCEPTION
    WHEN no_data_found THEN
        IF LENGTH(vId) = 6 AND SUBSTR(vId, 1, 1) = 'F' 
            AND (TO_NUMBER(SUBSTR(vId, 2, 3)) BETWEEN 0 AND 999)
            AND (TO_NUMBER(SUBSTR(vId, 5, 2)) = 20) 
            THEN
                INSERT INTO futbolistas VALUES(vId, vNombre, vApellidos, vFechaNacimiento, 
                vPosicion, vSalario, vIdEquipo, vAltura, vPeso);
                dbms_output.put_line('Futbolista creado correctamente');
                RETURN 1;
        ELSE
            dbms_output.put_line('Id no válido');
            RETURN -1;
        END IF;        
END;
/

BEGIN
    dbms_output.put_line(meterFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 55000, 2, 177, 72.5)); 
END;
/

/* 1.2 Crea una función editarFutbolista que tenga como parámetros todos los 
campos de la tabla FUTBOLISTAS. Como en el caso anterior, no vamos a comprobar 
todas las restricciones de todos los campos, asumimos que están bien, salvo el 
ID. En este caso no será necesario comprobar nada más que el ID existe ya que 
es el único caso en que se editará el futbolista. Si no existe, mostrar por la 
salida el mensaje "No existe ese ID", no hace falta indicar si es válido o no, 
y devolver -1. Si el ID existe, modificar los valores de los campos del 
futbolista, TODOS menos el ID, con los valores pasados por parámetros a la 
función. Mostrar por la salida el mensaje "Futbolista editado correctamente" 
y devolver 1. */
CREATE OR REPLACE FUNCTION editarFutbolista(
    vId futbolistas.id%TYPE,
    vNombre futbolistas.nombre%TYPE,
    vApellidos futbolistas.apellidos%TYPE,
    vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
    vPosicion futbolistas.posicion%TYPE,
    vSalario futbolistas.salario%TYPE,
    vIdEquipo futbolistas.id_equipo%TYPE,
    vAltura futbolistas.altura%TYPE,
    vPeso futbolistas.peso%TYPE) RETURN INT
IS
    vExiste futbolistas.id%TYPE;
BEGIN
    SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
    IF LENGTH(vId) = 6 AND SUBSTR(vId, 1, 1) = 'F' 
            AND (TO_NUMBER(SUBSTR(vId, 2, 3)) BETWEEN 0 AND 999)
            AND (TO_NUMBER(SUBSTR(vId, 5, 2)) = 20) 
            THEN
                UPDATE futbolistas SET
                futbolistas.id = vId,
                futbolistas.nombre = vNombre,
                futbolistas.apellidos = vApellidos,
                futbolistas.fecha_nacimiento = vFechaNacimiento,
                futbolistas.posicion = vPosicion,
                futbolistas.salario = vSalario,
                futbolistas.id_equipo = vIdEquipo,
                futbolistas.altura = vAltura,
                futbolistas.peso = vPeso
                WHERE futbolistas.id = vId;
                
                dbms_output.put_line('Futbolista actualizado correctamente');
                RETURN 1;
        ELSE
            dbms_output.put_line('Id no válido');
            RETURN -1;
        END IF;
    RETURN 0;
EXCEPTION
    WHEN no_data_found THEN
    dbms_output.put_line('"No existe ese ID"');
    RETURN -1;                
END;
/
BEGIN
    dbms_output.put_line(editarFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 55000, 2, 177, 72.5)); 
END;
/    

/* 1.3 Crear un procedimiento llamado eliminarFutbolista que tenga como 
parámetro de entrada un ID de futbolista. Si existe ese ID en la tabla 
futbolistas, borrar toda la fila de ese ID y mostrar por la salida el mensaje 
"Futbolista borrado correctamente". Si ese ID no existe, utilizar una EXCEPCIÓN
y mostrar por la salida el mensaje "No existe ese ID". */
CREATE OR REPLACE PROCEDURE eliminarFutbolista(vId futbolistas.id%TYPE)
IS
    vExiste futbolistas.id%TYPE;
BEGIN
    SELECT futbolistas.id INTO vExiste FROM futbolistas WHERE futbolistas.id = vId;
    DELETE FROM futbolistas WHERE futbolistas.id = vId;
    dbms_output.put_line('Futbolista borrado correctamente');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe ese ID');
END;
/
BEGIN
    eliminarFutbolista('F40320');
END;
/

/* 1.4 Se quiere obtener un informe con los futbolistas que juegan en un 
determinado equipo. Para ello crea un procedimiento mostrarFutbolistasEquipo 
que tenga como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la 
tabla EQUIPOS) y muestre por la salida de consola todos los futbolistas que 
juegan en ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS). */
SELECT futbolistas.nombre FROM futbolistas JOIN equipos ON equipos.id = futbolistas.id_equipo WHERE equipos.nombre = 'EQUIPO A';

CREATE OR REPLACE PROCEDURE mostrarFutbolistas(vNombreEquipo equipos.nombre%TYPE)
IS
    vExiste equipos.nombre%TYPE;
    CURSOR cDatos IS 
        SELECT futbolistas.nombre AS futNombre, equipos.nombre AS equiNombre FROM futbolistas JOIN equipos 
        ON equipos.id = futbolistas.id_equipo WHERE equipos.nombre = vNombreEquipo;
BEGIN
    SELECT equipos.nombre INTO vExiste FROM equipos WHERE equipos.nombre = vNombreEquipo;
    FOR fila IN cDatos
        LOOP
            dbms_output.put_line(fila.futNombre ||' '|| fila.equiNombre);
        END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe ese equipo');
END;
/

BEGIN
    mostrarFutbolistas('EQUIPO A');
END;
/

/* 1.5 Debes introducir todas las funciones y procedimientos anteriores dentro 
de un paquete llamado paqFutbolistas. */
CREATE OR REPLACE PACKAGE paqFutbolistas
IS
    FUNCTION meterFutbolista(
    vId futbolistas.id%TYPE,
    vNombre futbolistas.nombre%TYPE,
    vApellidos futbolistas.apellidos%TYPE,
    vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
    vPosicion futbolistas.posicion%TYPE,
    vSalario futbolistas.salario%TYPE,
    vIdEquipo futbolistas.id_equipo%TYPE,
    vAltura futbolistas.altura%TYPE,
    vPeso futbolistas.peso%TYPE) RETURN INT;
    
    FUNCTION editarFutbolista(
    vId futbolistas.id%TYPE,
    vNombre futbolistas.nombre%TYPE,
    vApellidos futbolistas.apellidos%TYPE,
    vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
    vPosicion futbolistas.posicion%TYPE,
    vSalario futbolistas.salario%TYPE,
    vIdEquipo futbolistas.id_equipo%TYPE,
    vAltura futbolistas.altura%TYPE,
    vPeso futbolistas.peso%TYPE) RETURN INT;
    
    PROCEDURE eliminarFutbolista(vId futbolistas.id%TYPE);
    PROCEDURE mostrarFutbolistas(vNombreEquipo equipos.nombre%TYPE);
END;
/
CREATE OR REPLACE PACKAGE BODY paqFutbolistas
IS
        FUNCTION meterFutbolista(
            vId futbolistas.id%TYPE,
            vNombre futbolistas.nombre%TYPE,
            vApellidos futbolistas.apellidos%TYPE,
            vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
            vPosicion futbolistas.posicion%TYPE,
            vSalario futbolistas.salario%TYPE,
            vIdEquipo futbolistas.id_equipo%TYPE,
            vAltura futbolistas.altura%TYPE,
            vPeso futbolistas.peso%TYPE) RETURN INT
        IS
            vExiste futbolistas.id%TYPE;
        BEGIN
            SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
            dbms_output.put_line('Ese ID ya existe');
            RETURN 0;
        EXCEPTION
            WHEN no_data_found THEN
                IF LENGTH(vId) = 6 AND SUBSTR(vId, 1, 1) = 'F' 
                    AND (TO_NUMBER(SUBSTR(vId, 2, 3)) BETWEEN 0 AND 999)
                    AND (TO_NUMBER(SUBSTR(vId, 5, 2)) = 20) 
                    THEN
                        INSERT INTO futbolistas VALUES(vId, vNombre, vApellidos, vFechaNacimiento, 
                        vPosicion, vSalario, vIdEquipo, vAltura, vPeso);
                        dbms_output.put_line('Futbolista creado correctamente');
                        RETURN 1;
                ELSE
                    dbms_output.put_line('Id no válido');
                    RETURN -1;
                END IF;        
        END;
        
        FUNCTION editarFutbolista(
            vId futbolistas.id%TYPE,
            vNombre futbolistas.nombre%TYPE,
            vApellidos futbolistas.apellidos%TYPE,
            vFechaNacimiento futbolistas.fecha_nacimiento %TYPE,
            vPosicion futbolistas.posicion%TYPE,
            vSalario futbolistas.salario%TYPE,
            vIdEquipo futbolistas.id_equipo%TYPE,
            vAltura futbolistas.altura%TYPE,
            vPeso futbolistas.peso%TYPE) RETURN INT
        IS
            vExiste futbolistas.id%TYPE;
        BEGIN
            SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
            IF LENGTH(vId) = 6 AND SUBSTR(vId, 1, 1) = 'F' 
            AND (TO_NUMBER(SUBSTR(vId, 2, 3)) BETWEEN 0 AND 999)
            AND (TO_NUMBER(SUBSTR(vId, 5, 2)) = 20) 
            THEN
                UPDATE futbolistas SET
                futbolistas.id = vId,
                futbolistas.nombre = vNombre,
                futbolistas.apellidos = vApellidos,
                futbolistas.fecha_nacimiento = vFechaNacimiento,
                futbolistas.posicion = vPosicion,
                futbolistas.salario = vSalario,
                futbolistas.id_equipo = vIdEquipo,
                futbolistas.altura = vAltura,
                futbolistas.peso = vPeso
                WHERE futbolistas.id = vId;
                
                dbms_output.put_line('Futbolista actualizado correctamente');
                RETURN 1;
            ELSE
                dbms_output.put_line('Id no válido');
                RETURN -1;
            END IF;
        RETURN 0;
    EXCEPTION
        WHEN no_data_found THEN
        dbms_output.put_line('"No existe ese ID"');
        RETURN -1;                
    END;
    
    PROCEDURE eliminarFutbolista(vId futbolistas.id%TYPE)
    IS
        vExiste futbolistas.id%TYPE;
    BEGIN
        SELECT futbolistas.id INTO vExiste FROM futbolistas WHERE futbolistas.id = vId;
        DELETE FROM futbolistas WHERE futbolistas.id = vId;
        dbms_output.put_line('Futbolista borrado correctamente');
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe ese ID');
    END;
    
    PROCEDURE mostrarFutbolistas(vNombreEquipo equipos.nombre%TYPE)
    IS
        vExiste equipos.nombre%TYPE;
        CURSOR cDatos IS 
            SELECT futbolistas.nombre AS futNombre, equipos.nombre AS equiNombre FROM futbolistas JOIN equipos 
            ON equipos.id = futbolistas.id_equipo WHERE equipos.nombre = vNombreEquipo;
    BEGIN
        SELECT equipos.nombre INTO vExiste FROM equipos WHERE equipos.nombre = vNombreEquipo;
        FOR fila IN cDatos
            LOOP
                dbms_output.put_line(fila.futNombre ||' '|| fila.equiNombre);
            END LOOP;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe ese equipo');
    END;
END;
/

/* 1.6 Crea un programa que realice lo siguiente:
1. Llamada a la función meterFutbolista del paquete paqFutbolistas para 
   introducir un nuevo futbolista. Pásale los valores que quieras pero debe 
   crear un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
2. Cambia el nombre del futbolista ESTEBAN por PABLO ESTEBAN usando la función 
   editarFutbolista.
3. Borra al futbolista de ID F00620 usando eliminarFutbolista.
4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el 
   EQUIPO A. */
   
BEGIN    
    dbms_output.put_line(paqFutbolistas.meterFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 55000, 2, 177, 72.5));
    
    
END;
/
   
/* ### EJERCICIO 3
Se quiere crear un programa que muestre por la salida de la consola el nombre, 
apellidos y años que tienen los futbolistas que, A DÍA DE HOY TODAVÍA NO HAYAN 
CUMPLIDO AÑOS, es decir, que en lo que va de año hasta HOY, no ha sido su 
cumpleaños. No muestres los futbolistas que sí han cumplido años.*/

