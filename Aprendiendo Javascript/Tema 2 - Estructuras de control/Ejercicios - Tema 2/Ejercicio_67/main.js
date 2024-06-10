/*
EJERCICIO 67
Realizar un programa que muestre por pantalla un triangulo equilátero con asteriscos. 

    1. Solicitar al usuario el valor de N que será mayor de 0. Si no lo es, volver a solicitarlo.

Ejemplo: para un valor de 5, mostrará:
        
         *
        ***
       *****
      *******
     *********
    ***********
   *************
  ***************
 *****************
*******************
*/

let numero;
do {
    numero = parseInt(prompt("Introduce un valor mayor a 0:"));
} while (isNaN(numero) || numero <= 0);

for (let i = 1; i <= numero; i++) {
    let linea = '';

    for (let j = 0; j < numero - i; j++) {
        linea += ' ';
    }

    for (let k = 0; k < 2 * i - 1; k++) {
        linea += '*';
    }

    console.log(linea);
}