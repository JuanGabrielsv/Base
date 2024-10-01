/*6. Crear una página que pida al usuario por pantalla su nombre y su correo electrónico. Mostrar los datos en la
página HTML de forma que el nombre lo pinte con <h1> y el correo con <h2>*/

let nombreUsuario = prompt("Introduce tu nombre:");
let correoUsuario = prompt("Introduce tu correo electrónico:");

document.write(`<h1>${nombreUsuario}</h1>`);
document.write("<h2>" + correoUsuario + "</h2");