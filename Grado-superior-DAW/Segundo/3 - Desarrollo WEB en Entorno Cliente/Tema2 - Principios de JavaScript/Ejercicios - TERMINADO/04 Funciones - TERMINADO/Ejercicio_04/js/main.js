/*4. Crear una función flecha que escriba por pantalla el sumatorio de un número. El programa debe solicitar al
usuario un número mayor que 0. Comprobar que el número es válido.
Ejemplo: sumatorio de 5 es: 5+4+3+2+1 = 15*/

let entradaUsuario;
let sumatorio = 0;
let mensaje = "";
let calcularSumatorio = (entradaUsuario) => {
    for (let i = entradaUsuario; i > 0; i--) {
        sumatorio += i;
        if (i !== 1) {
            mensaje += `${i} + `;
        } else {
            mensaje += `${i} = `;
        }
    }
    mensaje += sumatorio;
    document.body.innerHTML += `<p>El sumatorio de ${entradaUsuario} es: ${mensaje}</p>`;
}

do {
    entradaUsuario = Number(prompt("Introduce un número mayor que 0: "));
} while (entradaUsuario <= 0 || isNaN(entradaUsuario) == true);

calcularSumatorio(entradaUsuario);



