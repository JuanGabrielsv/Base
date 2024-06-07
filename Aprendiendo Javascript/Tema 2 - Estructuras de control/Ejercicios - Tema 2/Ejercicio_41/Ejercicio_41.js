/* 
EJERCICIO 41
Realizar un programa que solicite un texto al usuario.

• Si el texto comienza por “hola” y termina con “hastaluego”, le indicaremos que lo hemos entendido, e imprimiremos el mensaje que hay
  entre esas dos palabras.
Por ejemplo, si el usuario escribe “hola cómo estás hastaluego”
Debemos decir: Lo he entendido. Mensaje: cómo estás.
Si el texto no cumple estos requisitos, le indicaremos que no lo hemos entendido, y que nos lo repita otra vez.
*/

const INICIO = "hola";
const FINAL = "hastaluego";
const SALIR = null;
const OPCION1 = "1";

let vOpcion;
let vCadena;

while (vOpcion !== SALIR) {
    vOpcion = prompt("Bienvenido al programa que detecta tu mensaje.\nElige una opción.\n\n(1) Iniciar el programa.\n\nPara 'Salir' presiona el botón Cancelar");
        
        if (vOpcion === SALIR) {            
            break;

        } else if (vOpcion === OPCION1) {
            vCadena = prompt('Introduce tu mensaje, tiene que comenzar por hola y terminar por hasta luego');
                
                if (vCadena.startsWith(INICIO) && vCadena.endsWith(FINAL)) {
                    alert(vCadena.substring(vCadena.indexOf(INICIO) + INICIO.length, vCadena.lastIndexOf(FINAL)));
                    
                } else {
                    alert('Has introducido una opción no válida');
                }

        } else {
            alert("Has introducido una opción no válida");
        }  
  
}

alert("Programa cerrado correctamente");