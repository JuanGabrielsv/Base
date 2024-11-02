/* 1. Dado un array de números:  const arr = [2, 3, 4, 5, 0]:
1. Escribir por consola la suma del array. Hacerlo con el método forEach y arrow functions.
2. Escribir por consola la media. 
3. Obtener otro array con el triple de cada elemento y mostrarlo por consola.
4. Obtener el mismo array con el triple de cada elemento y mostrarlo por consola. */

const arr = [2, 3, 4, 5, 0];
let sumaTotal = 0;

//1. Escribir por consola la suma del array. Hacerlo con el método forEach y arrow functions.
arr.forEach(element => {
    sumaTotal += element;
});

console.log(sumaTotal);

//2. Escribir por consola la media. 
console.log(sumaTotal / arr.length);

//3. Obtener otro array con el triple de cada elemento y mostrarlo por consola.
let aTriple = arr.map(element => element * 3);
console.log(aTriple);

//4. Obtener el mismo array con el triple de cada elemento y mostrarlo por consola.
aTriple = aTriple.map(element => element * 3);
console.log(aTriple);