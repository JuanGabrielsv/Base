/* 
9. Dado un número que se introduce por teclado, si es positivo verificar si se encuentra en el intervalo
abierto 60 – 90, de lo contrario emitir un mensaje de error.
*/

let numero = Number(prompt("Introduce un número: "));

if (numero > 0) {
    if (numero >= 60 && numero <= 90) {
        console.log("El número esta en el intervalo de 60 y 90");
    } else {
        console.log("El número es positivo pero no está en le intervalo de 60 y 90");
    }
} else {
    console.log("El número no es positivo...");
}