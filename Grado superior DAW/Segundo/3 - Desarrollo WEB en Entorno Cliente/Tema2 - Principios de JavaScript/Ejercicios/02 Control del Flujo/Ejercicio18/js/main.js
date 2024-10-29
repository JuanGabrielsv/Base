/*
EJERCICIO18.

Pedir dos números al usuario y  mostrar todos los números que se encuentran entre ellos.
*/

window.addEventListener("DOMContentLoaded", () => {
  function iniciarPrograma() {
    let numero1 = Number(prompt("Introduce el primer número: "));
    let numero2 = Number(prompt("Introduce el segundo número: "));

    mostrarNumerosEntreEllos(numero1, numero2);
  }

  function mostrarNumerosEntreEllos(parametro1, parametro2) {
    if (parametro1 > parametro2) {
      for (let i = parametro2 + 1; i < parametro1; i++) {
        document.body.innerHTML += `${i} `;
      }
    } else {
      for (let i = parametro1 + 1; i < parametro2; i++) {
        document.body.innerHTML += `${i} `;
      }
    }
  }

  iniciarPrograma();
});
