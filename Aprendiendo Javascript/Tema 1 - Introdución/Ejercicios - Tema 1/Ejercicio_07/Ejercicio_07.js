/* 
EJERCICIO 7

Realizar un programa que calcule el IMC (índice de masa corporal). Para ello:

      1. Solicita por consola al usuario cuál es su altura y su peso (en dos pasos).
      2. Recoge los datos y calcula el IMC.
      3. Muestra por consola el resultado del IMC calculado.

Se calcula: IMC = masa / (estatura * estatura).
*/

/* 1. Solicita por consola al usuario cuál es su altura y su peso (en dos pasos). */
let alturaUsuario = prompt("Introduce tu altura: ");
let pesoUsuario = prompt("Introduce tu peso");

/* 2. Recoge los datos y calcula el IMC. */
let resultadoCalculoImc = pesoUsuario / (alturaUsuario * alturaUsuario);

/* 3. Muestra por consola el resultado del IMC calculado. */
console.log("Tu IMC es: " + resultadoCalculoImc);