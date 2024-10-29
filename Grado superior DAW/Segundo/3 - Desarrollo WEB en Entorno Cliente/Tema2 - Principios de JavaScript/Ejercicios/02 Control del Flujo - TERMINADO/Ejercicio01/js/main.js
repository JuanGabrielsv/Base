/*1. Crear una página que pida una nota a través de un cuadro de entrada de texto (prompt) :
1. Escribir en pantalla si es mayor o igual que 5, es decir, si ha aprobado.
2. Escribir en pantalla si ha aprobado o ha suspendido. */

let notaUsuario = Number(prompt("Introduce una nota:"));

//1. Escribir en pantalla si es mayor o igual que 5, es decir, si ha aprobado.
if (notaUsuario >= 5) {
    document.write(`Es aprobado`);
} else {
    document.write(`Esta suspenso`);
}