/* 
EJERCICIO 1

Realizar un programa que haga lo siguiente:

    1. Mostrar un mensaje pidiendo el nombre del usuario.
    2. Esperar a que el usuario escriba su nombre y registrarlo en una variable.
    3. Mostrar un nuevo mensaje pidiendo el apellido del usuario.
    4. Esperar a que el usuario escriba su apellido y registrarlo en otra variable.
    5. Mostrar un mensaje final indicando: "Su nombre completo es ... (nombre y apellido)" .
*/

// 1. Mostrar un mensaje pidiendo el nombre del usuario.
// 2. Esperar a que el usuario escriba su nombre y registrarlo en una variable.
let entradaUsuario = prompt("Introduce tu nombre: ");

// 3. Mostrar un nuevo mensaje pidiendo el apellido del usuario.
// 4. Esperar a que el usuario escriba su apellido y registrarlo en otra variable.
let apellidos = prompt("Introduce tus Apellidos: ");

// 5. Mostrar un mensaje final indicando: "Su nombre completo es ... (nombre y apellido)".
console.log(entradaUsuario + ' ' + apellidos);


