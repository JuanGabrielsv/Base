/* 2. Crear una función flecha que escriba por pantalla el factorial de un número. El programa debe solicitar al
usuario un número mayor o igual que cero. Comprobar que el número es válido.
Ejemplo: factorial(5) devuelve 120. */
let primerNumero;

do {
    var numero = prompt("Dame un número mayor que cero");
} while (numero <= 0 || isNaN(numero));

let funcionFactorialFlecha = (numero) => {
    primerNumero = numero * (numero - 1);

    for (let i = numero - 2; i > 0; i--) {
        primerNumero *= i;
    }
    return primerNumero;
}

console.log(funcionFactorialFlecha(numero));