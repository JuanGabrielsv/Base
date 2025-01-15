/* 11. Solicita al usuario su nombre y muestra con un mensaje alert ‘Buenos días Nombre’, Buenas tardes
Nombre’ o ‘Buenas noches Nombre’ dependiendo de la hora: (7 - 12 – 20 h) */

let entradaUsuario = prompt("Introduce tu nombre");
let hora = new Date().toLocaleTimeString();

if (hora >= "07:00:00" && hora < "12:00:00") {
    document.write("Buenas días " + entradaUsuario);
} else if (hora >= "12:00:00" && hora < "20:00:00") {
    document.write("Buenas tardes " + entradaUsuario);
} else {
    document.write("Buenas noches " + entradaUsuario);
}