/*
EJERCICIO 03
1. Realizar un programa que solicite números al usuario, los almacene y luego los muestre en el mismo orden en el que fueron indicados. 
2. Para ello, en primer lugar, preguntaremos al usuario cuántos números nos va a decir. 
3. Luego se los iremos solicitando uno a uno y los iremos guardando en un array. 
4. Al terminar, le mostraremos la lista completa de números. 
*/

let cantidad;
let numeros;
let arrayNumeros = [];

cantidad = prompt("¿Cuántos números vas a guardar en la array?");

for (let i = 1; i <= cantidad; i++) {
    numeros = prompt("Introduce el número " + i + " :");
    arrayNumeros.push(numeros);
}

alert(arrayNumeros.toString());