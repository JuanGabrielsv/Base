/*
7. Escribir un programa que muestre por pantalla los 50 número impares a partir de  un número dado por el usuario.
*/

function mostrar50NumerosImpares(parametro) {
  for (let i = 1; i <= 50; ) {
    if (parametro % 2 !== 0) {
      document.body.innerHTML += `${parametro} `;

      i++;
    }
    parametro++;
  }
}

function comenzarPrograma() {
  do {
    var entradaUsuario = Number(
      prompt(
        "Introduce un número que no sea 0 y te dare sus 50 siguientes impares: "
      )
    );
    if (entradaUsuario == 0 || isNaN(entradaUsuario)) {
      alert(`La opción: [${entradaUsuario}] no es válida`);
    }
  } while (isNaN(entradaUsuario) || entradaUsuario == 0);
  return entradaUsuario;
}

mostrar50NumerosImpares(comenzarPrograma());
console.log("hola");
