/* 
EJERCICIO 45
Realizar un programa que imprima un tablero de ajedrez de N x N casillas. 
Para ello, le pediremos al usuario un número mayor que cero.
Luego imprimiremos por consola el tablero como se muestra en los siguientes ejemplos:

Tablero de 4x4:
 ___________
|__|__|__|__|
|__|__|__|__|
|__|__|__|__|
|__|__|__|__|

Tablero de 7x7:
 ____________________
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|

Tablero de 1x1:
 __
|__|
*/

let vNumeroDeCasillas;
let vMensaje = '';
let vLinea = '';

try {
    vNumeroDeCasillas = BigInt(prompt('Introduce un número entero mayor que 0'));

    for (let i = 0; i < vNumeroDeCasillas; i++) {
        if (i == 0) {
            vLinea += ' __'
        } else {
            vLinea += '___'
        }       
    }
    vLinea += "\n";
    vMensaje = vLinea;

    for (let fila = 0; fila < vNumeroDeCasillas; fila++) {
        for(let j = 0; j < vNumeroDeCasillas; j++) {
            vMensaje += '|__';
        }
        vMensaje += '|\n'        
    }

    console.log(vMensaje);
    
} catch (error) {
    alert('Debes introducir un número entero y mayor que cero \n' + error.message);
}


