/*
EJERCICIO 62
Realizar un programa que solicite al usuario un número e indique si es o no es capicúa.
*/

let numero;
let numeroInvertido = "";
let check = true;

do {
    numero = prompt("Introduce el número: ");
    if (numero === null) {
        alert("Número no válido...");            
    } else if (numero === "") {
        alert("Debes introducir un número...");
    } else if (numero.length < 2) {
        alert("Cómo mínimo el número debe ser de 2 dígitos");
    }
    else {
        check = false;        
    }
} while (check);

for (let i = numero.length; i >= 0; i--) {
    numeroInvertido += numero.substring(i, i + 1);
}

if (numero === numeroInvertido) {
    alert("Es capicúa");
} else {
    alert("No es capicúa");
}