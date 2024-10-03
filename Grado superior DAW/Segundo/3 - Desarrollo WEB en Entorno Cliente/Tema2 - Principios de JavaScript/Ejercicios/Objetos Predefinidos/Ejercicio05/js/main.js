/* 5. Crear un programa que calcule la edad de una persona. Para ello pedirá al usuario la fecha de nacimiento en
formato dd/mm/yyyy. Se da por hecho que el formato es correcto */

let entradaUsuario = prompt("Introduce la fecha de tu nacimiento dd/mm/yyyy:");
let fechaActual = new Date();
let aDiaMesAnoUsuario = entradaUsuario.split("/");
let fechaNacimientoUsuario = new Date(aDiaMesAnoUsuario[2], aDiaMesAnoUsuario[1] - 1, aDiaMesAnoUsuario[0]);
//let edadUsuario = fechaActual.toLocaleDateString() - fechaNacimientoUsuario.toLocaleDateString();
let restarFechas = (((((fechaActual - fechaNacimientoUsuario) / 1000) / 60) / 60) / 24) / 365; //Año bisiesto?

console.log(restarFechas);




