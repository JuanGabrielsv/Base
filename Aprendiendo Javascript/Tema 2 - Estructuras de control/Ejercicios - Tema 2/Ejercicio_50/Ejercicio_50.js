/* 
EJERCICIO 50

Realizar un programa que solicite un número N al usuario. 
N tiene que ser mayor a 2. Si no, volver a solicitarlo.
A continuación, mostrar los primeros N números de la serie de Fibonacci. 

Esta serie se calcula sumando los dos últimos números. 
Por ejemplo, los 13 primeros números de Fibonacci son:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 
*/

let check = true;
let vNumero;
let vNumeroAnterior = Number(0);
let vUltimoNumero = Number(1);
let vNuevoValor = Number();
let vMensaje = String();


while (check) {

    console.log('Introduce un número mayor que 2');
    vNumero = prompt();

    if (vNumero === null) {
        check = false;

    } else if (vNumero <= 2) {
        console.error('El número tiene que ser mayor que 2');

    } else {
        vMensaje = vNumeroAnterior + ", " + vUltimoNumero;
        for (let i = 2; i < vNumero; i++) {
            vNuevoValor = vNumeroAnterior + vUltimoNumero;
            vNumeroAnterior = vUltimoNumero;
            vUltimoNumero = vNuevoValor;
            vMensaje += ', ' + vUltimoNumero;            
        }
        console.log(vMensaje);
        break;
    }   

}