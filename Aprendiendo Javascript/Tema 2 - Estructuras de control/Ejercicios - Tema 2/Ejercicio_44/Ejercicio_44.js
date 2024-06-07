/* 
EJERCICIO 44
Realizar un programa que solicite dos números enteros al usuario. Luego mostrar el siguiente
menú:

*** MENÚ ***
1. Sumar
2. Restar
3. Multiplicar
4. Dividir
0. Salir

Hacer con los dos números la operación elegida (el usuario indicará 1, 2, 3 o 4) y mostrar el
resultado. Luego volver a mostrar el menú. Si el usuario escoge la opción 0 (Salir), el programa
termina.
OJO: Si el segundo número es un cero, no se podrán dividir. En ese caso, si elige la opción 4,
tendremos que indicar que la división no es posible.
*/

const EXIT = null;
const SUMAR = '1';
const RESTAR = '2';
const MULTIPLICAR = '3';
const DIVIDIR = '4';
const SALIR = '0';

let vOpcion;
let num1;
let num2;


while (vOpcion !== SALIR) {

    num1 = Number(prompt('Introduce el primer número:'));
    num2 = Number(prompt('Introduce el segundo número:'));

    if (num1 === SALIR || num2 === SALIR) {        
        vOpcion = SALIR;

    } else { 
        while (vOpcion !== SALIR) {
            vOpcion = prompt('*** MENÚ ***\n1. Sumar\n2. Restar\n3. Multiplicar\n4. Dividir\n0. Salir\n\n');

        if (vOpcion === SALIR) {
            vOpcion = SALIR;
            break;
        } else if (vOpcion === SUMAR) {            
            alert(num1 + num2);
        } else if (vOpcion === RESTAR) {
            alert(num1 - num2);
        } else if (vOpcion === MULTIPLICAR) {
            alert(num1 * num2);
        } else if (vOpcion === DIVIDIR) {
            if (num2 === 0) {
                alert('No se puede dividir entre 0');
            } else {
                alert(num1 / num2);
            }
        } else {
            alert('Opción incorrecta');
        }
        }        

    }

}