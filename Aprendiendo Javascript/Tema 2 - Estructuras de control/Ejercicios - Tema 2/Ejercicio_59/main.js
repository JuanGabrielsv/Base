/* 
EJERCICIO 59
• Realizar un programa que transforme un texto escrito por el usuario en nomenclatura camelCase. 

Por ejemplo, si el usuario escribe:
    "Esto es una prueba"

El resultado tendría que ser:
    "estoEsUnaPrueba"
*/

let cadena;
let cadenaCamel = "";
let contador = 0;
let letraMayus;

cadena = prompt("Introduce un texto: ");

cadena = cadena.toLowerCase().trim();

for (let i = 0; i < cadena.length; i++) {
    if (cadena.substring(i, i + 1) === " ") {
        cadenaCamel += cadena.substring(i + 1, i + 2).toUpperCase();
        i++;        
    } else {
        cadenaCamel += cadena.substring(i, i + 1);
    }
}

alert(cadenaCamel);

