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

/* DECLARAR UNA CONSTANTE */
DECLARE
    variableConstante CONSTANT INT := 5;
BEGIN
    dbms_output.put_line(variableConstante);
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

/* ESTRUCTURA IF */
DECLARE
    variable1 INT := &NÚMERO;
BEGIN
    IF variable1 > 5 THEN
        dbms_output.put_line('Es mayor');
    ELSIF variable1 = 5 THEN
        dbms_output.put_line('Es igual');
    ELSIF variable1 < 5 THEN
        dbms_output.put_line('Es menor');
    ELSE
        dbms_output.put_line('Datos introducidos incorrectos');
    END IF;
END;
/

/* ESTRUCTURA CASE */
DECLARE
    variable1 INT := &NUMERO;
    varConstante CONSTANT INT := 5;
BEGIN
    CASE
    WHEN variable1 > varConstante THEN
        dbms_output.put_line('Es mayor');
    WHEN variable1 < varConstante THEN
        dbms_output.put_line('Es menor');
    WHEN variable1 = varConstante THEN 
        dbms_output.put_line('Es igual');
    ELSE
        dbms_output.put_line('Datos introducidos erroneos');
    END CASE;
END;
/

--BUCLES

/* ESTRUCTURA LOOP */
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
-- EXIT WHEN
DECLARE
    i INT := 0;
BEGIN
    LOOP
        dbms_output.put_line(i);
        i := i + 1;
        EXIT WHEN i > 10;
    END LOOP;
END;
/

/* ESTRUCTURA FOR */
DECLARE
    
BEGIN
    FOR indice IN 0..10 
 -- FOR indice IN REVERSE 0..10
        LOOP
            dbms_output.put_line(indice);
        END LOOP;        
END;
/

/* ESTRUCTURA WHILE */
DECLARE
    variableContador INT := 0;
BEGIN
    WHILE variableContador <= 10
        LOOP
            dbms_output.put_line(variableContador);
            variableContador := variableContador + 1;
        END LOOP;
END;
/

-- REGISTROS

/* ESTRUCTURA DE UN REGISTRO */
DECLARE
    TYPE nombreRegistro IS RECORD (
        dato1 NUMBER(38) := 83,
        dato2 VARCHAR2(50),
        dato3 INTEGER(38)
    );    
    persona1 nombreRegistro;
BEGIN
    persona1.dato2 := 'nombre';
    persona1.dato3 := 41;
    dbms_output.put_line(persona1.dato1);
    dbms_output.put_line(persona1.dato2);
    dbms_output.put_line(persona1.dato3);
END; 
/

-- TABLAS

DECLARE
    TYPE nombreTabla IS TABLE OF INT INDEX BY BINARY_INTEGER;   
    tabla1 nombreTabla;
BEGIN
    tabla1(2) := 5;
    dbms_output.put_line(tabla1(2));
END;
/

-- EXCEPCIONES.

/* ESTRUCTURA PARA CONTROLAR UNA EXCEPCIÓN */
DECLARE

BEGIN
    dbms_output.put_line(' ');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(' ');
END;
/

/* ESTRUCTURA PARA DECLARAR UNA EXCEPCIÓN */

DECLARE
    miExcepcion EXCEPTION;
BEGIN
    RAISE miExcepcion;
EXCEPTION
    WHEN miExcepcion THEN
        dbms_output.put_line('conseguido');
END;
/

/* ESTRUCTURA PARA DECLARAR UN PAQUETE */

CREATE OR REPLACE PACKAGE miPaquete
IS
    PROCEDURE is_today;
    PROCEDURE nombreProcedure(valor1 INT, valor2 INT);
END;
/
CREATE OR REPLACE PACKAGE BODY miPaquete
IS
    PROCEDURE nombreProcedure(
END;
/





