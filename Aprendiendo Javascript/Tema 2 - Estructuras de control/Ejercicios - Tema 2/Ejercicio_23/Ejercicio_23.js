/* 
EJERCICIO 23

Realizar un programa que solicite dos números al usuario. Si los números son iguales, terminar
el programa con un saludo. Si no son iguales, volver a pedirlos hasta que lo sean.
*/

let check = Boolean;
let num1;
let num2;

do {
      let opcionPrincipal = prompt("Bienvenido al programa que te dice si dos números son iguales\nElige una opción:\n\n(1) Empezar el programa\n(0) Salir\n");
      if (opcionPrincipal == 1) {
            while (check) {
                  while(check) {
                        num1 = Number(prompt("Introduce el PRIMER número: "));
                        if (isNaN(num1)) {
                              alert("ERROR - El valor introducido tiene que ser un número.\nVuelve a introducir el PRIMER número: ");
                        } else if (num1 === 0) {
                              alert("ERROR - No has introducido nada, vuelve a introducir el PRIMER número");
                        } else {
                              check = false;
                        }                        
                  }
                  check = true;
                  while (check) {
                        num2 = Number(prompt("Introduce el SEGUNDO número: "));
                        if (isNaN(num2)) {
                              alert("ERROR - El valor introducido tiene que ser un número.\nVuelve a introducir el SEGUNDO número: ");
                        } else if (num2 === 0) {
                              alert("ERROR - No has introducido nada, vuelve a introducir el SEGUNDO número");
                        } else {
                              check = false;
                        }  
                  }
                  check = true;
                  if (num1 === num2) {
                        alert("Los números son iguales");
                        check = false;
                  } else {
                        alert("Los números no son iguales");
                  }
            }
      } else if (opcionPrincipal == 0) {
            check = false;
      }
} while (check);
alert("Aplicación cerrada correctamente");

