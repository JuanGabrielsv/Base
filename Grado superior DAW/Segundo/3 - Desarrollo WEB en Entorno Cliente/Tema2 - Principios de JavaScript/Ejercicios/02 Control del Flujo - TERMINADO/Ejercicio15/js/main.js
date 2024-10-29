/*
EJERCICIO15

• Pedir la base y la altura y mostrar una figura con asteriscos en los lados de un rectángulo.
    
    Eje: base 6 y altura 3

    * * * * * *
    *         *
    * * * * * *
*/

function comenzarPrograma() {
  let base = prompt("Introduce la base: ");
  let altura = prompt("Introduce la altura: ");

  dibujarFigura(base, altura);
}

function dibujarFigura(base, altura) {
  for (let fila = 0; fila < altura; fila++) {
    if (fila == 0 || fila == altura - 1) {
      for (let columna = 0; columna < base; columna++) {
        document.body.innerHTML += `*`;
      }
    } else {        
        for (let columna = 0; columna < base; columna++) {
          if (columna == 0 || columna == base - 1) {
            document.body.innerHTML += `*`;
          } else {
            document.body.innerHTML += ` &nbsp`;
          }
        }
      }
      document.body.innerHTML += `<br>`;    
  }
}

comenzarPrograma();
