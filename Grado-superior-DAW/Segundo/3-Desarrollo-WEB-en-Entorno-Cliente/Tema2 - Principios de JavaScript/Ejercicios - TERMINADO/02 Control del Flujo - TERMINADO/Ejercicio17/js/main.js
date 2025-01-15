/*
17. Solicitar un número del 1 al 10 y mostrar la tabla de multiplicar de dicho número.
*/

window.addEventListener("DOMContentLoaded", () => {
  function iniciarPrograma() {
    let entradaUsuario = prompt("Introduce un número entre el 1 y el 10: ");

    getTablaMultiplicar(entradaUsuario);
  }

  function getTablaMultiplicar(parametro) {
    for (let i = 1; i <= 10; i++) {
      document.body.innerHTML += `${parametro} X ${i} = ${i * parametro}<br>`;
    }
  }

  iniciarPrograma();
});
