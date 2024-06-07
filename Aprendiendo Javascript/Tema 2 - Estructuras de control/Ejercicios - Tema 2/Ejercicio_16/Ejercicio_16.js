/* 
16. Escribe un programa que lea 5 números y determine cuántos son positivos, y cuántos son negativos.
*/
let check = Boolean(true);
let contador = 1;
let positivos = "Son positivos: ";
let negativos = "Son negativos: ";
do {    
    let entradaUsuario = Number(prompt(contador + " de 5 Introduce un número: "));
    if (entradaUsuario === 0) {
        console.log("El número no puede ser 0");
    } else if (entradaUsuario > 0) {
        positivos += String(entradaUsuario + " - ");
        contador++;
    } else {
        negativos += String(entradaUsuario + " - ");
        contador++;
    }
} while (contador <= 5);
console.log(positivos);
console.log(negativos);