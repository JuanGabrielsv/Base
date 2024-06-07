/* 
EJERCICIO 20

Realizar un programa que solicite números por consola y los vaya sumando en una cuenta acumulativa. 
Pedirá números hasta que el usuario introduzca el número 0. 
Cuando lo haga, dejará de pedir números, mostrará el total de la suma, y terminará el programa.
*/

let check = Boolean;
let suma = Number(0);

do {       
      let numero = Number(prompt("Introduce números, y (0) cuando quieras salir: "));
      if (numero === 0) {
            alert("La suma total de los números es: " + suma);
            check = false;
      } else if (!numero === typeof(Number)) {
            alert("El dato introducido tiene que ser un número... Vuelve a intentarlo");
      } else {
            suma += numero;
      }      
} while (check);

