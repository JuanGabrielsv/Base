/* 
EJERCICIO 26

Realizar un programa que solicite dos cadenas al usuario por separado. Si alguna de las dos es
vacía o sólo tiene espacios en blanco, volver a pedirla indefinidamente. Cuando tengamos las
dos cadenas, escribirlas por consola en orden alfabético.
*/

let check = Boolean;
let vCadena1;
let vCadena2;
let vPalabra1;
let vPalabra2;
let opcionMenuPrincipal;

do {
    opcionMenuPrincipal = prompt("Bienvenido al programa que te ordena dos cadenas por orden alfabético.\nIntroduce una opción:\n\n(1) Iniciar Programa.\n(0) Salir\n");
    if (opcionMenuPrincipal == 0) {
        check = false;
    } else if (opcionMenuPrincipal == 1) {
        while (check) {
            vCadena1 = prompt("Introduce la primera cadena");            
            if (vCadena1 == "") {
                alert("La cadena no puede estar vacia");
            } else if(vCadena1 == 0) {
                alert("La cadena no puede contener sólo espacios en blanco");
            } else {
                vPalabra1 = vCadena1.trim();
                check = false;
            }            
        }
        check = true;
        while (check) {
            vCadena2 = prompt("Introduce la segunda cadena");            
            if (vCadena2 == "") {
                alert("La cadena no puede estar vacia");
            } else if(vCadena2 == 0) {
                alert("La cadena no puede contener sólo espacios en blanco");
            } else {
                vPalabra2 = vCadena2.trim();
                check = false;
            }
        }        
        if (vPalabra1 > vPalabra2) {
            alert(vPalabra2 + "\n" + vPalabra1);            
        } else if (vPalabra2 > vPalabra1) {
            alert(vPalabra1 + "\n" + vPalabra2);
        } else {
            alert("son iguales");
        }
        check = true;

    } else if (opcionMenuPrincipal != 1 && opcionMenuPrincipal != 0) {
        alert("ERROR - Lo que has introducido no se corresponde con ninguna opción del menú.\n\nOpción introducida: " + opcionMenuPrincipal);
    } else {
        alert("ERROR - Ha pasado algo que no está controlado.")
    }
} while (check);

alert("Programa cerrado correctamente");