/* 
EJERCICIO 11
Repite el ejercicio anterior, pero con la restricción de que sólo podrás leer desde el teclado
datos de tipo String. 
PISTA: Tendrás que aplicar una conversión de tipos. 
*/

let num1 = String(prompt("Introduce el primer número: "));
let num2 = String(prompt("Introduce el segundo número: "));

let resultado = Number(num1 * num2);

console.log(resultado);
console.log(typeof(resultado));

