/*
EJERCICIO15.

• Dada una página con un botón y dos párrafos de texto:
• Poner el fondo del segundo párrafo en color rojo desde código JavaScript. LOS PARRAFOS NO TIENEN ID.
*/

window.addEventListener('DOMContentLoaded', () => {
    document.getElementById('boton-activar').addEventListener('click', () => {
        document.body.firstElementChild.nextElementSibling.style.color = 'yellow';
    });

    console.log(document.body.firstElementChild)

});




