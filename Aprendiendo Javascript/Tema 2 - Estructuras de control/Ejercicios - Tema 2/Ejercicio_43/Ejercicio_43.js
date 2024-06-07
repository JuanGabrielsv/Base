/* 
EJERCICIO 43
Solicitar al usuario una dirección web que tendrá este formato:
PROTOCOLO://PARTE1.PARTE2.PARTE3
Por ejemplo:

http://www.google.com
Debemos dividir esa dirección e imprimirla por consola de este modo:
http://
www
google
com

Otro ejemplo:
https://w3w.blasblau.es
Debemos imprimir:
https://
w3w
blasblau
es 
*/

const PROTOCOLO = 'http://'
const PROTOCOLO_SEGURO = 'https://'


let vDireccion;

vDireccion = prompt("Introduce la dirección:");

alert(vDireccion.split('.').length);

if (vDireccion.startsWith(PROTOCOLO_SEGURO) && vDireccion.split('.').length === 3) {    
    alert(PROTOCOLO_SEGURO + '\n'
        + vDireccion.substring(PROTOCOLO_SEGURO.length, vDireccion.indexOf('.')) + '\n'
        + vDireccion.substring(vDireccion.indexOf('.') + 1, vDireccion.lastIndexOf('.')) + '\n'
        + vDireccion.substring(vDireccion.lastIndexOf('.') + 1));
} else if (vDireccion.startsWith(PROTOCOLO) && vDireccion.split('.').length === 3) {
    alert(PROTOCOLO + '\n'
        + vDireccion.substring(PROTOCOLO.length, vDireccion.indexOf('.')) + '\n'
        + vDireccion.substring(vDireccion.indexOf('.') + 1, vDireccion.lastIndexOf('.')) + '\n'
        + vDireccion.substring(vDireccion.lastIndexOf('.') + 1));
} else {
    alert('Has introducido datos incorrectos');
}