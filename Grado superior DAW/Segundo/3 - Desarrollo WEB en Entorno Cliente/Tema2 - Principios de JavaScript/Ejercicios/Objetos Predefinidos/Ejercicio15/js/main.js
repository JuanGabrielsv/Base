/* 15. Crear un programa que pregunte al usuario si acepta o no abrir una ventana nueva. Sólo si acepta, se abrirá
la nueva ventana. La nueva ventana no tendrá barra de herramientas, ni location, ni barra de menú. Tendrá
200x80 pixeles y y se posicionará en la posición 500x500. Será resizable y tendrá scrollbars.
La nueva ventana incluirá el texto: “Entorno cliente” */
const caracteristicas = "toolbar=yes, width=200, height=200";

let eleccionUsuario = confirm("¿Quieres abrir una nueva ventana?");
let nuevaVentana;

if (eleccionUsuario === true) {
    nuevaVentana = window.open("", "Prueba", caracteristicas);
}
console.log(eleccionUsuario);


