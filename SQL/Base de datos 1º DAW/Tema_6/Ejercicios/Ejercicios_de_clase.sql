SET SERVEROUTPUT ON;
GRANT CREATE PROCEDURE TO jgsanchez;
BEGIN dbms_output.put_line('Test');
END;
/

DECLARE num int:= 7;
BEGIN dbms_output.put_line(num);
END;
/

DECLARE 
    num INT;
BEGIN 
    num := 8;
    dbms_output.put_line('El valor guardado en num es: ' || num);
END;
/

DECLARE
    num1 INT := 5;
    num2 INT := 2;
BEGIN
    dbms_output.put_line('Suma de ' || num1 ||' y '|| num2 || ' = ' || (num1 + num2));
END;
/

DECLARE
    num1 INT;
    cadena VARCHAR2(2) := '&cadena';
BEGIN
    num1 := &num1;
END;
/

CREATE OR REPLACE PROCEDURE today2_is(fecha DATE)
    IS
    BEGIN
        dbms_output.put_line('Hoy es ' || TO_CHAR(fecha, 'DD/MM/YYYY'));
    END;
    /
    
/* Crear el procedimiento today3_is que, primero, tenga una variable local llamada anterior que sea DATE y que
valga un d�a menos que el par�metro de fecha pasado. Mostrar por la consola la varibale llamada anterior.
Luego modifica tu bloque de c�digo an�nimo para llamar a ese today3_is con el d�a de tu cumplea�os. */

CREATE OR REPLACE PROCEDURE today3_is(fecha DATE)
    IS
        anterior DATE := fecha - 1;
    BEGIN
        dbms_output.put_line(anterior);
        dbms_output.put_line('Hoy es ' || TO_CHAR(fecha, 'DD/MM/YYYY'));
    END;
    /

BEGIN
    today3_is('04/01/2021');
    today3_is('26/05/1983');
END;
/

/* Cambia el today3_is porque quiero ver solo el a�o.*/

CREATE OR REPLACE PROCEDURE today3_is(fecha DATE)
    IS
        anterior DATE := fecha - 1;
    BEGIN
        dbms_output.put_line(TO_CHAR(anterior, 'YYYY'));        
    END;
    /

BEGIN
    today2_is('04/01/2021');
    today3_is('26/05/1983');
END;
/

/* Quiero obtener el a�o de la fecha pasada a today2_is SIN tocar el procedimiento COMO NO PUEDO, usaremos function */

CREATE OR REPLACE FUNCTION today2_fun(fecha DATE) RETURN DATE
    IS
    BEGIN
        RETURN fecha;
    END;
/

BEGIN
    dbms_output.put_line(TO_CHAR(today2_fun('04/01/2021'), 'YYYY'));
    --today3_is('26/05/1983');
END;
/

DECLARE
    pi CONSTANT NUMBER := 3.141592;
BEGIN
    dbms_output.put_line(pi);
END;
/

DECLARE
    mivariable int;
    mivariable2 ingredientes_platos.cantidad%type;
    mifila platos%rowtype;
BEGIN
    mivariable := 25;
    mivariable2 := 9;
    mifila.nombre := 'hola';
    mifila.numero := 9;
    dbms_output.put_line(mivariable);
    dbms_output.put_line(mivariable2);
END;


DECLARE
    num3 CONSTANT NUMBER := 11;
    fecha DATE;
    fecha2 DATE := '01/04/2024';
    num1 NUMBER(3);
    num2 NUMBER(4, 2) := 10.99;
    cadena VARCHAR2(15) := 'CLASE DE DAMDAW';
BEGIN
    dbms_output.put_line('');
END;
/

DECLARE
    num3 CONSTANT NUMBER := 11;
    fecha DATE;
    fecha2 DATE := '01/04/2024';
    num1 NUMBER(3);
    num2 NUMBER(4, 2) := 10.99;
    cadena VARCHAR2(15) := 'CLASE DE DAMDAW';
BEGIN
    dbms_output.put_line('');
END;
/

DECLARE
    variable1 emp.ename%TYPE;
    variable2 emp%ROWTYPE;
    
BEGIN
    --PRIMER CASO
    SELECT ename INTO variable1 FROM emp WHERE empno = 7839;
    dbms_output.put_line(variable1);
    --SEGUNDO CASO
    SELECT * INTO variable2 FROM emp WHERE empno = 7698;
    dbms_output.put_line(variable2.ename);
END;
/

DECLARE    
    
BEGIN    
    dbms_output.put_line('');
    
END;
/

CREATE OR REPLACE FUNCTION calcularAreaTriangulo(base INT, altura INT) RETURN NUMBER
IS
    total NUMBER := 0;
BEGIN
    total := (base * altura) / 2;
    RETURN total;
END;
/

DECLARE  
    base INT := &base;
    altura INT := &altura;
    total NUMBER := 0;
BEGIN
    total := base * altura / 2;
    dbms_output.put_line('El �rea es ' || total);
    dbms_output.put_line('El �rea es ' || base * altura / 2);
    dbms_output.put_line('El �rea es ' || calcularAreaTriangulo(base, altura));
    
END;
/

DECLARE
    num1 INT := 8;
    num2 INT := 4;    
BEGIN    
    /*dbms_output.put_line(num1 + num2);
    dbms_output.put_line(num1 * num2);
    dbms_output.put_line(num1 / num2);
    dbms_output.put_line(num1 - num2); */   
    ejercicio7(num1, num2);
END;
/

create or replace procedure ejercicio7(numero1 int, numero2 int)
is
begin
    dbms_output.put_line(numero1 + numero2);
    dbms_output.put_line(numero1 * numero2);
    dbms_output.put_line(numero1 / numero2);
    dbms_output.put_line(numero1 - numero2); 
end;
/

/*
EJERCICIO 1
1. Declara una variable tipo fecha sin inicializarla.
2. Declara una variable tipo fecha inicializada a d�a 6 de abril de 2021.
3. Declara una variable num�rica (NUMBER) con 3 d�gitos que no sea null sin inicializar.
4. Declara una variable num�rica (NUMBER) con 4 d�gitos de precisi�n de los cuales 2 son decimales e inicial�zala a 10,99.
5. Declara una variable car�cter (VARCHAR2) de tama�o 10 con la frase CLASE DE DAMDAW.
6. Declara una constante num�rica y valor 11.
*/

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
    dbms_output.put_line(num3 || ' - ' || fecha1 || ' - ' || fecha2 || ' - ' || num1 || ' - ' || num2 || ' - ' || cadena);
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

/* EJERCICIO 8
Crea un programa que realiza la suma de dos n�meros enteros, num1 y num2, si num1 es
mayor que num2. En caso contrario que no haga nada.
Asigna por ejemplo los valores 7 y 3 a los n�meros.
*/
DECLARE
    num1 INT := 7;
    num2 INT := 3;
    suma INT;
BEGIN
    IF num1 > num2 THEN
        suma := num1 + num2;
        dbms_output.put_line(suma);    
    END IF;    
END;
/

/*
EJERCICIO 9 modificado
Crea una funci�n llamada restarNumEnteros que reciba dos par�metros, num1 y num2, y si num1 es mayor que num2, devuelva
la resta de ambos n�meros. En caso contrario, muestra por pantalla "Num1 es menor o igual que num2" y devuelva -1.
Llama a dicha funci�n desde un bloque de c�digo an�nimo con los valores 7 y 3, en primer lugar, y 4 y 8 en segundo lugar.
*/
CREATE OR REPLACE FUNCTION restarNumEnteros(num1 INT, num2 INT) RETURN INT
IS
    resta INT;
BEGIN
    IF num1 > num2 THEN
        resta := num1 - num2;
        RETURN resta;
    ELSE 
        RETURN -1;
    END IF;
END;
/

DECLARE
BEGIN
    dbms_output.put_line(restarNumEnteros(7, 3));
    dbms_output.put_line(restarNumEnteros(4, 8));
END;
/

/* 
EJERCICIO 10
Crea un programa que tome pida una variable al usuario para que la introduzca por teclado (tiene
que ser un n�mero), y seg�n sea su valor entre 0 y 10, devuelva por pantalla el valor de la nota:
SUSPENSO, APROBADO, BIEN, NOTABLE, SOBRESALIENTE. En caso contrario, que devuelva �El valor introducido es incorrecto�.
*/
DECLARE
    nota NUMBER(3,1) := &nota;
BEGIN
    IF nota < 5 AND nota >= 0 THEN
        dbms_output.put_line('SUSPENSO');
    ELSIF nota >=5 AND nota < 6 THEN
        dbms_output.put_line('APROBADO');
    ELSIF nota >=6 AND nota < 7 THEN
        dbms_output.put_line('BIEN');
    ELSIF nota >=7 AND nota < 9 THEN
        dbms_output.put_line('NOTABLE');
    ELSIF nota >=9 AND nota <= 10 THEN
        dbms_output.put_line('SOBRESALIENTE');
    ELSE
        dbms_output.put_line('El valor introducido es incorrecto');
    END IF;
END;
/

/*
EJERCICIO 11
Realiza el mismo ejercicio 11 pero utilizando CASE en lugar de IF | ELSIF | END IF.
*/
DECLARE
    nota NUMBER(3,1) := &nota;
BEGIN
    CASE
    WHEN nota < 5 AND nota >= 0 THEN
        dbms_output.put_line('SUSPENSO');
    WHEN nota >=5 AND nota < 6 THEN
        dbms_output.put_line('APROBADO');
    WHEN nota >=6 AND nota < 7 THEN
        dbms_output.put_line('BIEN');
    WHEN nota >=7 AND nota < 9 THEN
        dbms_output.put_line('NOTABLE');
    WHEN nota >=9 AND nota <= 10 THEN
        dbms_output.put_line('SOBRESALIENTE');
    ELSE
        dbms_output.put_line('El valor introducido es incorrecto');
    END CASE;
END;
/

/*
EJERCICIO 12
Realiza un programa que lea por teclado dos n�meros enteros. El primero ser� los goles del
equipo de casa, y el segundo los goles del equipo de fuera.
Se quiere devolver por pantalla qui�n ha ganado �El equipo de casa/visitante ha ganado�. 
En casode empate se indicar� �El resultado del partido hasido de empate�.
*/