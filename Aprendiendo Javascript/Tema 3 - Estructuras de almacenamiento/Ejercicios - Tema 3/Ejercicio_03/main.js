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

let arrayNumerosInversos = []; //Otra forma de declarar una array.
let tamanoDelArray;
let vNumero;
let vNumeroIntroducido;
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
do {
    for (let i = 0; i < vNumero; i++) {
        do {
            vNumeroIntroducido = prompt("Números a introducir: " + (vNumero - i) + "\n\nIntroduce el número:");
            if (vNumeroIntroducido !== null && vNumeroIntroducido !== "" && !isNaN(vNumeroIntroducido)) {
                arrayNumeros.push(Number(vNumeroIntroducido));
            } else {
                alert("Datos introducidos no correctos, introduce un número entero...")
            }
        } while (vNumeroIntroducido === null || vNumeroIntroducido === "" || isNaN(vNumeroIntroducido));
    }
    check = false
} while (check)

/* Imprimimos la array con el método .toString */
console.log(arrayNumeros.toString());

/* Tambien podemos usar un for */
for (let i = 0; i < arrayNumeros.length; i++) {
    console.log(arrayNumeros[i]);
}

/* Tambien con un foreach? */
arrayNumeros.forEach(element => {
    console.log(element);
});

/* Podemos usar el método .reverse() para guardar la array invertida en otra nueva y la imprimimos */
arrayNumerosInversos = arrayNumeros.reverse();
arrayNumerosInversos.forEach(element => {
    console.log(element);
});



