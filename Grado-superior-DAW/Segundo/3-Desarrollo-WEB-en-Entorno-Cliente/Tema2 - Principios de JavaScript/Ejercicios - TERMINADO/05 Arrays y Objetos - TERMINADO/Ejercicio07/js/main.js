/* 7. Hacer un programa que pida por pantalla al usuario una palabra. Seguir pidiéndola si se introduce vacía.
Mostrar la palabra original y la invertida.
Ejemplo: La palabra hello invertida es olleh */

let entradaUsuario;

do {
    entradaUsuario = prompt("Introduce una palabra: ");
    if (entradaUsuario == null) {
        alert("Saliendo del programa");
        break;
    } else if (entradaUsuario == "") {
        alert("El campo no puede estar vacio");
    } else {
        var aPalabraUsuario = entradaUsuario.split("");
        var aPalabraInvertida = aPalabraUsuario.reverse();
    }
    console.log(aPalabraInvertida.join(""));
} while (entradaUsuario == null || entradaUsuario == "");