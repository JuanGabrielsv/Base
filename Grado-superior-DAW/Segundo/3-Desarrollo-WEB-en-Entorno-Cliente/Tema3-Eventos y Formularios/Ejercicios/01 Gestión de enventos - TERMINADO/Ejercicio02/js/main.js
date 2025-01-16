/*
EJERCICIO02. 

• Crear una página html con dos input de tipo text. 
• Cuando se escriba en ambos, el color del texto debe ser rojo y cuando pierda el foco, el color del texto será negro.
• Añadir un botón ‘Púlsame’ (button), con un evento, que al hacer click ponga el color del texto del botón en azul.
• Añadir otro botón ‘Cambia’, que al pasar por encima ponga el borde del botón de color verde
  y cuando salga del botón, lo ponga de color naranja.
*/

const $input1 = document.getElementById("input-texto1");
const $input2 = document.getElementById("input-texto2");
const $boton1 = document.getElementById("boton1");
const $boton2 = document.getElementById("boton2");

window.addEventListener("DOMContentLoaded", () => {

    $input1.addEventListener("focus", () => {
        $input1.style.color = "red";
    });

    $input1.addEventListener("blur", () => {
        $input1.style.color = "black";
    });

    $input2.addEventListener("focus", () => {
        $input2.style.color = "red";
    });

    $input2.addEventListener("blur", () => {
        $input2.style.color = "black";
    });

    $boton1.addEventListener("click", () => {
        $boton1.style.color = "blue";
    });

    $boton2.addEventListener("mouseover", () => {
        $boton2.style.border = "5px solid green";
    });

    $boton2.addEventListener("mouseout", () => {
        $boton2.style.border = "5px solid orange";
    });

});