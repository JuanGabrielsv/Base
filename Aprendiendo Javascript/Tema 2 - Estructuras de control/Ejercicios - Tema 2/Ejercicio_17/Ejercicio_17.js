/* 
EJERCICIO 17
Realizar un programa que pregunte por el año de nacimiento del usuario. Según lo que nos
indique, mostrarle por consola a qué generación pertenece según este cuadro:
Por ejemplo, los nacidos en 1994 serían generación Y o milennials. 
*/

let entradaUsuario;
let check = Boolean(true);
do {
    entradaUsuario = Number(prompt("Introduce tu año de nacimiento: "));
    switch (entradaUsuario > 0) {
        case entradaUsuario <= 1900 && entradaUsuario >= 1883:
            console.log("Generación perdida");
            check = false;
            break;
        case entradaUsuario >= 1901 && entradaUsuario <= 1927:
            console.log("Generación grandiosa");
            check = false;
            break;
        case entradaUsuario >= 1928 && entradaUsuario <= 1945:
            console.log("Generación silenciosa");
            check = false;
            break;
        case entradaUsuario >= 1946 && entradaUsuario <= 1964:
            console.log("Generación boomers");
            check = false;
            break;
        case entradaUsuario >= 1965 && entradaUsuario <= 1980:
            console.log("Generación X");
            check = false;
            break;
        case entradaUsuario >= 1981 && entradaUsuario <= 1996:
            console.log("Generación Y");
            check = false;
            break;
        case entradaUsuario >= 1997 && entradaUsuario <= 2012:
            console.log("Generación Zoomers - Generación Z");
            check = false;
            break;
        case entradaUsuario >= 2013:
            console.log("Generación Alfa");    
            check = false;
            break;
        default:
            console.log("Algo ha pasado mal, vuelve a intentarlo...");
            break;
    }
    
} while (check);
