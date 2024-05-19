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
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE 'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

/* EJERCICIO 1 - 6 PUNTOS. 

Se va trabajar sobre la tabla FUTBOLISTAS. Se quiere hacer un CRUD completo por 
lo que necesitamos crear distintas funciones y procedimientos para poder crear, 
editar, consultar o borrar registros de esta tabla. Además, todas estas 
funciones y procedimientos deberán estar dentro de un paquete llamado 
funcFutbolistas. Se pide:

1.1. Crea una función insertarFutbolista que tenga como parámetros todos los 
campos de la tabla FUTBOLISTAS. No hace falta que compruebas que 
estos datos se introducen bien o no, pero sí debes COMPROBAR que el ID 
introducido no existe previamente en la base de datos, y además es válido 
(recuerda que ese campo ID es PK con la restricción de que sea F seguido de 3 
números y luego el número 20. Si tienes dudas mira la restricción en la tabla). 
Si el ID introducido como parámetro no es válido, muestra en la salida el 
mensaje "ID no válido" y devuelve -1. 
Si el ID no existe y el ID es válido, inserta en la base de datos a ese nuevo 
futbolista, muestra por la salida el mensaje "Futbolista creado correctamente" 
y devuelve 1. Si el ID ya existía en la base de datos, muestra por la salida el 
mensaje "Ese ID ya existe" y devuelve 0.
*/

CREATE OR REPLACE FUNCTION insertarFutbolista(
    vid futbolistas.id%TYPE,
    vnombre futbolistas.nombre%TYPE,
    vapellidos futbolistas.apellidos%TYPE,
    vfecha_nacimiento futbolistas.fecha_nacimiento%TYPE,
    vposicion futbolistas.posicion%TYPE,
    vsalario futbolistas.salario%TYPE,
    vid_equipo futbolistas.id_equipo%TYPE,
    valtura futbolistas.altura%TYPE,
    vpeso futbolistas.peso%TYPE) RETURN INT
IS
    existe futbolistas.id%TYPE;
BEGIN
    SELECT id INTO existe FROM futbolistas WHERE ID = vid;
    dbms_output.put_line('Ese ID ya existe');
    RETURN 0;
EXCEPTION
    WHEN no_data_found THEN
        IF LENGTH(vid) = 6 AND SUBSTR(vid,1,1) = 'F' 
            AND (TO_NUMBER(SUBSTR(vid,2,3)) BETWEEN 0 AND 999) 
            AND (TO_NUMBER(SUBSTR(vid,5,2)) = 20) 
            THEN
                INSERT INTO futbolistas VALUES (vid,vnombre,vapellidos,
                vfecha_nacimiento,vposicion,vsalario,vid_equipo,valtura,vpeso);
                dbms_output.put_line('Futbolista creado correctamente');
                RETURN 1;
        ELSE
            dbms_output.put_line('ID no válido');
            RETURN -1;
        END IF;
END;
/
/* PROBAMOS EL MÉTODO */
DECLARE
    
BEGIN
    dbms_output.put_line(insertarFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 55000, 2, 177, 72.5));    
END;
/

/*
1.2. Crea una función actualizaFutbolista que tenga como parámetros todos los 
campos de la tabla FUTBOLISTAS.
Como en el caso anterior, no vamos a comprobar todas las restricciones de todos 
los campos, asumimos que están bien, salvo el ID. En este caso no será necesario
comprobar nada más que el ID existe ya que es el único caso en que se editará el
futbolista.
Si no existe, mostrar por la salida el mensaje "No existe ese ID", 
no hace falta indicar si es válido o no, y devolver -1. 
Si el ID existe, modificar los valores de los campos del futbolista, TODOS menos
el ID, con los valores pasados por parámetros a la función. Mostrar por la 
salida el mensaje "Futbolista editado correctamente" y devolver 1.
*/

CREATE OR REPLACE FUNCTION actualizaFutbolista (
    vId futbolistas.id%TYPE,
    vNombre futbolistas.nombre%TYPE,
    vApellidos futbolistas.apellidos%TYPE,
    vFechaNacimiento futbolistas.fecha_nacimiento%TYPE,
    vPosicion futbolistas.posicion%TYPE,
    vSalario futbolistas.salario%TYPE,
    vIdEquipo futbolistas.id_equipo%TYPE,
    vAltura futbolistas.altura%TYPE,
    vPeso futbolistas.peso%TYPE
    ) RETURN INT
IS
    existe futbolistas.id%TYPE;
BEGIN
    SELECT id INTO existe FROM futbolistas WHERE id = vId;
    UPDATE futbolistas SET
        nombre = vNombre,
        apellidos = vApellidos,
        fecha_nacimiento = vFechaNacimiento,
        posicion = vPosicion,
        salario = vSalario,
        id_equipo = vIdEquipo,
        altura = vAltura,
        peso = vPeso
        WHERE id = existe;
    dbms_output.put_line('Futbolista editado correctamente');
    RETURN 1;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('NO EXISTE ESE ID');
        RETURN -1;        
END;
/

DECLARE

BEGIN
    dbms_output.put_line(actualizaFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 60000, 2, 111, 71.0));
END;
/

/* 1.3. Crear un procedimiento llamado borrarFutbolista que tenga como parámetro
de entrada un ID de futbolista. Si existe ese ID en la tabla futbolistas, borrar
toda la fila de ese ID y mostrar por la salida el mensaje "Futbolista borrado
correctamente". Si ese ID no existe, utilizar una EXCEPCIÓN y mostrar por la 
salida el mensaje "No existe ese ID". */
CREATE OR REPLACE PROCEDURE borrarFutbolista(vId futbolistas.id%TYPE)
IS 
    vExiste futbolistas.id%TYPE;
BEGIN
    SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
    DELETE FROM futbolistas WHERE id = vId;
    dbms_output.put_line('Futbolista borrado correctamente');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Futbolista no existe');
END;
/
    
DECLARE

BEGIN
    borrarFutbolista('F00320');
END;
/

/* 1.4. Se quiere obtener un informe con los futbolistas que juegan en un 
determinado equipo. Para ello crea un procedimiento mostrarFutbolistasEquipo que
tenga como parámetro de entrada el NOMBRE de un equipo (campo NOMBRE de la tabla
EQUIPOS) y muestre por la salida de consola todos los futbolistas que juegan en 
ese equipo (tabla FUTBOLISTAS, campos NOMBRE y APELLIDOS). */

/************************* FORMA 1 *******************************/
CREATE OR REPLACE PROCEDURE mostrarFutbolistasEquipo(vNombre equipos.nombre%TYPE)
IS
    
BEGIN
    dbms_output.put_line('Juegadores en ' || vNombre);
    FOR consulta IN (SELECT f.nombre AS nombre, f.apellidos AS apellidos FROM
            futbolistas f JOIN equipos e ON e.id = f.id_equipo 
            WHERE e.nombre = vNombre)
        LOOP            
            dbms_output.put_line(consulta.nombre ||' '|| consulta.apellidos);
        END LOOP;
END;
/

SELECT f.nombre, f.apellidos FROM
        futbolistas f JOIN equipos e ON e.id = f.id_equipo 
            WHERE e.nombre = vNombre;

DECLARE
BEGIN
    mostrarFutbolistasEquipo('EQUIPO C');
END;
/

/************************* FORMA 2 *******************************/
CREATE OR REPLACE PROCEDURE mostrarFutbolistasEquipo2(vNombre equipos.nombre%TYPE)
IS
    CURSOR cConsulta IS SELECT f.nombre AS nombre, f.apellidos AS apellidos 
        FROM futbolistas f JOIN equipos e ON e.id = f.id_equipo 
        WHERE e.nombre = vNombre;
BEGIN
    dbms_output.put_line('Futbolistas en ' || vNombre);
    FOR consulta IN cConsulta LOOP
        dbms_output.put_line(consulta.nombre ||' '|| consulta.apellidos);
    END LOOP;
END;
/

DECLARE

BEGIN
    mostrarFutbolistasEquipo2('EQUIPO B');
END;
/

/* 1.5. Debes introducir todas las funciones y procedimientos anteriores dentro 
de un paquete llamado funcFutbolistas. */
CREATE OR REPLACE PACKAGE funcFutbolistas
IS
    FUNCTION insertarFutbolista(
        vid futbolistas.id%type,
        vnombre futbolistas.nombre%type,
        vapellidos futbolistas.apellidos%type,
        vfecha_nacimiento futbolistas.fecha_nacimiento%type,
        vposicion futbolistas.posicion%type,
        vsalario futbolistas.salario%type,
        vid_equipo futbolistas.id_equipo%type,
        valtura futbolistas.altura%type,
        vpeso futbolistas.peso%type
    ) RETURN INT;
    
    FUNCTION actualizaFutbolista (
        vId futbolistas.id%TYPE,
        vNombre futbolistas.nombre%TYPE,
        vApellidos futbolistas.apellidos%TYPE,
        vFechaNacimiento futbolistas.fecha_nacimiento%TYPE,
        vPosicion futbolistas.posicion%TYPE,
        vSalario futbolistas.salario%TYPE,
        vIdEquipo futbolistas.id_equipo%TYPE,
        vAltura futbolistas.altura%TYPE,
        vPeso futbolistas.peso%TYPE
    ) RETURN INT;
    
    PROCEDURE borrarFutbolista(vId futbolistas.id%TYPE);
    PROCEDURE mostrarFutbolistasEquipo(vNombre equipos.nombre%TYPE);
    PROCEDURE mostrarFutbolistasEquipo2(vNombre equipos.nombre%TYPE);
END;
/
CREATE OR REPLACE PACKAGE BODY funcFutbolistas
IS
    function insertarFutbolista(
        vid futbolistas.id%type,
        vnombre futbolistas.nombre%type,
        vapellidos futbolistas.apellidos%type,
        vfecha_nacimiento futbolistas.fecha_nacimiento%type,
        vposicion futbolistas.posicion%type,
        vsalario futbolistas.salario%type,
        vid_equipo futbolistas.id_equipo%type,
        valtura futbolistas.altura%type,
        vpeso futbolistas.peso%type) return int
    is
        existe futbolistas.id%type;
    begin
        select id into existe from futbolistas where id = vid;
        dbms_output.put_line('Ese ID ya existe');
        return 0;
    exception
        when no_data_found then
            if length(vid) = 6 and substr(vid,1,1) = 'F' 
                and (to_number(substr(vid,2,3)) between 0 and 999) 
                and (to_number(substr(vid,5,2)) = 20) 
            then
                insert into futbolistas values (vid,vnombre,vapellidos,
                vfecha_nacimiento,vposicion,vsalario,vid_equipo,valtura,vpeso);
                dbms_output.put_line('Futbolista creado correctamente');
                return 1;
            else
                dbms_output.put_line('ID no válido');
                return -1;
            end if;
    end;
    
    FUNCTION actualizaFutbolista (
        vId futbolistas.id%TYPE,
        vNombre futbolistas.nombre%TYPE,
        vApellidos futbolistas.apellidos%TYPE,
        vFechaNacimiento futbolistas.fecha_nacimiento%TYPE,
        vPosicion futbolistas.posicion%TYPE,
        vSalario futbolistas.salario%TYPE,
        vIdEquipo futbolistas.id_equipo%TYPE,
        vAltura futbolistas.altura%TYPE,
        vPeso futbolistas.peso%TYPE
    ) RETURN INT
    IS
        existe futbolistas.id%TYPE;
    BEGIN
        SELECT id INTO existe FROM futbolistas WHERE id = vId;
        UPDATE futbolistas SET
            nombre = vNombre,
            apellidos = vApellidos,
            fecha_nacimiento = vFechaNacimiento,
            posicion = vPosicion,
            salario = vSalario,
            id_equipo = vIdEquipo,
            altura = vAltura,
            peso = vPeso
            WHERE id = existe;
        dbms_output.put_line('Futbolista editado correctamente');
        RETURN 1;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('NO EXISTE ESE ID');
            RETURN -1;        
    END;
    
    PROCEDURE borrarFutbolista(vId futbolistas.id%TYPE)
    IS 
        vExiste futbolistas.id%TYPE;
    BEGIN
        SELECT id INTO vExiste FROM futbolistas WHERE id = vId;
        DELETE FROM futbolistas WHERE id = vId;
        dbms_output.put_line('Futbolista borrado correctamente');
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('Futbolista no existe');
    END;
    
    PROCEDURE mostrarFutbolistasEquipo2(vNombre equipos.nombre%TYPE)
    IS
        CURSOR cConsulta IS SELECT f.nombre AS nombre, f.apellidos AS apellidos 
            FROM futbolistas f JOIN equipos e ON e.id = f.id_equipo 
            WHERE e.nombre = vNombre;
    BEGIN
        dbms_output.put_line('Futbolistas en ' || vNombre);
        FOR consulta IN cConsulta LOOP
            dbms_output.put_line(consulta.nombre ||' '|| consulta.apellidos);
        END LOOP;
    END;
    
    PROCEDURE mostrarFutbolistasEquipo(vNombre equipos.nombre%TYPE)
    IS
    
    BEGIN
        dbms_output.put_line('Juegadores en ' || vNombre);
        FOR consulta IN (SELECT f.nombre AS nombre, f.apellidos AS apellidos FROM
            futbolistas f JOIN equipos e ON e.id = f.id_equipo WHERE e.nombre = vNombre)
            LOOP            
                dbms_output.put_line(consulta.nombre ||' '|| consulta.apellidos);
            END LOOP;
    END;    
END;
/

/* 1.6. Crea un programa que realice lo siguiente:
1. Llamada a la función insertarFutbolista del paquete funcFutbolistas para 
   introducir un nuevo futbolista. Pásale los valores que quieras pero debe crear 
   un nuevo futbolista en la tabla (NO lo pidas por teclado, NO).
2. Cambia el nombre del futbolista PABLO por PABLO JESUS usando la función 
   actualizaFutbolista.
3. Borra al futbolista de ID F00320 usando borrarFutbolista.
4. Termina ejecutando el procedimiento mostrarFutbolistasEquipo para el EQUIPO B. */
DECLARE

BEGIN
    dbms_output.put_line(funcFutbolistas.insertarFutbolista('F00320', 'Juan Gabriel', 
        'Sánchez Vivero', '26/05/1983', 'DELANTERO', 55000, 2, 177, 72.5));
        
    dbms_output.put_line(funcFutbolistas.actualizaFutbolista('F00720', 'PABLO JESUS', 
        'CARO', '27/01/88', 'DEFENSA', 200000, 1, 183, 84));
        
    funcFutbolistas.borrarFutbolista('F00320');
    
    funcFutbolistas.mostrarFutbolistasEquipo('EQUIPO B');
    
    funcFutbolistas.mostrarFutbolistasEquipo2('EQUIPO C');    
END;
/

/* ### EJERCICIO 2

Se quiere crear un programa que muestre por la salida de la consola el nombre, 
apellidos y años que tienen los futbolistas que, A DÍA DE HOY YA HAYAN CUMPLIDO 
AÑOS, es decir, que en lo que va de año hasta HOY ya fue su cumpleaños. 
No muestres los futbolistas que no han cumplido años todavía. */




    