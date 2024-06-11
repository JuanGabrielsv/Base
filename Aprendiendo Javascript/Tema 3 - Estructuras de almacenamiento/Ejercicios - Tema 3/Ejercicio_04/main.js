/*
EJERCICIO 04
Modificar el programa anterior para que muestre la lista completa de números en orden
inverso a como fueron introducidos por el usuario. 
*/

let cantidad;
let numeros;
let arrayNumeros = [];

cantidad = prompt("¿Cuántos números vas a guardar en la array?");

for (let i = 1; i <= cantidad; i++) {
    numeros = prompt("Introduce el número " + i + " :");
    arrayNumeros.push(numeros);
}

alert(arrayNumeros.reverse());