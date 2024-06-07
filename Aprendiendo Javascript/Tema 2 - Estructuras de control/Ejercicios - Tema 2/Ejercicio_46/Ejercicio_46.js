/*
EJERCICIO 46

• Realizar un programa que de manera continua vaya pidiendo frases al usuario. 
• El programa deberá ir guardando todas las frases en una variable. 
• Cuando el usuario escriba la frase “FIN”, el programa terminará y mostrará por consola todo el texto que ha ido almacenando.
• La palabra “FIN” se podrá escribir de cualquier forma. Por ejemplo “Fin” o “fin”, etc.
*/

const SALIR = 'fin';

let vMensaje = '';
let vFrase;

while (vFrase !== SALIR) {
    vFrase = prompt('Introduce una frase: ');

    if (vFrase === null) {
        alert("Para salir escriba fin");

    } else if (vFrase.toLowerCase() === SALIR) {
        alert(vMensaje);
        break;
        
    } else {
        vMensaje += vFrase;
        vMensaje += '\n';
    }
}
