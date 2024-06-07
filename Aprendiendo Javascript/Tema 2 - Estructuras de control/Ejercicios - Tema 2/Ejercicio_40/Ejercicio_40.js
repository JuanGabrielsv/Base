/* 
EJERCICIO 7
Mejorar el ejercicio anterior para que, en lugar de mostrar y sumar los múltiplos de 3, lo haga
con cualquier número natural que indique el usuario por teclado:

1. Solicitamos un número al usuario
2. Si está entre 1 y 10 (inclusive ambos), mostramos la suma como en el ejercicio
   anterior. Luego volvemos a pedir otro número para repetir la operación (volvemos al paso 1).
3. Si el número indicado es mayor a 10 o menor a 0, indicaremos que el número no es
   correcto, y solicitaremos otro de nuevo.
4. Si el número indicado es 0, terminaremos el programa. 
*/

const SALIR = null;

let vEntradaUsuario;
let vMensaje;
let suma;

while (vEntradaUsuario !== SALIR) {
    vMensaje = '';
    suma = 0;
    vEntradaUsuario = prompt("Introduce un número: ");
        
        if (vEntradaUsuario === '0' || vEntradaUsuario === SALIR) {
            vEntradaUsuario = SALIR;
            break;

        } else if (vEntradaUsuario > 10 || vEntradaUsuario <= 0) {
            alert("El número indicado no es correcto");

        } else {            
            for ( let i = 1; i <= 30; i++) {

                if (i % vEntradaUsuario === 0 && (i + Number(vEntradaUsuario)) > 30) {
                    suma += i;
                    vMensaje += i + ' = ';
                } else if (i % vEntradaUsuario === 0) {
                    suma += i;
                    vMensaje += i + ' + ';
                }
            }
            alert(vMensaje + suma);
        }
}
