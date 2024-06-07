/*
EJERCICIO 57

• Realiza un programa que solicite un número mayor a 0 al usuario. 
• Si no es así, volver a solicitarlo.
• Calcular la suma de todos los números impares que hay entre 1 y el número indicado. 
*/

let check = true;
let numero;
let suma = 0;

do {
  console.log("Introduce un número mayor que 0");
  numero = prompt();
  if (numero <= 0) {
    console.error("El número introducido tiene que ser mayor que 0");
  } else {
    for (let i = 0; i < numero; i++) {
      if (i % 2 !== 0) {        
        suma += i;
      }
    }
    check = false;
    console.log(suma);    
  }
} while (check);
