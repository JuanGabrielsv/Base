/* 
14. Realiza un programa que pida una hora por teclado y que muestre luego buenos días, buenas tardes o
buenas noches según la hora. Se utilizarán los tramos de 6 a 12, de 13 a 20 y de 21 a 5. respectivamente.
Sólo se tienen en cuenta las horas, los minutos no se deben introducir por teclado .
*/

let horaUsuario;

horaUsuario = Number(prompt("Introduce una hora (24h) sin los minutos: "));

switch (true) {
    case horaUsuario >= 6 && horaUsuario <= 12:
        console.log("Buenos días");
        break;
    case horaUsuario >= 13 && horaUsuario <= 20:
        console.log("Buenas tardes");
        break;
    case horaUsuario >= 21 || horaUsuario <= 5:
        console.log("Buenas noches");
        break;
    default:
        break;
}