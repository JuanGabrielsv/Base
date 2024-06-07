/* 
EJERCICIO 42
Mejorar el ejercicio anterior para que cuando entendamos el mensaje, volvamos a pedir otro
nuevo continuamente. Lo haremos hasta que el mensaje, en lugar de terminar en
“hastaluego”, termine en “adiós”
*/

const INICIO = 'hola ';
const FINAL = ' hastaluego';
const FINAL_SALIR = ' adiós';
const SALIR = null;
const INICIAR_PROGRAMA = "1";

let vOpcion;
let vCadena;

while (vOpcion !== SALIR) {
    vOpcion = prompt("Bienvenido al programa que te detecta lo que escribas.\nElige una opción.\n\n(1) INICIAR PROGRAMA.\n\nPara 'Salir'");

    if (vOpcion === SALIR) {
        break;
    } else if (vOpcion === INICIAR_PROGRAMA) {
        while (vOpcion === INICIAR_PROGRAMA) {
            vCadena = prompt("Introduce tu mensaje:");

            if (vCadena.startsWith(INICIO) && vCadena.endsWith(FINAL_SALIR)) {
                break;
            } else if (vCadena.startsWith(INICIO) && vCadena.endsWith(FINAL)) {
                alert(vCadena.substring(vCadena.indexOf(INICIO) + INICIO.length, vCadena.lastIndexOf(FINAL)));
            } else {
                alert('No se ha podido leer el mensaje');
            }
        }
    } else {
        alert("Opción no válida.");
    }
}

alert('Programa cerrado correctamente');