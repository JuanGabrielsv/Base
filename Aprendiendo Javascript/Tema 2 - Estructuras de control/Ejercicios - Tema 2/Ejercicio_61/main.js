/*
EJERCICIO 61
Realizar un programa que muestre por consola este triángulo de números:

123456789
12345678
1234567
123456
12345
1234
123
12
1
 
*/

let mensaje = "";
let linea = "";

for (let i = 1; i < 10; i++) {
    linea = "";
    for (let j = 1; j < 10 - i; j++) {
        linea += j;
    }
    mensaje += linea + "\n";
}
console.log(mensaje);