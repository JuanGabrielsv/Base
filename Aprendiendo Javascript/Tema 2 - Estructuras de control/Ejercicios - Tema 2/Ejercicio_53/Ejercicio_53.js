/* 
EJERCICIO 53
Realizar un programa que muestre por pantalla un cuadrado de 5x5 con su diagonal. 
De este modo:

* - - - -
- * - - -
- - * - -
- - - * -
- - - - *

*/

//import {} from "./funciones.js";

let linea = '';
let mensaje = '';

for (let i = 0; i < 5; i++) {
    linea = '';
    for (let j = 0; j < 5; j++) {
        if (j === i) {
            linea += ' * ';
        } else {
            linea += ' - ';
        }
    }
    mensaje += linea + '\n';
}

console.log(mensaje);