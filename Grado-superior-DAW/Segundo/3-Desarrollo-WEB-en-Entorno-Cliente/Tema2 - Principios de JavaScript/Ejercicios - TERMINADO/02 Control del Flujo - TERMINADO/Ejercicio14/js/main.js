/*
EJERCICIO14.

Realizar la carga del lado de un cuadrado, mostrar por pantalla el perímetro del mismo (El perímetro de un
cuadrado se calcula multiplicando el valor del lado por cuatro).
*/

function calcularPerimetro(parametro) {
  let perimetro = parametro * 4;
  return perimetro;
}

function comenzarPrograma() {
  let entradaUsuario = prompt("Introduce el lado del cuadrado: ");
  document.body.innerHTML = calcularPerimetro(entradaUsuario);
}

comenzarPrograma();
