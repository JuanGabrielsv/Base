/* 
10. Introducir varias edades por teclado hasta que la edad sea 0 ( que indicará el final del ingreso de las
edades) y calcular la media de los valores introducidos.
*/

let suma = Number(0);
let contadorDoWhile = Number(-1);
let edad = Number(0);
let check = Boolean(true);
let media = Number(0);
let contador = Number(0);

do { 
    suma += edad;
    contadorDoWhile++;
    edad = Number(prompt("Introduce una edad, '0' para terminar"));    
} while (edad > 0);

media = Number(suma / contadorDoWhile);
console.log("Fin del programa, la media de las edades es " + media);

/*
for (let i = 1; i > 0; i++) {
    let edad = Number(prompt("Introduce una edad, '0' para terminar"));
    if (edad === 0) {
        i = -1;
    } else {
        suma += edad;
        contador++;
    }
}

let media = Number(suma / contador);
console.log("Fin del programa, la media de las edades es " + media);
*/

/* 
while (check) {
    let edad = Number(prompt("Introduce una edad, '0' para terminar"));
    if (edad === 0) {        
        check = false;
    } else {
        suma += edad;
        contador++;
    }
}
let media = Number(suma / contador);
console.log("Fin del programa, la media de las edades es " + media); 
*/


