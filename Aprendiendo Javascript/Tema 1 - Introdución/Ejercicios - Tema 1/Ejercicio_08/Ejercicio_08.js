/* 
EJERCICIO 8

Realizar un programa que obtenga por teclado los siguientes datos:

      1. Un valor, pero registradlo en una variable de tipo String llamada a.
      2. Un valor, pero registradlo en una variable de tipo Number llamada b.
      3. Un valor, pero registradlo en una variable de tipo BigInt llamada c.

A continuación, haz las siguientes conversiones de tipo:

      4. Guarda el valor de “a” en una variable de tipo Number llamada “x1”.
      5. Guarda el valor de “b” en una variable de tipo String llamada “x2”.
      6. Guarda el valor de “c” en una variable de tipo String llamada “x3”.      

Imprime por consola el valor de todas las variables x1, x2, x3 y x4 
*/

/* 1. Un valor, pero registradlo en una variable de tipo String llamada a. */
let a = String(prompt("Introduce un valor que quieras guardar como tipo String: "));
console.log("Variable a contiene: " + a);
console.log("y es de TIPO: " + typeof(a));

/* 2. Un valor, pero registradlo en una variable de tipo Number llamada b. */
let b = Number(prompt("Introduce un valor que quieras guardar como tipo Number: "));
console.log("Variable b contiene: " + b);
console.log("y es de TIPO: " + typeof(b));

/* 3. Un valor, pero registradlo en una variable de tipo BigInt llamada c. */
let c = BigInt(prompt("Introduce un valor que quieras guardar como tipo BigInt: !"));
console.log("Variable c contiene: " + c);
console.log("y es de TIPO: " + typeof(c));

/* 4. Guarda el valor de “a” en una variable de tipo Number llamada “x1”. */
let x1 = Number(a);
console.log(x1);
console.log(typeof(x1));

/* 5. Guarda el valor de “b” en una variable de tipo String llamada “x2”. */
let x2 = String(b);
console.log(x2);
console.log(typeof(x2))

/* 6. Guarda el valor de “c” en una variable de tipo String llamada “x3”. */
let x3 = String(c);
console.log(x3);
console.log(typeof(x3));




