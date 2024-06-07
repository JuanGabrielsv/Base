/* 
EJERCICIO 9

Realizar un programa que solicite el radio de un círculo y nos indique a continuación cuál es la
circunferencia y el área de dicho círculo como resultado.
Utiliza las constantes cuando consideres oportuno. 
*/

const PI = 3.1416;

let radio = Number(prompt("Introduce el radio de la circunferencia: "));
let resultadoCalculoAreaCirculo = Number(PI * radio ** 2);
console.log("El área del circulo es: " + resultadoCalculoAreaCirculo);
