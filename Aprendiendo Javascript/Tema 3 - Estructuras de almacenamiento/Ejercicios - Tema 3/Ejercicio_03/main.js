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

let arrayNumerosInversos = [];
let tamanoDelArray;
let vNumero;
let vNumeroIntroducido;
let vNumeroMayor;
let vNumeroMenor;
let vPosicionMayor;
let vPosicionMenor;
let vSuma = 0;
let vMedia;
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

// 2. Luego se los iremos solicitando uno a uno y los iremos guardando en un array. 
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

// 3. Al terminar, le mostraremos la lista completa de números.
/* Imprimimos la array con el método .toString */
console.log("Imprimimos la array con el método .toString()");
console.log(arrayNumeros.toString());

/* Tambien podemos usar un for */
console.log("También podemos usar un FOR");
for (let i = 0; i < arrayNumeros.length; i++) {
    console.log(arrayNumeros[i]);
}

/* Tambien con un foreach */
console.log("Con un FOREACH");
arrayNumeros.forEach(element => {
    console.log(element);
});

// 4. Muestra la lista completa de números en orden inverso a como fueron introducidos por el usuario.
/* Lo hacemos con varios métodos y usando .slice */
console.log("Lo hacemos con varios métodos y usando .slice");
arrayNumeros.slice().reverse().forEach(element => console.log(element));

/* Lo hacemos tambien con un for */
console.log("Lo hacemos tambien con un for");
for (let i = arrayNumeros.length - 1; i >= 0; i--) {
    console.log(arrayNumeros[i]);
}

/* Lo mas lógico sería crear una array nueva copiando la otra y le damos la vuelta con .reverse() */
console.log("Creamos un array nuevo que sea una copia del original y le damos la vuelta con .reverse()");
arrayNumerosInversos = Array.from(arrayNumeros);
arrayNumerosInversos.reverse();
console.log(arrayNumerosInversos.toString());

// 5. Muestra cual número es el mayor y el menor (y en qué posición están).
/* Sacamos el número mayor */
console.log("Sacamos el número mayor y menor");
vNumeroMayor = arrayNumeros[0];
vNumeroMenor = arrayNumeros[0];
for (let i = 0; i < arrayNumeros.length; i++) {
    if (arrayNumeros[i] > vNumeroMayor) {
        vNumeroMayor = arrayNumeros[i];
        vPosicionMayor = i;
    }

    if (arrayNumeros[i] < vNumeroMenor) {
        vNumeroMenor = arrayNumeros[i];
        vPosicionMenor = i;
    }
}
console.log(vNumeroMayor + " en la posición " + vPosicionMayor);
console.log(vNumeroMenor + " en la posición " + vPosicionMenor);
console.log(arrayNumeros);

// 6. Calcula la media de todos los números.
console.log("Calculamos la media de todos los números");
for (let i = 0; i < arrayNumeros.length; i++) {
    vSuma += arrayNumeros[i];
}
vMedia = Number(vSuma / arrayNumeros.length);
console.log(vMedia);




