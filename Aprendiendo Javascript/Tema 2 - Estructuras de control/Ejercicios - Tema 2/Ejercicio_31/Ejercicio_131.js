/* 
EJERCICIO 31

Realiza un programa que solicite un número del 1 al 12 y muestre por consola a qué mes del
año corresponde. Realizar el programa utilizando una estructura SWITCH. 
*/

let check = Boolean;
let vOpcion;
let vNumMes;

while (check) {
    try {

        vOpcion = BigInt(prompt("Bienvenido al programa que te pide un número del 1 al 12 y te dice a que mes corresponde.\nElige un opción.\n\n(1) Iniciar Programa.\n(9) Salir.\n"));
        
        if (vOpcion === BigInt(9)) {
            check = confirm("¿Quieres salir del programa?");
            if (check === true) {
                check = false;
            } else {
                check = true;
            }            
        } else if (vOpcion === BigInt(1)) {            
                while (check) {
                    try {
                        vNumMes = BigInt(prompt("Introduce un número desde 1 a 12"));
                        if (vNumMes >= BigInt(1) && vNumMes <= BigInt(12)) {
                            switch (vNumMes) {
                                case BigInt(1):
                                    alert("Enero");
                                    break;
                                case BigInt(2):
                                    alert("Febrero");
                                    break;
                                case BigInt(3):
                                    alert("Marzo");
                                    break;
                                case BigInt(4):
                                    alert("Abril");
                                    break;
                                case BigInt(5):
                                    alert("Mayo");
                                    break;
                                case BigInt(6):
                                    alert("Junio");
                                    break;
                                case BigInt(7):
                                    alert("Julio");
                                    break;
                                case BigInt(8):
                                    alert("Agosto");
                                    break;
                                case BigInt(9):
                                    alert("Septiembre");
                                    break;
                                case BigInt(10):
                                    alert("Octubre");
                                    break;
                                case BigInt(11):
                                    alert("Noviembre");
                                    break;
                                case BigInt(12):
                                    alert("Diembre");
                                    break;
                            }
                            check = false;
                        } else {
                            alert("ERROR 'E01' - Los valores deben ir de 1 a 12");
                        }
                    } catch (error) {
                        alert("ERROR " + error.name + "\nHas introducido una opción no válida");
                    }                                                           
                }
                check = true;                       
        } else {
            throw SyntaxError;
        }
    } catch (err) {
        alert("ERROR " + err.name + "\nHas introducido una opción no válida");
    }
}






