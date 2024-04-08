/* DAR PERMISOS PARA COMPILAR FUNCIONES Y PROCEDURE */
GRANT CREATE PROCEDURE TO nombreDeUsuario;

/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

/* ESTRUCTURA B�SICA BLOQUE C�DIGO AN�NIMO */
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

/* ESTRUCTURA DE UNA FUNCI�N */
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

/* EJERCICIO 1
1. Declara una variable tipo fecha sin inicializarla.
2. Declara una variable tipo fecha inicializada a d�a 6 de abril de 2021.
3. Declara una variable num�rica (NUMBER) con 3 d�gitos que no sea null sin inicializar.
4. Declara una variable num�rica (NUMBER) con 4 d�gitos de precisi�n de los cuales 2 son decimales e inicial�zala a 10,99.
5. Declara una variable car�cter (VARCHAR2) de tama�o 10 con la frase CLASE DE DAMDAW.
6. Declara una constante num�rica y valor 11. */

DECLARE
    -- 6. Declara una constante num�rica y valor 11.
    num3 CONSTANT NUMBER(38) := 11;
    -- 1. Declara una variable tipo fecha sin inicializarla.
    fecha1 DATE;
    -- 2. Declara una variable tipo fecha inicializada a d�a 6 de abril de 2021.
    fecha2 DATE := '06/04/2021';
    -- 3. Declara una variable num�rica (NUMBER) con 3 d�gitos que no sea null sin inicializar.
    num1 NUMBER(3);
    -- 4. Declara una variable num�rica (NUMBER) con 4 d�gitos de precisi�n de los cuales 2 son decimales e inicial�zala a 10,99.
    num2 NUMBER(4, 2) := 10.99;
    -- 5. Declara una variable car�cter (VARCHAR2) de tama�o 10 con la frase CLASE DE DAMDAW.
    cadena VARCHAR(15) := 'CLASE DE DAMDAW';    
BEGIN
    dbms_output.put_line(num3 || ' ' || fecha1 || ' ' || fecha2 || ' ' || num1 || ' ' || num2 || ' ' || cadena);
END;
/

/*
EJERCICIO 2
1. Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
2. Declara una variable que haga referencia a toda una fila de la tabla EMP.
*/
DECLARE
    -- 1. Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
    variable1 emp.ename%TYPE;
    -- 2. Declara una variable que haga referencia a toda una fila de la tabla EMP.
    variable2 emp%ROWTYPE;
    
BEGIN
    dbms_output.put_line(' ');
END;
/

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

