/*
EJERCICIO 35

• Realizar un programa que solicite tres nombres de ciudades al usuario. 
• Imprimir por consola esos nombres ordenados según la longitud de cada nombre de menor a mayor.
*/

const ACEPTAR = true;
const CANCELAR = false;
const SALIR = null;
const INICIAR_PROGRAMA = "1";
const ESTA_VACIO = "";
const SOLO_ESPACIOS_VACIO = 0;
const RESET = "R";

let vOption;
let vCityName1;
let vCityName2;
let vCityName3;

while (vOption !== SALIR) {
    
    vOption = prompt("Bienvenido el programa que te solicita 3 nombres de ciudades y las ordena por longitud de menor a mayor.\n" 
        + "Elige una opción.\n\n(1) Iniciar el programa.\n(Botón Cancelar) Salir.\n");
    
        if (vOption === INICIAR_PROGRAMA) {
            while (vOption === INICIAR_PROGRAMA) {
                vCityName1 = prompt("Introduce el nombre de la primera ciudad: ");

                    if (vCityName1 === ESTA_VACIO) {
                        alert("ERROR - El campo no puede estar vacio");
                    } else if (vCityName1 == SOLO_ESPACIOS_VACIO) {
                        alert("El campo no puede contener sólo espacio vacios");
                    } else if (vCityName1 === SALIR) {
                        vOption = confirm("¿Quieres cancelar y volver al menú principal?");
                            if (vOption === ACEPTAR) {
                                vOption = RESET;
                                break;
                            }                        
                    } 
                    else {
                        vCityName1 = vCityName1.trim();
                        break;
                    }
            }
            while (vOption === INICIAR_PROGRAMA) {
                vCityName2 = prompt("Introduce el nombre de la segunda ciudad: ");

                    if (vCityName2 === ESTA_VACIO) {
                        alert("ERROR - El campo no puede estar vacio");
                    } else if (vCityName2 == SOLO_ESPACIOS_VACIO) {
                        alert("El campo no puede contener sólo espacio vacios");
                    } else if (vCityName2 === SALIR) {
                        vOption = confirm("¿Quieres cancelar y volver al menú principal?");
                            if (vOption === ACEPTAR) {
                                vOption = RESET;
                                break;
                            }                        
                    } 
                    else {
                        vCityName2 = vCityName2.trim();
                        break;
                    }
            }
            while (vOption === INICIAR_PROGRAMA) {
                vCityName3 = prompt("Introduce el nombre de la tercera ciudad: ");

                    if (vCityName3 === ESTA_VACIO) {
                        alert("ERROR - El campo no puede estar vacio");
                    } else if (vCityName3 == SOLO_ESPACIOS_VACIO) {
                        alert("El campo no puede contener sólo espacio vacios");
                    } else if (vCityName3 === SALIR) {
                        vOption = confirm("¿Quieres cancelar y volver al menú principal?");
                            if (vOption === ACEPTAR) {
                                vOption = RESET;
                                break;
                            }                        
                    } 
                    else {
                        vCityName3 = vCityName3.trim();
                        break;
                    }
            }
                if (vCityName1.length <= vCityName2.length && vCityName2.length <= vCityName3.length) {
                    alert(vCityName1 + "\n" + vCityName2 + "\n" + vCityName3);
                } else if (vCityName1.length <= vCityName3.length && vCityName3.length <= vCityName2.length) {
                    alert(vCityName1 + "\n" + vCityName3 + "\n" + vCityName2);
                } else if (vCityName2.length <= vCityName1.length && vCityName1.length <= vCityName3.length) {
                    alert(vCityName2 + "\n" + vCityName1 + "\n" + vCityName3);
                } else if (vCityName2.length <= vCityName3.length && vCityName3.length <= vCityName1.length) {
                    alert(vCityName2 + "\n" + vCityName3 + "\n" + vCityName1);
                } else if (vCityName3.length <= vCityName1.length && vCityName1.length <= vCityName2.length) {
                    alert(vCityName3 + "\n" + vCityName1 + "\n" + vCityName2);
                } else if (vCityName3.length <= vCityName2.length && vCityName2.length <= vCityName1.length) {
                    alert(vCityName3 + "\n" + vCityName2 + "\n" + vCityName1);
                }

        } else if (vOption === SALIR) {
            vOption = confirm("¿Seguro que quieres salir del programa?");
            if (vOption === ACEPTAR) {
                break;
            }            
        } else if (vOption !== INICIAR_PROGRAMA) {
            alert("ERROR - Has introducido una opción no válida, por favor elige una opción");
        } else {
            alert("ERROR - Algo no controlado ha ocurrido");
        }
}
