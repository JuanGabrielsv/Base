/* 2. Crear una página que pida un número entre 0 y 23:
1. Si no está entre esos valores, volver a preguntar el número.
2. Si es correcto:
1. Escribir por pantalla “Buenos días”  si el valor está entre 6 y 11
2. Escribir por pantalla “Buenas tardes”  si el valor está entre 12 y 20
3. Escribir por pantalla “Buenas noches”  si el valor está entre 21 y 6 */

let numeroUsuario;

do {
    numeroUsuario = Number(prompt("Introduce un número entre 0 y 23"));
    if (numeroUsuario >= 0 && numeroUsuario <= 23) {
        if (numeroUsuario >= 6 && numeroUsuario <= 11) {
            document.write(`Buenos días`);
        } else if (numeroUsuario >= 12 && numeroUsuario <= 20) {
            document.write(`Buenas tardes`);
        } else {
            document.write(`Buenas noches`);
        }
    } else {
        alert(`El numero no es correcto`);
    }
} while (numeroUsuario <= 0 && numeroUsuario >= 23);