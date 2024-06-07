/* 
EJERCICIO 54
Mejorar el ejercicio anterior para que el cuadrado sea de NxN.
Solicitar al usuario un número (tendrá que ser mayor a 0, si no lo es, volver a solicitarlo).
Dibujar el cuadrado con ese número de filas y columnas. 

*/

let linea = "";
let mensaje = "";
let check = true;
let tamano;

do {
  tamano = prompt("Introduce el tamaño que tendra el tablero");
  if (tamano < 0) {
    alert("El número tiene que ser mayor que 0");
  } else {
    for (let i = 0; i < tamano; i++) {
      linea = "";
      for (let j = 0; j < tamano; j++) {
        if (j === i) {
          linea += " * ";
        } else {
          linea += " - ";
        }
      }
      mensaje += linea + "\n";
    }
    check = false;
  }
} while (check);

console.log(mensaje);
