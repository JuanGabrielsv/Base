/* 7. Crear una página que pida al usuario dos valores numéricos y escriba en la página HTML la suma y la resta
de ambos de forma que muestre con string templates ( no contatenando):
1. La suma de a y b es c
2. La resta de a y b es c */

let numeroUnoUsuario = Number(prompt("Introduce el primer número:"));
let numeroDosUsuario = Number(prompt("Introduce el segundo número:"));

let suma = numeroUnoUsuario + numeroUnoUsuario;
let resta = numeroUnoUsuario - numeroDosUsuario;

document.write(`La suma de ${numeroUnoUsuario} mas ${numeroDosUsuario} es: ${suma}`);
document.write(`<br>La resta de ${numeroUnoUsuario} menos ${numeroDosUsuario} es: ${resta}`);
