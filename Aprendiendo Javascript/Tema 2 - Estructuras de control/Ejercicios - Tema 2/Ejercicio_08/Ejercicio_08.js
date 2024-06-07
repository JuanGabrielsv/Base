/* 
8. Dado un número entero que se introduce por teclado, determinar si es negativo o superior a 100.
*/

let numero = Number(prompt("Introduce un número entero: "));

if (numero < 0 || numero > 100) {
    console.log("El número es negativo o superior a 100");
} else {
    console.log("El número NO es negativo ni es superior a 100");
}