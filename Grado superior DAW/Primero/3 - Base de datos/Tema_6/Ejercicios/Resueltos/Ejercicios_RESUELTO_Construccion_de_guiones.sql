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
1. Declara una variable tipo fecha sin inicializarla.
2. Declara una variable tipo fecha inicializada a d�a 6 de abril de 2021.
3. Declara una variable num�rica (NUMBER) con 3 d�gitos que no sea null sin 
   inicializar.
4. Declara una variable num�rica (NUMBER) con 4 d�gitos de precisi�n de los 
   cuales 2 son decimales e inicial�zala a 10,99.
5. Declara una variable car�cter (VARCHAR2) de tama�o 10 con la frase CLASE DE 
   DAMDAW.
6. Declara una constante num�rica y valor 11. */
DECLARE
    -- 1. Declara una variable tipo fecha sin inicializarla.
    fecha1 DATE;
    -- 2. Declara una variable tipo fecha inicializada a d�a 6 de abril de 2021
    fecha2 DATE := '06/04/2021';
    -- 3. Declara una variable num�rica (NUMBER) con 3 d�gitos que no sea null
    --sin inicializar.
    num1 NUMBER(3) := 199; --No se puede, hay que inicializarla o declararla.
    -- 4. Declara una variable num�rica (NUMBER) con 4 d�gitos de precisi�n de
    --los cuales 2 son decimales e inicial�zala a 10,99.
    num2 NUMBER(4, 2) := 10.99;
    -- 5. Declara una variable car�cter (VARCHAR2) de tama�o 10 con la frase 
    --CLASE DE DAMDAW.
    frase VARCHAR2(15) := 'CLASE DE DAMDAW';
    -- 6. Declara una constante num�rica y valor 11.
    num3 CONSTANT NUMBER(11) := 5;
BEGIN
    dbms_output.put_line(fecha1 || ' ' || fecha2 || num1 || ' ' || num2 || ' ' 
    || num2 || ' ' || frase || ' ' || num3);
END;
/

/* EJERCICIO 2
1. Declara una variable que tenga el tipo de dato igual que el de la columna
ENAME de la tabla EMP. 
2. Declara una variable que haga referencia a toda una fila de la tabla EMP. */
DECLARE
    -- 1. Declara una variable que tenga el tipo de dato igual que el de la 
    --columna ENAME de la tabla EMP.
    variable1 emp.ename%type := 'hola';
    -- 2. Declara una variable que haga referencia a toda una fila de la tabla
    --EMP.
    variable2 emp%rowtype;
BEGIN
    dbms_output.put_line(variable1);
END;
/

/* EJERCICIO 3
Utilizando las dos variables declaradas en el ejercicio 2, as�gnales los valores
siguientes:
    1. Primer caso: el valor del campo ENAME cuando EMPNO vale 7839.
    2. Segundo caso: la fila completa cuando EMPNO vale 7698. */
DECLARE
   
    variable1 emp.ename%type;
    variable2 emp%rowtype;
BEGIN
     -- 1. Primer caso: el valor del campo ENAME cuando EMPNO vale 7839.
    SELECT ename INTO variable1 FROM emp WHERE empno = 7839; 
    dbms_output.put_line(variable1);
    -- 2. Segundo caso: la fila completa cuando EMPNO vale 7698.
    SELECT * INTO variable2 FROM emp WHERE empno = 7839;
    dbms_output.put_line(variable2.empno ||' '|| variable2.ename ||' '|| 
        variable2.job ||' '|| variable2.mgr ||' '|| variable2.hiredate ||' '||
        variable2.sal ||' '|| variable2.comm ||' '|| variable2.deptno);
END;
/

/* EJERCICIO 5
Crea un bloque de c�digo an�nimo que pida la base y altura de un tri�ngulo,
y devuelva el �rea de este. */
DECLARE
    base NUMBER(38, 2) := &Base;
    altura NUMBER(38, 2) := &Altura;
    formula NUMBER(38, 2) := (base * altura) / 2;
BEGIN 
    dbms_output.put_line(formula);
END;
/

/* EJERCICIO 6
Crea un bloque de c�digo an�nimo que requiera por pantalla un nombre,
luego un apellido y muestre como resultado �Hola nombre apellido�. */
DECLARE
    nombre1 VARCHAR2(32767) := '&NOMBRE';
    apellido1 VARCHAR(32767) := '&APELLIDO';
BEGIN
    dbms_output.put_line('Hola ' || nombre1 || ' ' || apellido1);
END;
/

/* EJERCICIO 7 Crea un programa que realiza la suma, resta, multiplicaci�n y
divisi�n de dos n�meros enteros, num1 y num2 (8 y 4). */
DECLARE
    num1 NUMBER(38, 2) := 8;
    num2 NUMBER(38, 2) := 4;
    suma NUMBER(38, 2) := num1 + num2;
    resta NUMBER(38, 2) := num1 - num2;
    multiplicacion NUMBER(38,2) := (num1 * num2);
    division NUMBER(38,2) := (num1 / num2);
BEGIN
    dbms_output.put_line('SUMA: '||suma);
    dbms_output.put_line('RESTA: '||resta);
    dbms_output.put_line('MULTIPLICACI�N: '||multiplicacion);
    dbms_output.put_line('DIVISI�N: '||division);
END;
/

/* EJERCICIO 8 y 9
Crea un programa que realiza la resta de dos n�meros enteros, num1 y num2,
si num1 es mayor que num2. En caso contrario, que muestre por pantalla
�num1 es menor que num2�, sustituyendo num1 y num2 por sus valores.
Asigna por ejemplo los valores 7 y 3 a los n�meros. */
DECLARE
    num1 INT := 3; -- Cambiar n�meros para ver que funciona.
    num2 INT := 7; -- Cambiar n�meros para ver que funciona.
    suma INT;
BEGIN
    IF num1 > num2 THEN
        suma := num1 + num2;
        dbms_output.put_line(suma);
    ELSE
        dbms_output.put_line(num1 ||' es menor que ' || num2);
    END IF;
END;
/

/* EJERCICIO 10
Crea un programa que tome pida una variable al usuario para que la introduzca
por teclado (tiene que ser un n�mero), y seg�n sea su valor entre 0 y 10,
devuelva por pantalla el valor de la nota:
SUSPENSO, APROBADO, BIEN, NOTABLE, SOBRESALIENTE.
En caso contrario, que devuelva �El valor introducido es incorrecto�. */
DECLARE
    nota NUMBER(38, 2) := &nota;
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

/* EJERCICIO 11
Realiza el mismo ejercicio 10 pero utilizando CASE en lugar de
IF | ELSIF | END IF.  */
DECLARE
    nota NUMBER(38, 2) := &Nota;
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

/* EJERCICIO 12
Realiza un programa que lea por teclado dos n�meros enteros. El primero ser� los
goles del equipo de casa, y el segundo los goles del equipo de fuera.
Se quiere devolver por pantalla qui�n ha ganado: �El equipo de casa/visitante ha
ganado�. En caso de empate se indicar� �El resultado del partido ha sido de
empate�. */
DECLARE
    num1 NUMBER(38, 2) := &GolesLocales;
    num2 NUMBER(38, 2) := &GolesVisitante;
BEGIN
    IF num1 > 0 AND num2 > 0 THEN
        IF num1 > num2 THEN
            dbms_output.put_line('El equipo local');
        ELSIF num1 < num2 THEN
            dbms_output.put_line('el equipo visitante');
        ELSE
            dbms_output.put_line('Empate');
        END IF;
    ELSE
        dbms_output.put_line('Datos introducidos incorrectos');
    END IF;
END;
/
-- FORMA DOS
DECLARE
    num1 NUMBER(38, 2) := &GolesLocales;
    num2 NUMBER(38, 2) := &GolesVisitante;
BEGIN
    CASE
    WHEN num1 > 0 AND num2 > 0 THEN
        IF num1 > num2 THEN
            dbms_output.put_line('El equipo local');
        ELSIF num1 < num2 THEN
            dbms_output.put_line('el equipo visitante');
        ELSE
            dbms_output.put_line('Empate');
        END IF;
    ELSE
        dbms_output.put_line('Datos introducidos incorrectos');
    END CASE;
END;
/
-- FORMA TRES
DECLARE
    num1 NUMBER(38, 2) := &GolesLocales;
    num2 NUMBER(38, 2) := &GolesVisitante;
BEGIN
    IF num1 > 0 AND num2 > 0 THEN
        CASE
        WHEN num1 > num2 THEN
            dbms_output.put_line('El equipo local');
        WHEN num1 < num2 THEN
            dbms_output.put_line('el equipo visitante');
        ELSE
            dbms_output.put_line('Empate');
        END CASE;
    ELSE
        dbms_output.put_line('Datos introducidos incorrectos');
    END IF;
END;
/
-- FORMA CUATRO
DECLARE
    num1 NUMBER(38, 2) := &GolesLocales;
    num2 NUMBER(38, 2) := &GolesVisitantes;
BEGIN
    CASE
    WHEN num1 > 0 AND num2 > 0 THEN
        CASE
        WHEN num1 > num2 THEN
            dbms_output.put_line('El equipo local');
        WHEN num1 < num2 THEN
            dbms_output.put_line('El equipo visitante');
        ELSE 
            dbms_output.put_line('Empate');
        END CASE;
    ELSE
        dbms_output.put_line('Datos introducidos erroneos');
    END CASE;
END;
/

/* EJERCICIO 13
Realiza un programa que ejecute un bucle LOOP y se salga con un EXIT WHEN. Para
ello crea una variable entero inicializada a 0 y que se vaya incrementando en el
bucle, adem�s de mostrar por pantalla su valor; la condici�n de salida ser�
cuando dicha variable valga m�s de 20. */
DECLARE
    variableContador INT := 0;
BEGIN
    LOOP
        dbms_output.put_line(variableContador);
        variableContador := variableContador + 1;
        EXIT WHEN variableContador > 20;
    END LOOP;
END;
/

/* EJERCICIO 14
Realiza un programa que haga lo indicado en el ejercicio 13 pero que se salga
mediante un IF condici�n THEN EXIT. */
DECLARE
    variableContador INT := 0;
BEGIN
    LOOP
        IF variableContador > 20 THEN
            EXIT;
        ELSIF variableContador <= 20 THEN
            dbms_output.put_line(variableContador);
            variableContador := variableContador + 1;
        ELSE
            dbms_output.put_line('Datos Incorrectos');
        END IF;
    END LOOP;
END;
/

/* EJERCICIO 15
Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle
WHILE. */
DECLARE
    variableContador INT := 0;
BEGIN
    WHILE variableContador <= 20
        LOOP
            dbms_output.put_line(variableContador);
            variableContador := variableContador + 1;
        END LOOP;
END;
/

/* EJERCICIO 16
Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle
FOR. */
DECLARE
    
BEGIN
    FOR variableContador IN 0..20
        LOOP
            dbms_output.put_line(variableContador);
        END LOOP;
END;
/

/* EJERCICIO 17
Realiza un programa que haga lo indicado en el ejercicio 14 pero, en lugar de ir
incrementando de 0 a 20, que haga lo opuesto, que vaya mostrando 20, 19, 18� y
que termine con el 0. Emplea unbucle FOR. */
DECLARE
    
BEGIN
    FOR variableContador IN REVERSE 0..20
        LOOP
            dbms_output.put_line(variableContador);
        END LOOP;
END;
/

/* EJERCICIO 18
Realiza un programa que muestre por pantalla los n�meros pares hasta llegar a
40, inclusive. 
Nota: la funci�n MOD(m,n) devuelve el resto de dividir el par�metro m entre el
par�metro n. */
DECLARE

BEGIN
    FOR variableContador IN 0..40
        LOOP
            IF MOD(variableContador, 2) = 0 AND variableContador > 0 THEN
                dbms_output.put_line(variableContador);
            END IF;
        END LOOP;
END;
/

/* EJERCICIO 19
Realiza un programa que muestre por pantalla las tablas de multiplicar del 1 al
10. */
DECLARE

BEGIN
    FOR numeroIndice IN 1..10
        LOOP
            FOR numeroMultiplicar IN 1..10
                LOOP
                    dbms_output.put_line(numeroIndice || ' x ' || 
                    numeroMultiplicar || ' = ' || numeroIndice * 
                    numeroMultiplicar);
                END LOOP;
        END LOOP;
END;
/