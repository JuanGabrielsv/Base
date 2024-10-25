/*
8. Crear una página que pida al usuario un número a través de un cuadro de lectura. 
Mostrar con una ventana alert si el valor introducido es un número o no.
*/

function comenzarPrograma() {
  let entradaUsuario;

  entradaUsuario = prompt("Introduce un número: ").trim();

  if (isNaN(entradaUsuario)) {
    alert("no es un número");
  } else {
    alert("Es un número");
  }
}

comenzarPrograma();
