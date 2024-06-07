/* 
EJERCICIO 39
Realizar un programa que muestre esta serie de números y la sume:

3 + 6 + 9 + 12 + 15 + 18 + 21 + 24 + 27 + 30 = 165
*/

let vMensaje = '';
let suma = 0;

for ( let i = 1; i <= 30; i++) {

        if (i === 30) {
            suma += i;
            vMensaje += i + ' = ' + suma;

        } else if (i % 3 === 0) {
            vMensaje += i + " + ";
            suma += i;
        }
        
}

alert(vMensaje);
