/* 
6. Dado un número entero que se introduce por teclado, determinar si es positivo, negativo o nulo.
*/

let numero = BigInt(prompt("Introduce un número entero, puede ser negativo, positivo o nulo: "));

if (numero < 0) {
   console.log("El número es negativo");
} else if (numero > 0) {
   console.log("El número es positivo");
} else {
   console.log("El número es nulo");
}