/*
EJERCICIO 05. 

• Crear un estilo llamado boton que tenga una altura y anchura de 50px.
• El formulario tendrá 10 botones con ese estilo creado y con values del 0 al 9 respectivamente.
• Crear para todos ellos un evento tal que al pulsarlo muestre en una etiqueta div el valor del boton pulsado.
    
    NOTA: Para crear estilos: .boton {}
    Pista: crear los eventos con un bucle for. 
*/

window.addEventListener("DOMContentLoaded", () => {

    for (let i = 0; i <= 9; i++) {
        document.getElementById(`input-boton${i}`).addEventListener("click", () => {
            document.getElementById("resultado").innerHTML = `<div>${i}</div>`;
            console.log(`${i}`);
        });
    }

});