/*
EJERCICIO 34

• Realizar un programa que solicite el nombre y el año de nacimiento del usuario. 
• Luego imprimirá por consola esto:

“Hola [nombre], en el año 2030 tendrás [N] años.”

Donde:
    - Nombre: es el nombre indicado por el usuario
    - N: es el número de años que tendrá ese usuario en el año 2030 en base a su año de nacimiento 
*/

const SALIR = "salir";
const VACIO = "";
const OPCION_UNO = "1";
const ESPACIO = " ";
const CANCELAR = null;
const ACEPTAR = true;
const RESET = "reset";
const ANO = 2030;

let vOption;
let vOptionTwo;
let vName;
let vYear;

while (vOption !== SALIR) {
    vOption = prompt("Bienvenido al programa que te dice tu nombre y los años que tendrás en 2030... Una pasada..." 
        + "\nElige una opción.\n\n(1) Iniciar programa.\n(Botón Cancelar) Salir.\n");
    if (vOption === CANCELAR) {
        vOption = confirm("¿Seguro que quieres salir del programa?");
        if (vOption === ACEPTAR) {
            vOption = SALIR;
        }
    } else if (vOption === VACIO) {
        alert("ERROR - No has introducido nada, por favor elige una opción")
    } else if (vOption.includes(ESPACIO)) {
        alert("ERROR - Lo que has introducido contiene un espacio en blanco");
    } else if (vOption === OPCION_UNO) {
        while (vOption === OPCION_UNO) {
            vName = prompt("Introduce tu nombre");
            if (vName === CANCELAR) {
                vOptionTwo = confirm("¿Quieres abortar y salir al menú principal?");
                if (vOptionTwo === ACEPTAR) {
                    vOption = RESET;
                    break;
                }                
            } else if (vName === VACIO) {
                alert("ERROR - No puedes dejar el nombre en blanco");
            } else {
                vName = vName.trim();
                break;
            }
        }
        while (vOption === OPCION_UNO) {
            vYear = prompt("Introduce el año de tu nacimiento");
            if (vYear === CANCELAR) {
                vOptionTwo = confirm("¿Quieres abortar y salir al menú principal?");
                if (vOptionTwo === ACEPTAR) {
                    vOption = RESET;
                    break;
                }                
            } else if (vYear === VACIO) {
                alert("ERROR - No puedes dejar el nombre en blanco");
            } else {
                vYear = vYear.trim();
                break;
            }
        }
        alert("Nombre: " + vName + "\nEn 2030 tendrás " + (ANO - vYear) + " años");        
    } else {
        alert("ERROR - Has introducido una opción no válida...")
    }
}
