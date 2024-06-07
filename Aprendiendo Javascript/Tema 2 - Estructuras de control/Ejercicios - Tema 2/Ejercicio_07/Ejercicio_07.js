/* 
7. Dado un número entero que se introduce por teclado, determinar si se encuentra en el intervalo cerrado 51-100.
*/

let numero = Number(prompt("Introduce un número entero: "));

if (numero >= 51 && numero <= 100) {
   console.log("Esta en el intervalo de 51 y 100");
} else {
   console.log("No está en el intervalo de 51 y 100");
}

