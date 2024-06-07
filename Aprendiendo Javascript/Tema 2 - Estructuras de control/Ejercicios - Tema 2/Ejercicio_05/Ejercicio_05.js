/* 
5. Dado un número entero y positivo que se introduce por teclado, determinar si es par o impar.
(El numero es par o impar, verificando si el modulo del numero entre 2 es 0 o no ).
*/

let numeroUsuario = Number(prompt("Introduce un número: "));

if (numeroUsuario % 2 === 0) {
   console.log("El número es par");
} else {
   console.log("El número es impar");
}