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

/* EJERCICIO 5
Se quieren guardar todos los datos del departamento cuyo deptno es 30 en una
variable del tipo %rowtype llamada filacompleta. 
Muestrapor la salida el valor de los distintos campos de filacompleta. */
DECLARE
    filaCompleta dept%ROWTYPE;
BEGIN
    SELECT * INTO filaCompleta FROM dept WHERE deptno = 30;
    dbms_output.put_line(filaCompleta.deptno);
    dbms_output.put_line(filaCompleta.dname);
    dbms_output.put_line(filaCompleta.loc);
END;
/

/* EJERCICIO 6
Se quieren guardar los datos deptno y loc del departamento cuyo deptno es 40 en
una variable del tipo %rowtype llamada filacompleta2. 
Muestra por la salida el valor de los dos campos de filacompleta2. */
DECLARE
    filaCompleta2 dept%ROWTYPE;
BEGIN
    SELECT deptno, loc INTO filaCompleta2.deptno, filaCompleta2.loc FROM dept
        WHERE deptno = 40;
    dbms_output.put_line(filaCompleta2.deptno);
    dbms_output.put_line(filaCompleta2.loc);
END;
/

/* EJERCICIO 7
Declarar una tabla de números y asignarle con un bucle for los números del 1 al
10. Además de asignar el valor dentro del bucle, mostrar el valor de la tabla
por pantalla en cada iteración. */
DECLARE
    TYPE tablaNumeros IS TABLE OF int INDEX BY BINARY_INTEGER;
    tabla1 tablaNumeros;
BEGIN
    FOR i IN 1..10
        LOOP
            tabla1(i) := i;
            dbms_output.put_line(tabla1(i));
        END LOOP;    
END; 
/

/* EJERCICIO 8
Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que
almacena nombre, apellido1 y apellido2. 
Asignarle valores para una persona e imprimirlos por pantalla. */
DECLARE
    TYPE personas IS RECORD (
        nombre VARCHAR2(99),
        apellido1 VARCHAR2(99),
        apellido2 VARCHAR2(99)
    );
    TYPE tablaPersonas IS TABLE OF personas INDEX BY BINARY_INTEGER;
    listaPersonas1 tablaPersonas;
BEGIN
    listaPersonas1(1).nombre := 'Perico';
    listaPersonas1(1).apellido1 := 'de los';
    listaPersonas1(1).apellido2 := 'Palotes';
    listaPersonas1(2).nombre := 'Manolito';
    
    dbms_output.put_line(listaPersonas1(1).nombre);
    dbms_output.put_line(listaPersonas1(1).apellido1);
    dbms_output.put_line(listaPersonas1(1).apellido2);
    dbms_output.put_line(listaPersonas1(2).nombre);
END;
/

/* EJERCICIO 9
Sobre el ejercicio 7:
1. Utilizar la función COUNT para devolver el número de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el último de la tabla y devolver el número total de elementos.
4. Preguntar si existe valor en la posición 10. */
DECLARE
    TYPE tablaNumeros IS TABLE OF int INDEX BY BINARY_INTEGER;
    tabla1 tablaNumeros;
BEGIN
    FOR i IN 1..10
        LOOP
            tabla1(i) := i;
            dbms_output.put_line(tabla1(i));                        
        END LOOP;
        
    dbms_output.put_line('COUNT: ' || tabla1.COUNT);
    dbms_output.put_line('FIRST: ' || tabla1.FIRST);
    dbms_output.put_line('LAST: ' || tabla1.LAST);
    tabla1.DELETE(tabla1.LAST);
    dbms_output.put_line(tabla1.COUNT);
    
    IF tabla1.EXISTS(10) THEN
        dbms_output.put_line('Existe');
    ELSE
        dbms_output.put_line('No existe');
    END IF;
    
END; 
/

/* EJERCICIO 10
Se quiere mostrar por pantalla los datos de ciertos empleados (tabla emp).
Se pide:
1. Se pedirá al usuario por la entrada de plsql que introduzca dos valores
integer que coincidan con dos empnos de la tabla emp, y se guardarán en una
tabla de integers.
2. Se debe crear una tabla que contendrá como valores todos los campos de las
filas de emp cuyo empno coincida con los de la tabla anterior. 
Puedes usar registros o %rowtype.
3. Recorre la tabla anterior mostrando por la salida los valores de cada columna
de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los índices de tus
bucles.
Usa por ejemplo empno 7839 y 7698. */
DECLARE
    entradaUsuario1 INTEGER(38) := &Numero1;
    entradaUsuario2 INTEGER(38) := &Numero2;
    TYPE tablaEntradaUsuario IS TABLE OF emp.empno%TYPE INDEX BY BINARY_INTEGER;
    TYPE tablaEmp IS TABLE OF emp%ROWTYPE INDEX BY BINARY_INTEGER;
    t1EntradaUsuario tablaEntradaUsuario;
    t1Emp tablaEmp;
BEGIN
    t1EntradaUsuario(1) := entradaUsuario1;
    t1EntradaUsuario(2) := entradaUsuario2;
    
    FOR i IN t1EntradaUsuario.FIRST..t1EntradaUsuario.LAST
        LOOP
            SELECT * INTO t1Emp(i) FROM emp 
                WHERE emp.empno = t1EntradaUsuario(i);
        END LOOP;
    dbms_output.put_line('');
END;
/


