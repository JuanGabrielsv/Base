/*
EJERCICIO 63
Realiza un programa que cuente el número de veces que aparece la letra ‘a’ y el número
palabras que hay en un texto solicitado al usuario. No se pueden utilizar arrays. 
*/

let contador = 0;
let texto;

texto = prompt("Introduce un texto y te contaré cuantas 'a' tiene");

for (let i = 0; i <= texto.length; i++) {
    if (texto.substring(i, i + 1) === "a") {
        contador++;
    }
}
alert(contador);