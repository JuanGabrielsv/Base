/* 
EJERCICIO 18

Completar el ejercicio 7 del tema anterior para mostrar si el usuario tiene o no sobrepeso
siguiente esta guía:
      Peso inferior al normal menos de 18.5
      Peso nomral entre 18.5 y 24.9
      Peso superior al normal entre el 25 y 29.9
      Peso obesidad mas de 30.0      
*/

/* 1. Solicita por consola al usuario cuál es su altura y su peso (en dos pasos). */
let alturaUsuario = prompt("Introduce tu altura: ");
let pesoUsuario = prompt("Introduce tu peso");

/* 2. Recoge los datos y calcula el IMC. */
let resultadoCalculoImc = pesoUsuario / (alturaUsuario * alturaUsuario);

/* 3. Muestra por consola el resultado del IMC calculado. */
console.log("Tu IMC es: " + resultadoCalculoImc);
if (resultadoCalculoImc < 18.5) {
      console.log("Tienes un peso inferior al normal");
} else if (resultadoCalculoImc >= 18.5 && resultadoCalculoImc <= 24.9) {
      console.log("Tu peso es normal");
} else if (resultadoCalculoImc >= 25 && resultadoCalculoImc <= 29.9) {
      console.log("Tu peso es superior al normal");
} else if (resultadoCalculoImc >= 30) {
      console.log("Estas gordo");
}