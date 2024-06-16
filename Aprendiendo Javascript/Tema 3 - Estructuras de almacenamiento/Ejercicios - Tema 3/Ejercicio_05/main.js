/*
EJERCICIO 05

1. Pedir la usuario que introduzca 5 números los vamos guardando en un array.
2. Ordenar el array tenga los números de menor a mayor. 
*/

const arrayNumeros = new Array();

let vNumeros;

for (let i = 1; i <= 5; i++) {
    do {
        vNumeros = prompt(i + " de 5 Introduce un número:");
        if (vNumeros !== null && vNumeros !== "" && !isNaN(vNumeros) && !vNumeros.includes(" ")) {
            arrayNumeros.push(vNumeros);
        } else {
            alert("Lo introducido no es correcto");
        }
    } while (vNumeros === null || vNumeros === "" || isNaN(vNumeros) || vNumeros.includes(" "));
}

console.log(arrayNumeros.sort((a, b) => a - b));