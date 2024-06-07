/* 
EJERCICIO 33

Realizar un programa que imprima por consola un triángulo de números así: (será necesario
utilizar un doble bucle).

1
1 2
1 2 3
1 2 3 4
1 2 3 4 5
1 2 3 4 5 6
1 2 3 4 5 6 7
1 2 3 4 5 6 7 8
1 2 3 4 5 6 7 8 9

*/



let vMensaje = "";
let vLinea;
let check = Boolean;
let vOpcion;

while (check) {
    vOpcion = prompt("Bienvenido al programa que te imprime medio triángulo usando número del 1 al 9.\nElige una opción.\n\n(1) Iniciar el programa.\n(Botón Canecelar) Salir.\n");
    if (vOpcion === "1") {
        vMensaje = "";
        for (let i = 1; i <= 9; i++) {
            vLinea = "";
            for (let j = 1; j <= i; j++) {
                vLinea += j + " "
            }
            console.log(vLinea + "\n");
            vMensaje += vLinea + "\n";
        }
        alert(vMensaje);
    } else if (vOpcion === null) {
        check = confirm("¿Seguro que quieres salir del programa?");
        if (check === false) {
            check = true;
        } else {
            check = false;
        }
    } else if (vOpcion === "") {
        alert("ERROR - Debes introducir un valor");
    } else if (vOpcion.includes(" ")) {
        alert("ERROR - Has introducido un espacio en blanco");
    } else {
        alert("ERROR - Lo que has introducido no se corresponde a nada")
    }
}

alert("Programa cerrado correctamente");



