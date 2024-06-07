/* 
EJERCICIO 22

Realizar un programa que muestre por consola 5 veces tu nombre utilizando un bucle. Además
de tu nombre, deberá aparecer el número de línea que se ha impreso. Es decir, la salida
tendría que ser algo así:

Mi nombre es Abel. Línea 1
Mi nombre es Abel. Línea 2
Mi nombre es Abel. Línea 3
Mi nombre es Abel. Línea 4
Mi nombre es Abel. Línea 5
*/

let check = Boolean;

do {
      let opcionPrincipal = prompt("Bienvenid@ al programa, elije una opción.\n\n(1) Imprimir las líneas.\n(0) Salir\n");
      if (opcionPrincipal == 1) {
            let lineas = String("");
            for (let i = 1; i <= 5; i++) {
                  lineas += "Mi nombre es Juan Gabriel. Línea " + i + "\n";
            }
            alert(lineas);
      } else if (opcionPrincipal == 0) {
            check = false;
      } else {
            alert("ERROR\nOpción introducida: " + opcionPrincipal + "\nNo existe ninguna opción, repite de nuevo");
      }    
} while (check);
alert("Programa cerrado");

