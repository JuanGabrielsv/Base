/* 
EJERCICIO 01
Realizar un programa que guarde en un array todos los números pares entre 1 y 30. 
Después, mostrar el contenido del array por consola. 
*/

let arrayNumerosB = [];

for (let i = 1; i <= 30; i++) {
    if (i % 2 === 0) {
        arrayNumerosB.push(i);
    }
}

for (let i = 0; i < arrayNumerosB.length; i++) {
    console.log(arrayNumerosB[i]);
}

