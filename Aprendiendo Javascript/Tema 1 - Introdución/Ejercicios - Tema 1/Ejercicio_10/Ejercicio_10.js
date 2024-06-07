/* 
EJERCICIO 10

Realiza un programa que solicite dos números enteros y los multiplique. 
Mostrará el resultado de esa multiplicación.
Prueba a introducir números muy grandes. ¿Qué ocurre? ¿Cómo podemos resolverlo?. 
*/

let num1 = Number;
let num2 = Number;

num1 = prompt("Introduce el primer número entero: ");
num2 = prompt("Introduce el segundo número entero: ");

let multiplicacion = BigInt(num1 * num2);

console.log("La multiplicación de: " + num1 + " y " + num2 + " es " + multiplicacion);