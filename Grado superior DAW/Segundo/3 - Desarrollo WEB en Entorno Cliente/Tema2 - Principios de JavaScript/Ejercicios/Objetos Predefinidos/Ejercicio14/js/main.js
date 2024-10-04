/* 14. Crea un programa que genere un número aleatorio entre 10 y 20. Luego, pide al usuario que adivine el 
número. El programa deberá indicarle al usuario si su intento es demasiado alto, demasiado bajo, o si ha 
acertado. El juego continúa hasta que el usuario adivine el número correcto. Cuando lo adivine, debe 
escribir en pantalla el número adivinado junto al número de intentos utilizado. */

let vNumeroAleatorio = Math.floor(Math.random() * (20 - 10 + 1)) + 10;
let vNumeroIntentos = 0;
let vEntradaUsuario;
alert("Número aleatorio generado, intenta averiguarlo");
do {
    vEntradaUsuario = Number(prompt("Introduce un número entre 10 y 20 y adivina el número aleatorio"));
    if (vEntradaUsuario === vNumeroAleatorio) {

    } else if (vEntradaUsuario > vNumeroAleatorio) {
        alert(`Demasiado alto`);
    } else if (vEntradaUsuario < vNumeroAleatorio) {
        alert(`Demasiado bajo`);
    }
    vNumeroIntentos++;
} while (vEntradaUsuario !== vNumeroAleatorio);
alert(`Has acertado!\nNúmero de intentos: ` + vNumeroIntentos);
