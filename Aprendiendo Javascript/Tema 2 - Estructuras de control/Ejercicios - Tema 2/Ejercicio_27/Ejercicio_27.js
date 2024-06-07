/* 
EJERCICIO 27

Realizar un programa que solicite un email. A continuación, debemos validar el formato de ese
email. Si es correcto, terminamos. Si no es correcto, volvemos a solicitarlo.

Para validar el email tendremos que revisar que:
    a) Contiene una @.
    b) Contiene un punto después de la @, pero no inmediatamente después.
    c) No puede terminar con el punto. 
*/

let check = Boolean;
let vEmailPrompt;
let vOpcionMenu;

while (check) {
    vOpcionMenu = prompt("Bienvenido al programa que te valida el email introducido.\nPor favor elige una opción:\n\n(1) Iniciar Programa.\n(0) Salir.\n");
    if (vOpcionMenu == 0) {
        check = false;
    } else if (vOpcionMenu ==1) {
        while (check) {
            vEmailPrompt = prompt("Introduce un email: ").trim().toLowerCase();
            if (!vEmailPrompt.includes("@")) {
                alert("ERROR E01 - El email debe contener una '@'");
            } else if (vEmailPrompt.includes("@.")) {
                alert("ERROR E01 - El email no puede contener un '.' inmediatamente después del @.");
            } else if (vEmailPrompt.endsWith(".")) {
                alert("ERROR E01 - El email no puede terminar en un '.'");
            } else if (!vEmailPrompt.includes(".")) {
                alert("ERROR E01 - El email debe contener un '.'");
            } 
            else {
                alert("El email introducido correctamente es:\n\n" + vEmailPrompt);
                check = false;
            }            
        }
        check = true;
    } else if (vOpcionMenu != 1 && vOpcionMenu != 0) {
        alert("ERROR E00 - Elige una opción correcta.\nOpción elegida: " + vOpcionMenu);
    } else {
        alert("ERROR E99 - Ha ocurrido algo no controlado");
    }
}
alert("Programa cerrado correctamente");


