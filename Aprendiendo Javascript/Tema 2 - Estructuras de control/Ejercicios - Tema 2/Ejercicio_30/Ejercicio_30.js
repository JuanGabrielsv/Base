/* 
EJERCICIO 30

Realiza un programa que solicite un número entero al usuario y muestre su tabla de multiplicar
completa del 0 al 10 por consola. Por ejemplo, si indicamos el número 3, el programa debería
imprimir:

3 x 0 = 0
3 x 1 = 3
3 x 2 = 6
3 x 3 = 9
3 x 4 = 12
3 x 5 = 15
3 x 6 = 18
3 x 7 = 21
3 x 8 = 24
3 x 9 = 27
3 x 10 = 30 
*/

let check = Boolean;
let vPromptOpcionMenu;
let vPromptNumero;
let vMensaje;

while (check) {
    vPromptOpcionMenu = prompt("Bienvenido al programa que te hace al tabla de multiplicar del número que introduzcas." 
        + "\nElige un opción.\n\n(1) Iniciar el programa.\n(0) Salir.\n");    
    if (vPromptOpcionMenu === "0") {
        check = false;        
    } else if (vPromptOpcionMenu === "1") {        
        while (check) {
            try {
                vMensaje = "";
                vPromptNumero = BigInt(prompt("Introduce un número entero"));
                for (let i = 0; i <= 10; i++) {
                    vMensaje += vPromptNumero + " X " + i + " = " + vPromptNumero * BigInt(i) + "\n";
                }
                alert(vMensaje);
            } catch (err) {
                if (err.name === "SyntaxError") {
                    alert(err.name + " ERROR - Debes de introducir un número entero");
                }                
            }
            check = false;
        }
        check = true;
    } else if (vPromptOpcionMenu !== "0" && vPromptOpcionMenu !== "1") {
        alert("E00\n\nERROR - La opción  '" + vPromptOpcionMenu + "' no es válida.");
    } else {
        alert("E99\n\nERROR - Ha ocurrido algo no controlado");
    }
}
alert("Programa cerrado correctamente");

