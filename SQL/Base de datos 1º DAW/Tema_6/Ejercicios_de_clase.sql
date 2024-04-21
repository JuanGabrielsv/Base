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
    nota NUMBER(3, 1) := &nota;
BEGIN
    CASE
    WHEN nota < 5 AND nota >= 0 THEN
        dbms_output.put_line('SUSPENSO');
    WHEN nota >= 5 AND nota < 6 THEN
        dbms_output.put_line('APROBADO');
    WHEN nota >= 6 AND nota < 7 THEN
        dbms_output.put_line('BIEN');
    WHEN nota >= 7 AND nota < 9 THEN
        dbms_output.put_line('NOTABLE');
    WHEN nota >= 9 AND nota <= 10 THEN
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

/*
EJERCICIO 3
? Utilizando las dos variables declaradas en el
ejercicio 2, as�gnales los valores siguientes:
? Primer caso: el valor del campo ENAME
cuando EMPNO vale 7839.
? Segundo caso: la fila completa cuando EMPNO
vale 7698. 
*/

/*
EJERCICIO 13
Realiza un programa que ejecute un bucle LOOP
y se salga con un EXIT WHEN. Para ello crea una
variable entero inicializada a 0 y que se vaya
incrementando en el bucle, adem�s de mostrar
por pantalla su valor; la condici�n de salida ser�
cuando dicha variable valga m�s de 20.
*/

declare
    i int := 0;
begin
    loop
        if i < 10 then
            dbms_output.put_line(i);
        elsif i = 10 then
            exit;
        end if;
        i := i+1; --i++ no, i+=1
    end loop;
end;
/
declare
    i int := 0;
begin
    loop
        dbms_output.put_line(i);        
        i := i+1; --i++ no, i+=1
        exit when i >= 1;
    end loop;
end;
/
 
--Ejercicio 13
declare
    num1 int := 0;
begin
    loop
        num1 := num1+1;
        dbms_output.put_line(num1);
        exit when num1>20;
    end loop;
end;
/
 
--Ejercicio 14
declare
    num1 int := 0;
begin
    loop
        num1 := num1+1;
        dbms_output.put_line(num1);
        if num1>20 then
            exit;
        end if;
    end loop;
end;
/
 
--Ejercicio 15
declare
    num1 int := 0;
begin
    while num1 <= 20 loop
        num1 := num1+1;
        dbms_output.put_line(num1);
    end loop;
end;
/
 
--Ejercicio 16
declare 
begin
    for i in reverse 1..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
 
--Ejercicio 17
declare
begin
    dbms_output.put_line('');
end;
/
 
--Ejercicio 18
declare
    i int;
begin
    for indice in 0..40 loop
    --for indice in 1..40 loop
        i := mod(indice, 2);
        --if i = 0 and indice != 0 then --CONDICI�N PARES
        if i != 0 then --CONDICI�N IMPARES
            dbms_output.put_line(indice);
        end if;
    end loop;
end;
/
 
--Ejercicio 19
declare
begin
    dbms_output.put_line('');
end;
/

// REGISTROS Y TABLAS
/* EJERCICIO 1
Declarar un tipo registro Tpersona con los
siguientes campos: un c�digo de tipo num�rico, un
nombre de tipo cadena de 100 caracteres y la
edad integer. Asignarle valor a una variable de tipo
Tpersona e imprimirlo por pantalla. */

DECLARE
    TYPE Tpersona IS RECORD (
        codigo NUMBER(38),
        nombre VARCHAR2(100),
        edad INT
    );
    persona1 Tpersona;
BEGIN
    persona1.codigo := 1;
    persona1.nombre := 'Pedro';
    persona1.edad := 25;
    dbms_output.put_line('Mostrar los datos');
    dbms_output.put_line(persona1.codigo || persona1.nombre || persona1.edad);
END;
/

--Ejercicio1
declare
    type tPersona is record(
        codigo number,
        nombre varchar(100),
        edad int
    );
    persona1 tPersona;
    persona2 tPersona;
begin
    persona1.codigo := 1;
    persona1.nombre := 'Pedro';
    persona1.edad := 25;
    dbms_output.put_line('Mostrar los datos');
    dbms_output.put_line(persona1.codigo||'|'||persona1.nombre||'|'||persona1.edad);
    dbms_output.put_line(persona2.codigo||'|'||persona2.nombre||'|'||persona2.edad);
end;
/

--Quiero que me hag�is un registro que se llame tDept con la estructura de la tabla tDept.

DECLARE
    TYPE tDept IS RECORD (
        deptno dept.deptno%type,
        dname dept.dname%type,
        loc dept.loc%type
    );
BEGIN
    dbms_output.put_line('');
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

/* EJERCICIO 7
Declarar una tabla de n�meros y asignarle con un bucle for los n�meros del 1 al 10. Adem�s de
asignar el valor dentro del bucle, mostrar el valor de la tabla por pantalla en cada iteraci�n. */

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
1. Declarar una tabla de �personas�. Donde �personas� es un tipo registro que almacena nombre, apellido1 y apellido2. 
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
    listaPersonas(1).apellido2 := 'L�pez';    
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
1. Utilizar la funci�n COUNT para devolver el n�mero de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el �ltimo de la tabla y devolver el n�mero total de elementos.
4. Preguntar si existe valor en la posici�n 10.
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
        dbms_output.put_line('No existe la posici�n 10');
    else
        dbms_output.put_line('Existe la posici�n 10');
    end if;
end;
/

/* EJERCICIO 10
   Se quiere mostrar por pantalla los datos de ciertos empleados (tablaemp). Se pide:
1. Se pedir� al usuario por la entrada de plsql que introduzca dos valores integer que coincidan con dos empnos de la tabla emp,
   y se guardar�n en una tabla de integers.
2. Se debe crear una tabla que contendr� como valores todos los campos de las filas de emp cuyo empno coincida con los de la
   tabla anterior. Puedes usar registros o %rowtype.
3. Recorre la tabla anterior mostrando por la salida los valores de cada columna de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los �ndices de tus bucles usa por ejemplo empno 7839 y 7698. */

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

/* SOLUCI�N PROFESOR */

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

