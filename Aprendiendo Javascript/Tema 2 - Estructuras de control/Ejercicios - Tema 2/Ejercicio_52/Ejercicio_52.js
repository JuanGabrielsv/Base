/* 
EJERCICIO 52

Realizar un programa que sea un conversor de euros a peseta y viceversa. 

El programa funcionará del siguiente modo:
1. Mostrará este menú:
    1 - Pasar de Pesetas a Euros
    2 - Pasar de Euros a Pesetas
    3 - Salir

2. Si selecciona la opción 1 o 2, se solicitará la cantidad, se hará la conversión, se
mostrará el resultado y después se volverá a mostrar el menú del punto 1. Así
continuamente
3. Cuando se selecciona la opción 3, el programa termina.
*/

import {
  mostrarMenu,
  opcionElegida,
  pedirCantidad,
  pasarAPesetas,
  pasarAEuros,
} from "./funciones.js";

const SALIR = 3;

let opcionMenu;

do {
  mostrarMenu();
  opcionMenu = opcionElegida();
  switch (opcionMenu) {
    case 1:
      console.log(pasarAPesetas(pedirCantidad()));
      break;
    case 2:
      console.log(pasarAEuros(pedirCantidad()));
      break;
    case 3:
      break;
    default:
      break;
  }
} while (opcionMenu !== SALIR);

console.log("Programa cerrado correctamente");
