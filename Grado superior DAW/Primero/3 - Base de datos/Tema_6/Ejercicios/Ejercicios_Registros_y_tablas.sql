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
Declarar un tipo registro Tpersona con los siguientes campos: un c�digo de tipo
num�rico, un nombre de tipo cadena de 100 caracteres y la edad integer.
Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla. */

/* EJERCICIO 2
2.1. Crea un registro tpersona igual que el del ejemplo de teor�a. Despu�s, crea
otro registro alumno que tenga como campos nombre varchar 100, y profesor
tpersona.
2.2. Crea una variable alumno1 del tipo alumno, dale valores a todos sus campos
y mu�stralos por la salida.
2.3. Crea una variable alumno2 del tipo alumno, dale valores solo a nombre y
c�digo de profesor, y saca los datos por la salida. */

/* EJERCICIO 3
Crea un registro tipodept con la misma estructura que la tabla dept (y mismos
tipos de datos).
A continuaci�n, crea una variable fila del tipo tipodept. 
Se quiere guardar en fila todos los datos del departamento cuyo dptno es 10.
Muestra por la salida el valor de cada campo guardado en fila. */

/* EJERCICIO 4
Empleando el registro tipdept anterior, se quieren guardar solo los datos deptno
y dname de la tabla dept para el caso del departamento cuyo id es 20.
Para ello crea una variable fila2 del tipo tipodept, guarda esos datos y 
mu�stralo por la salida. */

/* EJERCICIO 5
Se quieren guardar todos los datos del departamento cuyo deptno es 30 en una
variable del tipo %rowtype llamada filacompleta. 
Muestrapor la salida el valor de los distintos campos de filacompleta. */

/* EJERCICIO 6
Se quieren guardar los datos deptno y loc del departamento cuyo deptno es 40 en
una variable del tipo %rowtype llamada filacompleta2. 
Muestra por la salida el valor de los dos campos de filacompleta2. */

/* EJERCICIO 7
Declarar una tabla de n�meros y asignarle con un bucle for los n�meros del 1 al
10. Adem�s de asignar el valor dentro del bucle, mostrar el valor de la tabla
por pantalla en cada iteraci�n. */

/* EJERCICIO 8
Declarar una tabla de �personas�. Donde �personas� es un tipo registro que
almacena nombre, apellido1 y apellido2. 
Asignarle valores para una persona e imprimirlos por pantalla. */

/* EJERCICIO 9
Sobre el ejercicio 7:
1. Utilizar la funci�n COUNT para devolver el n�mero de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el �ltimo de la tabla y devolver el n�mero total de elementos.
4. Preguntar si existe valor en la posici�n 10. */

/* EJERCICIO 10
Se quiere mostrar por pantalla los datos de ciertos empleados (tabla emp).
Se pide:
1. Se pedir� al usuario por la entrada de plsql que introduzca dos valores
integer que coincidan con dos empnos de la tabla emp, y se guardar�n en una
tabla de integers.
2. Se debe crear una tabla que contendr� como valores todos los campos de las
filas de emp cuyo empno coincida con los de la tabla anterior. 
Puedes usar registros o %rowtype.
3. Recorre la tabla anterior mostrando por la salida los valores de cada columna
de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los �ndices de tus
bucles.
Usa por ejemplo empno 7839 y 7698. */



