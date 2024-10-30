/* 
EJERCICIO22

Crear una aplicación web que muestre 2000 cuadrados de color aleatorio de 50 x50 píxeles. 
Su posición también será aleatoria.
*/

window.addEventListener("DOMContentLoaded", () => {
  function iniciarPrograma() {
    generar2000Cuadrados();
  }

  function randomPosicionTop() {
    return Math.floor(Math.random() * (861 - 0 + 1)) + 0;
  }

  function randomPosicionLeft() {
    return Math.floor(Math.random() * (1870 - 0 + 1)) + 0;
  }

  function randomColor() {
    return Math.floor(Math.random() * (255 - 0 + 1)) + 0;
  }

  function generar2000Cuadrados() {
    for (let i = 0; i <= 2000; i++) {
      document.body.innerHTML += `<div style="position: absolute; top: ${randomPosicionTop()}px; left: ${randomPosicionLeft()}px; width: 50px; height: 50px; background-color: rgb(${randomColor()}, ${randomColor()}, ${randomColor()});"></div>`;
    }
  }

  iniciarPrograma();
});
