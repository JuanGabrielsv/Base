/*
EJERCICIO 04
1- Realizar un programa que solicite 3 palabras al usuario y las guarde cada una en un array.
2- Después, recorrer el array y concatenar todas las palabras para mostrarlas por consola. 
*/

const aPalabra1 = new Array();
const aPalabra2 = new Array();
const aPalabra3 = new Array();

let vPalabra;
let vPalabrasConcatenadas;
let check = true;

do {
    vPalabra = prompt("Introduce la primera palabra");
    if (vPalabra !== "" && vPalabra !== null) {
        aPalabra1.push(vPalabra.trim());
    } else {
        alert("Datos erroneos, vuelve a introducir la primera palabra: ");
    }
} while (vPalabra === "" || vPalabra === null);

do {
    vPalabra = prompt("Introduce la segunda palabra");
    if (vPalabra !== "" && vPalabra !== null) {
        aPalabra2.push(vPalabra.trim());
    } else {
        alert("Datos erroneos, vuelve a introducir la segunda palabra: ");
    }
} while (vPalabra === "" || vPalabra === null);

do {
    vPalabra = prompt("Introduce la tercera palabra");
    if (vPalabra !== "" && vPalabra !== null) {
        aPalabra3.push(vPalabra.trim());
    } else {
        alert("Datos erroneos, vuelve a introducir la tercera palabra: ");
    }
} while (vPalabra === "" || vPalabra === null);

vPalabrasConcatenadas = aPalabra1[0] + aPalabra2[0] + aPalabra3[0];

console.log(aPalabra1);
console.log(aPalabra2);
console.log(aPalabra3);

console.log("Concatenadas: " + vPalabrasConcatenadas);