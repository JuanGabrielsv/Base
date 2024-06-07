/*
EJERCICIO 36

Realizar un programa que muestre por consola un menú de opciones al usuario como este:

    *** MENÚ ***
    1. Abrir
    2. Guardar
    3. Modificar
    (Botón Cancelar) Salir

• Nos quedaremos esperando la opción indicada mediante un número. 
• Si elige una opción entre el 1 y el 3 escribiremos en consola que se ha elegido la
  opción que sea (Abrir, Guardar, Modificar) y volveremos a mostrar de nuevo el menú.
• Si presiona el Botón Cancelar escribiremos “Bye Bye” y el programa terminará.
• Si elige otra opción cualquiera escribiremos que esa opción de menú no es correcta.
  Y volveremos a mostrar el menú.
*/
const SALIR = null;
const ABRIR = "1";
const GUARDAR = "2";
const MODIFICAR = "3";

let vOpcion;

while (vOpcion !== SALIR) {
    vOpcion = prompt("Bienvenido al programa que tiene varias opciones.\nElige una opción.\n\n*** MENÚ ***\n1. Abrir\n2. Guardar\n3. Modificar\n(Botón Cancelar) Salir\n");

        if (vOpcion === ABRIR) {
            alert("Has elegido la opción ABRIR");
        } else if (vOpcion === GUARDAR) {
            alert("Has elegido la opción GUARDAR");            
        } else if (vOpcion === MODIFICAR) {
            alert("Has elegido la opción MODIFICAR");
        } else if (vOpcion === SALIR) {
            alert("Bye Bye");
        } else {
            alert("La opción introducida no es correcta");
        }
        
}