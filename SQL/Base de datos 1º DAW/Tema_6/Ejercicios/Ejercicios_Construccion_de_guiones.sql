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
3. Declara una variable numérica (NUMBER) con 3 dígitos que no sea null sin 
   inicializar.
4. Declara una variable numérica (NUMBER) con 4 dígitos de precisión de los 
   cuales 2 son decimales e inicialízala a 10,99.
5. Declara una variable carácter (VARCHAR2) de tamaño 10 con la frase CLASE DE 
   DAMDAW.
6. Declara una constante numérica y valor 11. */

/* EJERCICIO 2
1. Declara una variable que tenga el tipo de dato igual que el de la columna
ENAME de la tabla EMP. 
2. Declara una variable que haga referencia a toda una fila de la tabla EMP. */

/* EJERCICIO 3
Utilizando las dos variables declaradas en el ejercicio 2, asígnales los valores
siguientes:
    1. Primer caso: el valor del campo ENAME cuando EMPNO vale 7839.
    2. Segundo caso: la fila completa cuando EMPNO vale 7698. */

/* EJERCICIO 5
Crea un bloque de código anónimo que pida la base y altura de un triángulo,
y devuelva el área de este. */

/* EJERCICIO 6
Crea un bloque de código anónimo que requiera por pantalla un nombre,
luego un apellido y muestre como resultado “Hola nombre apellido”. */

/* EJERCICIO 7 Crea un programa que realiza la suma, resta, multiplicación y
división de dos números enteros, num1 y num2 (8 y 4). */

/* EJERCICIO 8 y 9
Crea un programa que realiza la resta de dos números enteros, num1 y num2,
si num1 es mayor que num2. En caso contrario, que muestre por pantalla
‘num1 es menor que num2’, sustituyendo num1 y num2 por sus valores.
Asigna por ejemplo los valores 7 y 3 a los números. */

/* EJERCICIO 10
Crea un programa que tome pida una variable al usuario para que la introduzca
por teclado (tiene que ser un número), y según sea su valor entre 0 y 10,
devuelva por pantalla el valor de la nota:
SUSPENSO, APROBADO, BIEN, NOTABLE, SOBRESALIENTE.
En caso contrario, que devuelva ‘El valor introducido es incorrecto’. */

/* EJERCICIO 11
Realiza el mismo ejercicio 10 pero utilizando CASE en lugar de
IF | ELSIF | END IF.  */

/* EJERCICIO 12
Realiza un programa que lea por teclado dos números enteros. El primero será los
goles del equipo de casa, y el segundo los goles del equipo de fuera.
Se quiere devolver por pantalla quién ha ganado: “El equipo de casa/visitante ha
ganado”. En caso de empate se indicará “El resultado del partido ha sido de
empate”. */

/* EJERCICIO 13
Realiza un programa que ejecute un bucle LOOP y se salga con un EXIT WHEN. Para
ello crea una variable entero inicializada a 0 y que se vaya incrementando en el
bucle, además de mostrar por pantalla su valor; la condición de salida será
cuando dicha variable valga más de 20. */

/* EJERCICIO 14
Realiza un programa que haga lo indicado en el ejercicio 13 pero que se salga
mediante un IF condición THEN EXIT. */

/* EJERCICIO 15
Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle
WHILE. */

/* EJERCICIO 16
Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle
FOR. */

/* EJERCICIO 17
Realiza un programa que haga lo indicado en el ejercicio 14 pero, en lugar de ir
incrementando de 0 a 20, que haga lo opuesto, que vaya mostrando 20, 19, 18… y
que termine con el 0. Emplea unbucle FOR. */

/* EJERCICIO 18
Realiza un programa que muestre por pantalla los números pares hasta llegar a
40, inclusive. 
Nota: la función MOD(m,n) devuelve el resto de dividir el parámetro m entre el
parámetro n. */

/* EJERCICIO 19
Realiza un programa que muestre por pantalla las tablas de multiplicar del 1 al
10. */