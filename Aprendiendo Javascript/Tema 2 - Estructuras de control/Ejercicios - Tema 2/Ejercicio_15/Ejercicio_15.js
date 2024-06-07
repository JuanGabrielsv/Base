/* 
15. Escribe un programa en que dado un número por teclado del 1 a 7 escriba el correspondiente nombre
del día de la semana .
*/

let numeroUsuario;
let check = Boolean(true);

do {    
    numeroUsuario = Number(prompt("Introduce un número entero que vaya del 1 al 7: "));
    switch (numeroUsuario) {
        case 1:
            console.log("Es lunes");
            check = false;
            break;
        case 2:
            console.log("Es Martes");
            check = false;
            break;
        case 3:
            console.log("Es miércoles");
            check = false;
            break;
        case 4:
            console.log("Es jueves");
            check = false;
            break;
        case 5:
            console.log("Es viernes");
            check = false;
            break;
        case 6:
            console.log("Es sábado");
            check = false;
            break;
        case 7:
            console.log("Es domingo");
            check = false;
            break;
        default:
            console.log("El número no es correcto vuelva a intentarlo...");
            break;
    }    
} while (check);