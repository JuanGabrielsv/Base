/*
EJERCICIO12

Dada una cadena mostrarla al revés por pantalla.
Ej: “Hoy es viernes” mostrar: ”senreiv se yoH”
*/

let cadenaOriginal = "Hoy es viernes";

let aCadena = cadenaOriginal.split("");
let cadenaDelReves = "";

aCadena.reverse().forEach(element => {
    cadenaDelReves += element;
});

console.log(cadenaDelReves);