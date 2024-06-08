/* 
EJERCICIO 60
Realizar un programa que muestre por pantalla un cuadrado de NxN con sus dos diagonales.
Solicitar al usuario el valor de N, que tendrá que ser mayor a 0. Si no lo es, volver a solicitarlo.
Si por ejemplo nos indican N = 5, se representaría de este modo:

* - - - *
- * - * -
- - * - -
- * - * -
* - - - * 

*/

let mensaje = "";
let linea = "";
let tamano;
let check = true;

do {
    tamano = prompt("Introduce el tamano del tablero: ");
    if (tamano > 0) {
        check = false;
    } else {
        alert("Introduce un número mayor que 0");
    }
} while (check);

for (let i = 0; i < tamano; i++) {
    linea = "";
    for (let j = 0; j < tamano; j++) {
        if (i === j || i + j === tamano - 1) {
            linea += "*";
        } else {
            linea += "-";
        }
    }
    mensaje += linea + "\n";
}

console.log(mensaje);