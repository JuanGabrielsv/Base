/*
EJERCICIO12.

• Crear una página HTML con 3 párrafos con <p> con los siguientes id: ‘contenidos_1’, ‘contenidos_2’ y ‘contenidos_3’.
• Detrás de cada párrafo, poner un enlace <a> con el texto ‘Ocultar Contenido’ y con sus id: ‘enlace_1’, ‘enlace_2’ y ‘enlace_3’.
• Realizar un programa que desde código JavaScript, al pulsar un enlace se ocultará el texto del párrafo correspondiente.
• Cuando se oculte, el texto del enlace deberá mostrar ‘Mostrar Contenido’ y al pulsarlo, se visualizará el párrafo volviendo a mostrar el enlace el texto ‘ocultar contenido’.
*/


window.addEventListener('DOMContentLoaded', () => {

    for (let i = 1; i < 4; i++) {
        document.getElementById(`enlace_${i}`).addEventListener('click', () => {
            if (document.getElementById(`contenidos_${i}`).hidden) {
                document.getElementById(`enlace_${i}`).innerText = 'Ocultar Contenido';
                document.getElementById(`contenidos_${i}`).hidden = false;
            } else {
                document.getElementById(`enlace_${i}`).innerText = '\nMostrar Contenido';
                document.getElementById(`contenidos_${i}`).hidden = true;
            }
        });
    }
});
