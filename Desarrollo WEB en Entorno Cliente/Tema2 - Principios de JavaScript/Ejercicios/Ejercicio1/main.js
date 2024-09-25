/* 1. Crear una página que pida una nota a través de un cuadro de entrada de texto (prompt) :
1. Escribir en pantalla si es mayor o igual que 5, es decir, si ha aprobado.
2. Escribir en pantalla si ha aprobado o ha suspendido. */
let entradaUsuario = prompt("Introduce una nota");

if (entradaUsuario >= 5) {
  document.write(`La nota ${entradaUsuario} es mayor o igual a 5. Aprobado`);
  console.log(`La nota ${entradaUsuario} es mayor o igual a 5. Aprobado`);
} else {
  document.write(`Está suspenso`);
}
