/* 
EJERCICIO 32

Realizar un programa que imprima por consola un cuadrado de números así: (será necesario
utilizar un doble bucle),

1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5
1 2 3 4 5

*/

let check = Boolean;
let vOpcion;

while (check) {    
    vOpcion = prompt("Bienvenido al programa que te imprime por pantalla y cuadrado de 5x5.\nElige una opción.\n\n(1) Iniciar el programa.\n(Botón Cancelar) Salir.\n"); 
    if (vOpcion === null) {
        check = confirm("¿Seguro que quieres salir del programa?");
        if (check === false) {
            check = true;
        } else {
            check = false;
        }
    } else if (vOpcion === "1") {
        let linea;
        let mensaje = "";
        for (let i = 1; i <= 5; i++) {
            linea = "";
            for (let j = 1; j <= 5; j++) {
                linea += j + " ";
            }
            mensaje += linea + "\n";
            console.log(linea.trim());
        }
        alert(mensaje);
    } else if (vOpcion === "") {
        alert("ERROR - El campo no puede estar vacio, debes introducir una opción.");
    } else if (vOpcion.includes(" ")) {
        alert("Incluye un espacio");
    } else if (vOpcion !== "1" && vOpcion !== "0") {
        alert("ERROR - La opción introducida no es correcta\n\nOpción introducida = " + vOpcion);
    }    
}
alert("Programa cerrado correctamente");




/*let linea;
let mensaje = "";

for (let i = 1; i <= 5; i++) {
    linea = "";
    for (let j = 1; j <= 5; j++) {
        linea += j + " ";
    }
    mensaje += linea + "\n";
    console.log(linea.trim());
}

alert(mensaje);*/

