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
Declarar un tipo registro Tpersona con los siguientes campos: un código de tipo
numérico, un nombre de tipo cadena de 100 caracteres y la edad integer.
Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla. */

/* EJERCICIO 2
2.1. Crea un registro tpersona igual que el del ejemplo de teoría. Después, crea
otro registro alumno que tenga como campos nombre varchar 100, y profesor
tpersona.
2.2. Crea una variable alumno1 del tipo alumno, dale valores a todos sus campos
y muéstralos por la salida.
2.3. Crea una variable alumno2 del tipo alumno, dale valores solo a nombre y
código de profesor, y saca los datos por la salida. */

/* EJERCICIO 3
Crea un registro tipodept con la misma estructura que la tabla dept (y mismos
tipos de datos).
A continuación, crea una variable fila del tipo tipodept. 
Se quiere guardar en fila todos los datos del departamento cuyo dptno es 10.
Muestra por la salida el valor de cada campo guardado en fila. */

/* EJERCICIO 4
Empleando el registro tipdept anterior, se quieren guardar solo los datos deptno
y dname de la tabla dept para el caso del departamento cuyo id es 20.
Para ello crea una variable fila2 del tipo tipodept, guarda esos datos y 
muéstralo por la salida. */

/* EJERCICIO 5
Se quieren guardar todos los datos del departamento cuyo deptno es 30 en una
variable del tipo %rowtype llamada filacompleta. 
Muestrapor la salida el valor de los distintos campos de filacompleta. */

/* EJERCICIO 6
Se quieren guardar los datos deptno y loc del departamento cuyo deptno es 40 en
una variable del tipo %rowtype llamada filacompleta2. 
Muestra por la salida el valor de los dos campos de filacompleta2. */

/* EJERCICIO 7
Declarar una tabla de números y asignarle con un bucle for los números del 1 al
10. Además de asignar el valor dentro del bucle, mostrar el valor de la tabla
por pantalla en cada iteración. */

/* EJERCICIO 8
Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que
almacena nombre, apellido1 y apellido2. 
Asignarle valores para una persona e imprimirlos por pantalla. */

/* EJERCICIO 9
Sobre el ejercicio 7:
1. Utilizar la función COUNT para devolver el número de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el último de la tabla y devolver el número total de elementos.
4. Preguntar si existe valor en la posición 10. */

/* EJERCICIO 10
Se quiere mostrar por pantalla los datos de ciertos empleados (tabla emp).
Se pide:
1. Se pedirá al usuario por la entrada de plsql que introduzca dos valores
integer que coincidan con dos empnos de la tabla emp, y se guardarán en una
tabla de integers.
2. Se debe crear una tabla que contendrá como valores todos los campos de las
filas de emp cuyo empno coincida con los de la tabla anterior. 
Puedes usar registros o %rowtype.
3. Recorre la tabla anterior mostrando por la salida los valores de cada columna
de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los índices de tus
bucles.
Usa por ejemplo empno 7839 y 7698. */



