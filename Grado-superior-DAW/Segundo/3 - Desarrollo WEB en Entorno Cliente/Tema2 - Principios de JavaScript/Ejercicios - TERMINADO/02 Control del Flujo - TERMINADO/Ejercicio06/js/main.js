/*
6. Escribir un programa que muestre por pantalla los número del 100 al 0.
*/

function mostrarNumeros(parametro) {
  for (let i = parametro; i >= 0; i--) {
    document.body.innerHTML += `${i} <br>`;
  }
}

mostrarNumeros(1000);
