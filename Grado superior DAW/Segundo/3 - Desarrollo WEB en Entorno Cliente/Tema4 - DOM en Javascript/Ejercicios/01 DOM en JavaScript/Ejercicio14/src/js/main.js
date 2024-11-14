/*
EJERCICIO14.

• Crear una página HTML con una lista de 10 elementos (ejemplo lorem)
• Un botón que al pulsarlo, pregunte al usuario con mensajes de prompt, un texto a introducir y una posición del 1 al 10. 
• Colocar el texto en la posición indicada. 
(Actualiza el texto de ese elemento, no se modifica la longitud de la lista).
• Si la posición no es correcta,indicadlo.
*/

window.addEventListener('DOMContentLoaded', () => {

    document.getElementById('boton-enviar').addEventListener('click', () => {
        let textoUsuario = prompt('Introduce un texto:');
        let posicionUsuario = Number(prompt('Introduce una posición para el texto (del 1 al 10 incluidos)'));
        if (posicionUsuario < 1 || posicionUsuario > 10) {
            return console.log('Poscición incorrecta');
        }

        let posicionCorregida = posicionUsuario - 1;

        console.log(document.body.children[0].children[`${posicionCorregida}`].
            innerText = `${textoUsuario}`);

    });

});




