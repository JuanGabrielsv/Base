/*
EJERCICIO03.

• Crear un formulario con 6 checkbox y un botón ‘validar’.
• Cuando pulsemos el botón, validará que hay 3 o más checkbox marcados.
• Mostrar por alert un mensaje que indique si hay o no 3 o más de 3 checkbox marcados. 
*/

const $inputCheckbox1 = document.getElementById("checkbox1");
const $inputCheckbox2 = document.getElementById("checkbox2");
const $inputCheckbox3 = document.getElementById("checkbox3");
const $inputCheckbox4 = document.getElementById("checkbox4");
const $inputCheckbox5 = document.getElementById("checkbox5");
const $inputCheckbox6 = document.getElementById("checkbox6");
const $botonValidar = document.getElementById("boton-validar");

window.addEventListener("DOMContentLoaded", () => {

    $botonValidar.addEventListener("click", () => {

        let contador = 0;

        if ($inputCheckbox1.checked == true) {
            contador++;
        }
        if ($inputCheckbox2.checked == true) {
            contador++;
        }
        if ($inputCheckbox3.checked == true) {
            contador++;
        }
        if ($inputCheckbox4.checked == true) {
            contador++;
        }
        if ($inputCheckbox5.checked == true) {
            contador++;
        }
        if ($inputCheckbox6.checked == true) {
            contador++;
        }

        if (contador >= 3) {
            alert("Hay 3 o mas checkbox marcados");
        } else {
            alert("No hay 3 o mas checkbox marcados");
        }

    });

});