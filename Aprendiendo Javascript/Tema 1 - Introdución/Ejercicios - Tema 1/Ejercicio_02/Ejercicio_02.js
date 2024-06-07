/* 
EJERCICIO 2

Realizar un programa que trabaje del siguiente modo:

    1. Mostrar un mensaje pidiendo el nombre del usuario.
    2. Esperar a que el usuario escriba su nombre.
    3. Mostrar un nuevo mensaje indicando: “Bienvenido (nombre)”.
    4. Mostrar un nuevo mensaje indicando: “¿De dónde eres?”.
    5. Esperar a que el usuario escriba el lugar de donde vive.
    6. Mostrar un mensaje preguntando: “¿Qué tal se vive en (localidad)?”.
    7. Esperar a que el usuario escriba una respuesta.
    8. Mostrar un último mensaje indicando “Gracias. Un saludo” .
*/

// 1. Mostrar un mensaje pidiendo el nombre del usuario.
// 2. Esperar a que el usuario escriba su nombre.
let nombreUsuario = prompt("Introduce tu nombre: ");

// 3. Mostrar un nuevo mensaje indicando: “Bienvenido (nombre)”.
console.log("Bienvenido " + nombreUsuario);

// 4. Mostrar un nuevo mensaje indicando: “¿De dónde eres?”.
// 5. Esperar a que el usuario escriba el lugar de donde vive.
let lugarUsuario = prompt("¿De dónde eres?: ");

// 6. Mostrar un mensaje preguntando: “¿Qué tal se vive en (localidad)?”.
// 7. Esperar a que el usuario escriba una respuesta.
let comoSeViveUsuario = prompt("¿Qué tal se vive en " + lugarUsuario + "?");

// 8. Mostrar un último mensaje indicando “Gracias. Un saludo”.
console.log(comoSeViveUsuario + " Gracias. Un saludo");

