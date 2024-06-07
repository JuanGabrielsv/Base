/*
EJERCICIO 56

• Realizar un programa que simule el lanzamiento de un dado durante N veces. 
• Solicitaremos al usuario cuántas veces quiere que lancemos el dado.
• Imprimiremos por consola el resultado de lanzar de manera aleatoria el dado cada una de las veces. 
*/

import { dado } from "./funciones.js";

let numeroVeces;

numeroVeces = prompt('¿Cuántas veces quieres tirara el dado?');

for (let i = 0; i < numeroVeces; i++) {
    console.log(dado());
}