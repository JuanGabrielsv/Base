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
2. Declara una variable tipo fecha inicializada a día 6 de abril de 2021.
3. Declara una variable numérica (NUMBER) con 3 dígitos que no sea null sin inicializar.
4. Declara una variable numérica (NUMBER) con 4 dígitos de precisión de los cuales 2 son decimales e inicialízala a 10,99.
5. Declara una variable carácter (VARCHAR2) de tamaño 10 con la frase CLASE DE DAMDAW.
6. Declara una constante numérica y valor 11. */
DECLARE
    -- 1. Declara una variable tipo fecha sin inicializarla.
    fecha1 DATE;
    -- 2. Declara una variable tipo fecha inicializada a día 6 de abril de 2021
    fecha2 DATE := '06/04/2021';
    -- 3. Declara una variable numérica (NUMBER) con 3 dígitos que no sea null sin inicializar.
    num1 NUMBER(3) := 199; --No se puede, hay que inicializarla o declararla.
    -- 4. Declara una variable numérica (NUMBER) con 4 dígitos de precisión de los cuales 2 son decimales e inicialízala a 10,99.
    num2 NUMBER(4, 2) := 10.99;
    -- 5. Declara una variable carácter (VARCHAR2) de tamaño 10 con la frase CLASE DE DAMDAW.
    frase VARCHAR2(15) := 'CLASE DE DAMDAW';
    -- 6. Declara una constante numérica y valor 11.
    num3 CONSTANT NUMBER(11) := 5;
BEGIN
    dbms_output.put_line(fecha1 || ' ' || fecha2 || num1 || ' ' || num2 || ' ' || num2 || ' ' || frase || ' ' || num3);
END;
/

/* EJERCICIO 2
1. Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
2. Declara una variable que haga referencia a toda una fila de la tabla EMP. */
DECLARE
    -- 1. Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
    variable1 emp.ename%type := 'hola';
    -- 2. Declara una variable que haga referencia a toda una fila de la tabla EMP.
    variable2 emp%rowtype;
BEGIN
    dbms_output.put_line(variable1);
END;
/

/* EJERCICIO 3
Utilizando las dos variables declaradas en el ejercicio 2, asígnales los valores
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
Crea un bloque de código anónimo que pida la base y altura de un triángulo,
y devuelva el área de este. */

DECLARE
    base NUMBER(38, 2) := &Base;
    altura NUMBER(38, 2) := &Altura;
    formula NUMBER(38, 2) := (base * altura) / 2;
BEGIN 
    dbms_output.put_line(formula);
END;
/

/* EJERCICIO 6
Crea un bloque de código anónimo que requiera por pantalla un nombre,
luego un apellido y muestre como resultado “Hola nombre apellido”. */

DECLARE
    nombre1 VARCHAR2(32767) := '&NOMBRE';
    apellido1 VARCHAR(32767) := '&APELLIDO';
BEGIN
    dbms_output.put_line('Hola ' || nombre1 || ' ' || apellido1);
END;
/

/* EJERCICIO 7 Crea un programa que realiza la suma, resta, multiplicación y
división de dos números enteros, num1 y num2 (8 y 4). */

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
    dbms_output.put_line('MULTIPLICACIÓN: '||multiplicacion);
    dbms_output.put_line('DIVISIÓN: '||division);
END;
/

/* EJERCICIO 8 y 9
Crea un programa que realiza la suma de dos números enteros, num1 y num2, si
num1 es mayor que num2. En caso contrario que no haga nada.
Asigna por ejemplo los valores 7 y 3 a los números. */

DECLARE
    num1 INT := 3; -- Cambiar números para ver que funciona.
    num2 INT := 7; -- Cambiar números para ver que funciona.
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
por teclado (tiene que ser un número), y según sea su valor entre 0 y 10,
devuelva por pantalla el valor de la nota:
SUSPENSO, APROBADO, BIEN, NOTABLE, SOBRESALIENTE.
En caso contrario, que devuelva ‘El valor introducido es incorrecto’. */

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