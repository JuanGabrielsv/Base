/*
EJERCICIO 03
Realizar un programa que solicite números al usuario, los almacene y luego los muestre en el
mismo orden en el que fueron indicados. 

    1. En primer lugar, preguntaremos al usuario cuántos números nos va a decir. 
    2. Luego se los iremos solicitando uno a uno y los iremos guardando en un array. 
    3. Al terminar, le mostraremos la lista completa de números.
    4. Muestra la lista completa de números en orden inverso a como fueron introducidos por el usuario.
    5. Muestra cual número es el mayor y el menor (y en qué posición están).
    6. Calcula la media de todos los números.

Todo esto se debe hacer recorriendo el array. 
*/

const arrayNumeros = new Array();

let tamanoDelArray;
let vNumero;
let check = true;

/* En primer lugar, preguntaremos al usuario cuántos números nos va a decir. */ 
do {
    vNumero = prompt("¿Cuántos números vas a introducir?")
    if (vNumero !== null && vNumero !== "" && !isNaN(vNumero)) {
        vNumero = parseInt(vNumero)
    } else {
        alert("Datos introducidos no correctos, introduce un número entero...")
    }    
} while (!Number.isInteger(vNumero));

/* Luego se los iremos solicitando uno a uno y los iremos guardando en un array. */


/*let N;
        do {
            let input = prompt("Introduce un valor entero mayor a 0 para N:");
            if (input !== null && input !== '' && !isNaN(input)) {
                N = parseInt(input);
            }
        } while (!Number.isInteger(N) || N <= 0);

        console.log(N);*/

