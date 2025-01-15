/*
5. Escribir un programa que muestre por pantalla los número pares entre 0 y 100.
*/

function numerosPares(parametro) {
  let locura = "";
  for (let i = 1; i <= parametro; i++) {
    if (i % 2 == 0) {
      if (i == 1) {
        locura = String(i);
      }
      locura += " " + String(i);
    }
  }
  return locura;
}

document.body.innerHTML = numerosPares(202);

