/* DAR PERMISOS PARA COMPILAR FUNCIONES Y PROCEDURE */
GRANT CREATE PROCEDURE TO nombreDeUsuario;

/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

/* ESTRUCTURA BÁSICA BLOQUE CÓDIGO ANÓNIMO */
DECLARE

BEGIN
    dbms_output.put_line('');
END;
/

/* ESTRUCTURA DE UN PROCEDIMIENTO */
CREATE OR REPLACE PROCEDURE nombreDeLaProcedure(fecha DATE)
IS
    variables DATE := fecha - 1;
    variables2 INT;    
BEGIN
    variables2 := 8;
    dbms_output.put_line('');        
END;
/

/* ESTRUCTURA DE UNA FUNCIÓN */
CREATE OR REPLACE FUNCTION nombreDeLaFuncion(base INT, altura INT) RETURN NUMBER
IS
    total NUMBER := 0;
BEGIN
    total := (base * altura) / 2;
    RETURN total;
END;
/

/* BORRAR UN PROCEDURE Y FUNCTION */
DROP PROCEDURE nombreDeLaProcedure;
DROP FUNCTION nombreDeLaFuncion;

//BUCLES

DECLARE
    i INT := 0;
BEGIN
    LOOP
        IF i < 10 THEN
            dbms_output.put_line(i);
        ELSIF i = 10 THEN
            EXIT;
        END IF;
        i := i + 1;
    END LOOP;
END;
/

/* EJERCICIO 6
Se quieren guardar los datos deptno y loc del departamento cuyo deptno es 40 en una variable
del tipo %rowtype llamada filacompleta2. Muestrapor la salida el valor de los dos campos de
filacompleta2. */

DECLARE 
    filacompleta2 dept%ROWTYPE;
BEGIN
    SELECT deptno, loc INTO filacompleta2.deptno, filacompleta2.loc FROM dept WHERE deptno = 40;
    dbms_output.put_line(filacompleta2.deptno);
    dbms_output.put_line(filacompleta2.dname);
    dbms_output.put_line(filacompleta2.loc);
    SELECT * INTO filacompleta2 FROM dept WHERE deptno = 40;
    dbms_output.put_line(filacompleta2.deptno);
    dbms_output.put_line(filacompleta2.dname);
    dbms_output.put_line(filacompleta2.loc);
END;
/

// TABLAS

DECLARE
    TYPE nombreTabla IS TABLE OF INT INDEX BY BINARY_INTEGER;   
    tabla1 nombreTabla;
BEGIN
    tabla1(2) := 5;
    dbms_output.put_line(tabla1(2));
END;
/

/* EJERCICIO 7
Declarar una tabla de números y asignarle con un bucle for los números del 1 al 10. Además de
asignar el valor dentro del bucle, mostrar el valor de la tabla por pantalla en cada iteración. */

DECLARE
    TYPE tipoTablaNum IS TABLE OF INT INDEX BY BINARY_INTEGER;
    valTablaNum tipoTablaNum;    
BEGIN
    FOR i IN 1..10 LOOP
        valTablaNum(i) := i;
        dbms_output.put_line(valTablaNum(i));
    END LOOP;
END;
/

/* EJERCICIO 8
1. Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que almacena nombre, apellido1 y apellido2. 
2. Asignarle valores para una persona e imprimirlos por pantalla. */

DECLARE
    TYPE persona IS RECORD (
        nombre VARCHAR2(99),
        apellido1 VARCHAR2(99),
        apellido2 VARCHAR2(99)
    );
    TYPE tabla1 IS TABLE OF persona INDEX BY BINARY_INTEGER;
    listaPersonas tabla1;
BEGIN
    listaPersonas(1).nombre := 'Federico';
    listaPersonas(1).apellido1 := 'Flores';
    listaPersonas(1).apellido2 := 'López';    
    dbms_output.put_line(listaPersonas(1).nombre);
    listaPersonas(2).nombre := 'Laura';
    listaPersonas(2).apellido1 := 'Carmona';
    listaPersonas(2).apellido2 := 'Waju';    
    dbms_output.put_line(listaPersonas(2).nombre);
END;
/

/*
Ejercicio 9
Sobre el ejercicio 7:
1. Utilizar la función COUNT para devolver el número de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el último de la tabla y devolver el número total de elementos.
4. Preguntar si existe valor en la posición 10.
*/

declare
    type tipoTablaNum is table of int index by binary_integer;
    valTablaNum tipoTablaNum;
begin
    for i in 1..10 loop
        valTablaNum(i):=i;
        dbms_output.put_line(valTablaNum(i));
    end loop;
    --1
    dbms_output.put_line(valTablaNum.count);
    --2
    for j in valTablaNum.first..valTablaNum.last loop
        dbms_output.put_line(valTablaNum(j));
    end loop;
    --3
    valTablaNum.delete(valTablaNum.last);
    dbms_output.put_line(valTablaNum.count);
    --4
    if not(valTablaNum.exists(10)) then
        dbms_output.put_line('No existe la posición 10');
    else
        dbms_output.put_line('Existe la posición 10');
    end if;
end;
/

/* EJERCICIO 10
   Se quiere mostrar por pantalla los datos de ciertos empleados (tablaemp). Se pide:
1. Se pedirá al usuario por la entrada de plsql que introduzca dos valores integer que coincidan con dos empnos de la tabla emp,
   y se guardarán en una tabla de integers.
2. Se debe crear una tabla que contendrá como valores todos los campos de las filas de emp cuyo empno coincida con los de la
   tabla anterior. Puedes usar registros o %rowtype.
3. Recorre la tabla anterior mostrando por la salida los valores de cada columna de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los índices de tus bucles usa por ejemplo empno 7839 y 7698. */

DECLARE
     valor1 emp.empno%TYPE := &empno1;
     valor2 emp.empno%TYPE := &empno2;
     TYPE tTabla1 IS TABLE OF emp.empno%TYPE INDEX BY BINARY_INTEGER;
     tabla1 tTabla1;
     TYPE tTabla2 IS TABLE OF emp%ROWTYPE INDEX BY BINARY_INTEGER;
     tabla2 tTabla2;
BEGIN
    tabla1(1) := valor1;
    tabla1(2) := valor2;
    FOR i IN tabla1.first..tabla1.last LOOP
        SELECT * INTO tabla2(i) FROM emp WHERE empno = tabla1(i);
    END LOOP;
END;
/

/* SOLUCIÓN PROFESOR */

declare
    valor1 emp.empno%type := &empno1;
    valor2 emp.empno%type := &empno2;
    type tTabla1 is table of emp.empno%type index by binary_integer;
    tabla1 tTabla1;
    type tTabla2 is table of emp%rowtype index by binary_integer;
    tabla2 tTabla2;
begin
    tabla1(1) := valor1;
    tabla1(2) := valor2;
    for i in tabla1.first..tabla1.last loop
        select * into tabla2(i) from emp where empno = tabla1(i);
    end loop;
    for j in tabla2.first..tabla2.last loop
        dbms_output.put_line(tabla2(j).empno);
        dbms_output.put_line(tabla2(j).ename);
        dbms_output.put_line(tabla2(j).job);
        dbms_output.put_line(tabla2(j).mgr);
        dbms_output.put_line(tabla2(j).hiredate);
        dbms_output.put_line(tabla2(j).sal);
        dbms_output.put_line(tabla2(j).comm);
        dbms_output.put_line(tabla2(j).deptno);
    end loop;
end;
/



