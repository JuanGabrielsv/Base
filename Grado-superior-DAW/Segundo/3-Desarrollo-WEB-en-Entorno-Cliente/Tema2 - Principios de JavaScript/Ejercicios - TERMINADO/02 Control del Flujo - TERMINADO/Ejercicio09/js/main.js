/* 
EJERCICIO09. 
Crear una aplicación web que pida al usuario un número entero positivo.
Si no es un número o no es positivo,  volveremos a pedir al usuario el número.
La aplicación escribirá un triángulo con tantos asteriscos como indique el usuario.
Entre cada asterisco utilizar un espacio.

Ej: para el número 3

*
* *
* * *

*/

function numeroUsuario() {
  let entradaUsuario;
  do {
    try {
      entradaUsuario = prompt("Introduce un número positivo: ").trim();
    } catch (error) {
      return alert("Programa cerrado");
    }

    if (isNaN(String(entradaUsuario))) {
      alert(`La opción ${entradaUsuario} no es un número`);
    } else if (entradaUsuario <= 0) {
      alert(`El número no puede ser negativo`);
    }
  } while (isNaN(entradaUsuario) || entradaUsuario <= 0);

  return entradaUsuario;
}

function dibujar(parametro) {

    for (let i = 0; i < parametro; i++){
        for(let j = 0; j <= i; j++){
            document.body.innerHTML += `*`;
        }
        document.body.innerHTML += `<br>`;
    }
}

dibujar(numeroUsuario());
