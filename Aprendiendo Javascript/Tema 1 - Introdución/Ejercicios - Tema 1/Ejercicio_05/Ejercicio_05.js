/* 
EJERCICIO 5

Realizar un programa que trabaje del siguiente modo:

      1. Mostrar un mensaje preguntando “¿Cuánto te gustaría ganar al año?”.
      2. Esperar a que el usuario conteste indicando una cantidad.
      3. Mostrar un nuevo mensaje “Tu sueldo mensual sería de xx euros” (calcular xx
         dividiendo lo indicado por el usuario entre 12).
*/

/* 1. Mostrar un mensaje preguntando “¿Cuánto te gustaría ganar al año?”.
   2. Esperar a que el usuario conteste indicando una cantidad. */
let cantidadUsuario = prompt("¿Cuánto te gustaría ganar al año?");

/* 3. Mostrar un nuevo mensaje “Tu sueldo mensual sería de xx euros” (calcular xx
      dividiendo lo indicado por el usuario entre 12). */
console.log("Tu sueldo mensual sería de " + (cantidadUsuario / 12 + " euros"));




