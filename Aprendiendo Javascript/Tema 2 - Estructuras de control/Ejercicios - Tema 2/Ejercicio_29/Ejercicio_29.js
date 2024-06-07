/* 
EJERCICIO 29

Realizar un programa que solicite un texto por teclado. 
Dividir el texto en trozos de 5 caracteres cada uno que iremos imprimiendo por consola. 
Por ejemplo, si el texto indicado es: “Buenos días, mi nombre es Blau Blau.” 
Bueno
s día
s, mi
 nomb
re es
 Blau
 Blau
. 
*/

let check = Boolean;
let vPromptOpcionMenu;
let vPromptTexto;
let vInicio;
let vFin;
let vTamanoTotal;
let vMensaje;

while (check) {
    
    vPromptOpcionMenu = prompt("Bienvenido al programa que te solicita un texto y te lo divide en trozos de 5 carácteres.\nElige una opción:\n\n(1) Iniciar Programa.\n(0) Salir.\n")

    if (vPromptOpcionMenu === "0") {
        check = false;
    } else if (vPromptOpcionMenu === "1") {
        while (check) {
            vMensaje = "";
            vInicio = 0;
            vFin = 5;
            vPromptTexto = prompt("Introduce un texto: ");
            vTamanoTotal = vPromptTexto.length;
            while (vFin <= vTamanoTotal) {
                vMensaje += vPromptTexto.substring(vInicio, vFin) + "\n";
                vInicio = vFin;
                vFin += 5;
            }
            vMensaje += vPromptTexto.substring(vInicio);
            alert(vMensaje);
            check = false;            
        }
        check = true;
    } else if (!vPromptOpcionMenu === "1" && !vPromptOpcionMenu === "0") {
        alert("ERROR E00 - La opción  " + vPromptOpcionMenu + "  no es correcta");
    } else {
        alert("E99\n ERROR - Algo ocurrió que no está controlado");
    }
}

alert("Programa cerrado correctamente");
 