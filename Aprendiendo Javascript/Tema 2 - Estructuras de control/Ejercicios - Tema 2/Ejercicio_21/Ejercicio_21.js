/* 
EJERCICIO 21

Realizar un programa que muestre la suma de todos los números del 1 al 10000.
Es decir: 1 + 2 + 3 + 4 + 5 + … + 9999 + 10000.
*/

let check = Boolean;
let opcionPrincipal;

do {
      opcionPrincipal = prompt("Bienvenido al programa que te imprime la suma del 1 al 10000.\nPor favor"+
                                    "introduce una opción.\n\n(1) Imprimir la suma.\n(0) Salir.\n");      
      if (opcionPrincipal === "1") {
            let suma = 0;
            for (let i = 1; i <= 10000; i++) {
                  suma += i;                  
            }
            alert("La suma de todos los números del 1 al 10000 es: " + suma);
            check = false;
      } else if (opcionPrincipal === "0") {
            check = false;            
      } 
      else {
            alert("La opción elegida no existe... Repite de nuevo");
      }      
} while (check);



