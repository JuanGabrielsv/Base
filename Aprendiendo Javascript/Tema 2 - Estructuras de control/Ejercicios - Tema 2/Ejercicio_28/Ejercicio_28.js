/* 
EJERCICIO 28

Realizar un programa en el que solicitemos el username (login) de un usuario para registrarse.

Tendremos que validar este dato del siguiente modo:

    - Quitaremos los espacios que tenga al inicio y al final.
    - Pondremos todo en mayúsculas.
    - Si la longitud es inferior a 10 caracteres, indicaremos un error y volveremos a solicitar un nuevo username.
    - Si contiene algún espacio en blanco, indicaremos un error y volveremos a solicitar un nuevo username.
    - Si todo está correcto, mostraremos el username final tras aplicar el algoritmo y terminamos el programa.
*/

let check = Boolean;
let vPromptNombreLogin;
let vPromptOpcionMenu;

while (check) {
    vPromptOpcionMenu = prompt("Bienvenido al programa que valida un username(login) para registrarse.\nElija una opción:\n\n(1) Iniciar el programa.\n(0) Salir.\n");
    if (vPromptOpcionMenu === "0") {
        check = false;
    } else if (vPromptOpcionMenu === "1") {
        while (check) {
            vPromptNombreLogin = prompt("Introduce tu username:").trim().toUpperCase();
            if (vPromptNombreLogin.length < 10) {
                alert("ERROR E01 - El username no puede contener menos de 10 carácteres");
            } else if (vPromptNombreLogin.includes(" ")) {
                alert("ERROR E01 - El username no puede conterner espacios en blanco");
            } else {
                alert("El username es correcto y es:  " + vPromptNombreLogin);
                check = false;
            }
        }
        check = true;
    } else if (!vPromptOpcionMenu == 0 || !vPromptOpcionMenu == 1) {
        alert("ERROR E00 - La opción:  " + "''" + vPromptOpcionMenu + "''" + "  no es correcta");
    } else {
        alert("ERROR E99 - Ha ocurrido algo no controlado");
    }
}

alert("Programa cerrado correctamente");
