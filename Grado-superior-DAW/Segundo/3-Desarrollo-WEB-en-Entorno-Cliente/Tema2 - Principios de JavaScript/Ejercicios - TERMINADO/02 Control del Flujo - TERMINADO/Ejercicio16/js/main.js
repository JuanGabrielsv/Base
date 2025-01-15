/*
16.  Realizar esta figura para un número de asteriscos que se pedirá por pantalla.
        El ejemplo es para 5 asteriscos.

                        *
                    *   *
                *   *   *
            *   *   *   *
        *   *   *   *   *
*/

window.addEventListener("DOMContentLoaded", iniciarPrograma);

function iniciarPrograma() {
  let entradaUsuario = prompt("Introduce el número de asterísticos: ");

  dibujarFigura(entradaUsuario);
}

function dibujarFigura(parametro) {
  for (let fila = 0; fila < parametro; fila++) {
    for (let columnas = 0; columnas < parametro - 1 - fila; columnas++) {
      document.body.innerHTML += ` &nbsp `;
    }
    for (
      let asteriscos = parametro;
      asteriscos > parametro - fila;
      asteriscos--
    ) {
      document.body.innerHTML += `*`;
    }
    document.body.innerHTML += `* <br>`;
  }
}
