/* 
12. Dado un número positivo introducido por teclado, escribir por pantalla tantos asteriscos como tamaño del número.
*/

let numeroUsuario;
let asteriscos = String("");

do {
    numeroUsuario = BigInt(prompt("Introduce un número entero y positivo: "));
    if (numeroUsuario > 0) {
        for (let i = 1; i <= numeroUsuario ; i++) {    
            asteriscos += "*";
        }
        console.log(asteriscos);
        break;
    } else {
        console.log("El número tiene que ser positivo");
    }
} while (true);
    
    
