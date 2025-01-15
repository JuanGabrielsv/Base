/*9. Crear una página que pida al usuario un número y escriba por pantalla el número de cifras que tiene el
número. Escribir el resultado con string template en una etiqueta <div> en cursiva y color azul*/

let numeroUsuario = prompt("Introduce un número");

document.write(
  `<div style="font-style: italic; cursive; color: blue;">El número ${numeroUsuario} tiene ${numeroUsuario.length} cifras</div>`
);
