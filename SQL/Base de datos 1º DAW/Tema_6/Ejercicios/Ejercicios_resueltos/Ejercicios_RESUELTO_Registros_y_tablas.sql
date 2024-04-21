/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

/* BORRADO DE TABLAS */
/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END; */

/* EJERCICIO 1
Declarar un tipo registro Tpersona con los siguientes campos: un código de tipo
numérico, un nombre de tipo cadena de 100 caracteres y la edad integer.
Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla. */
DECLARE
    TYPE tPersona IS RECORD (
        codigo NUMBER(38),
        nombre VARCHAR2(100),
        edad INTEGER(38)
    );
    persona1 tPersona;
BEGIN   
    persona1.codigo := 1983;
    persona1.nombre := 'Juan Gabriel';
    persona1.edad := 41;
    
    dbms_output.put_line(persona1.codigo || ' ' || persona1.nombre || ' ' ||
    persona1.edad);  
END;
/

/* EJERCICIO 2
2.1. Crea un registro tpersona igual que el del ejemplo de teoría. Después, crea
otro registro alumno que tenga como campos nombre varchar 100, y profesor
tpersona.
2.2. Crea una variable alumno1 del tipo alumno, dale valores a todos sus campos
y muéstralos por la salida.
2.3. Crea una variable alumno2 del tipo alumno, dale valores solo a nombre y
código de profesor, y saca los datos por la salida. */
DECLARE
    TYPE tPersona IS RECORD (
        codigo NUMBER(38),
        nombre VARCHAR2(100),
        edad INTEGER(38)
    );
    TYPE tAlumno IS RECORD (
        nombre VARCHAR2(38),
        profesor Tpersona
    );
    alumno1 tAlumno;
    alumno2 tAlumno;
BEGIN
    alumno1.nombre := 'Federico';
    alumno1.profesor.codigo := 40;
    alumno1.profesor.nombre := 'Girafales';
    alumno1.profesor.edad := 64;
    
    alumno2.profesor.nombre := 'Antonio';
    alumno2.profesor.codigo := 78;
    
    dbms_output.put_line(alumno1.nombre);
    dbms_output.put_line(alumno1.profesor.codigo);
    dbms_output.put_line(alumno1.profesor.nombre);
    dbms_output.put_line(alumno1.profesor.edad);    
    
    dbms_output.put_line(alumno2.nombre);
    dbms_output.put_line(alumno2.profesor.codigo);
    dbms_output.put_line(alumno2.profesor.nombre);
    dbms_output.put_line(alumno2.profesor.edad);    
END;
/

/* EJERCICIO 3
Crea un registro tipodept con la misma estructura que la tabla dept (y mismos
tipos de datos).
A continuación, crea una variable fila del tipo tipodept. 
Se quiere guardar en fila todos los datos del departamento cuyo dptno es 10.
Muestra por la salida el valor de cada campo guardado en fila. */
DECLARE
    TYPE tipoDept IS RECORD (
        deptno dept.deptno%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    fila tipoDept;
BEGIN
    SELECT * INTO fila FROM dept WHERE deptno = 10;
    dbms_output.put_line(fila.deptno);
    dbms_output.put_line(fila.dname);
    dbms_output.put_line(fila.loc);
END;
/

/* EJERCICIO 4
Empleando el registro tipdept anterior, se quieren guardar solo los datos deptno
y dname de la tabla dept para el caso del departamento cuyo id es 20.
Para ello crea una variable fila2 del tipo tipodept, guarda esos datos y 
muéstralo por la salida. */
DECLARE
    TYPE tipoDept IS RECORD (
        deptno dept.deptno%TYPE,
        dname dept.dname%TYPE,
        loc dept.loc%TYPE
    );
    fila tipoDept;
    fila2 tipoDept;
BEGIN
    SELECT * INTO fila FROM dept WHERE deptno = 10;
    dbms_output.put_line(fila.deptno);
    dbms_output.put_line(fila.dname);
    dbms_output.put_line(fila.loc);
    
    SELECT deptno, dname INTO fila2.deptno, fila2.dname FROM dept 
        WHERE deptno = 20;
    dbms_output.put_line(fila2.deptno);
    dbms_output.put_line(fila2.dname);
    dbms_output.put_line(fila2.loc);    
END;
/