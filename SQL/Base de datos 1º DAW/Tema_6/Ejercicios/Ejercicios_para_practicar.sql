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
Utilizando las dos variables declaradas en el ejercicio 2, asígnales los valores siguientes:
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
    dbms_output.put_line(variable2.empno ||' '|| variable2.ename ||' '|| variable2.job ||' '|| variable2.mgr ||' '|| variable2.hiredate ||' '||
        variable2.sal ||' '|| variable2.comm ||' '|| variable2.deptno);
END;
/
