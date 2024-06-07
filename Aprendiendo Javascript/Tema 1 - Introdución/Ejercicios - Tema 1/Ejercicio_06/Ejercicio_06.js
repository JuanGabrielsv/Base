/* 
EJERCICIO 6

Realizar un programa que calcule el IVA de un artículo. Para ello:

      1. Solicita por consola al usuario cuál es el precio sin IVA del artículo (puede llevar
         decimales).
      2. Recoge el dato y calcula el IVA (21%).
      3. Muestra como resultado en la consola el IVA calculado y el precio final (la suma del
         precio sin IVA más el IVA). 
*/

/* 1. Solicita por consola al usuario cuál es el precio sin IVA del artículo (puede llevar
      decimales). */
let precioSinIva = prompt("Introduce el precio sin iva: ");

/* 2. Recoge el dato y calcula el IVA (21%). */
let precioConIva = precioSinIva * 1.21;

/* 3. Muestra como resultado en la consola el IVA calculado y el precio final (la suma del
      precio sin IVA más el IVA). */
console.log("El precio con el 21% de iva es: " + precioConIva);







