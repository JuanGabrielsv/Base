/*
EJERCICIO 2

1. Realizar un programa que solicite un número al usuario. 
2. Guardar en un array el cuadrado de ese número y de los 5 siguientes.
3. Al terminar, mostrar el contenido del array por consola. 
*/

let numero;
let numeroFinal;
let arrayNumeros = [];

numero = prompt("Introduce un número por favor:");
numeroFinal = Number(numero) + 5;

for (let i = numero; i <= numeroFinal; i++) {
    arrayNumeros.push(i ** 2);
}

for (let i = 0; i < arrayNumeros.length; i++) {
    console.log(arrayNumeros[i]);
}

console.log("");

console.log(arrayNumeros.toString());

console.log("Tamaño de la array " + arrayNumeros.length);