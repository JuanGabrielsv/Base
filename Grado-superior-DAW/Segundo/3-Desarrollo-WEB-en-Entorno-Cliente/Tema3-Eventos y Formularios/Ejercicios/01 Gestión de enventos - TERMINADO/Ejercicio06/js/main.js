/*
EJERCICIO 06.

• Crear un formulario con 2 input de tipo de texto: Nombre y Apellidos. Y un botón validar.
• Se tiene que cumplir que:
    1. El nombre comienza por vocal.
    2. Los apellidos tienen 2 o más de dos palabras.
• Poner debajo de cada input un mensaje en caso de no cumplir su validación.
• Una vez hecho, añadir que el mensaje aparezca con letra de color rojo. 
*/

window.addEventListener("DOMContentLoaded", () => {

    const $inputNombreUsuario = document.getElementById("input-nombre-usuario");
    const $inputApellidos = document.getElementById("input-apellidos");
    const $botonValidar = document.getElementById("boton-validar");
    const $mensajeInputNombreUsuario = document.getElementById("mensaje-input-nombre-usuario");
    const $mensajeInputApellidos = document.getElementById("mensaje-input-apellidos");

    $botonValidar.addEventListener("click", () => {

        let valueNombreUsuario = String($inputNombreUsuario.value);
        let arrayValueApellidos = String($inputApellidos.value).trim().split(` `);
        let tamanoArrayApellidos = arrayValueApellidos.length;

        console.log(arrayValueApellidos);
        console.log(tamanoArrayApellidos);

        if (valueNombreUsuario.substring(0, 1) != valueNombreUsuario.substring(0, 1).toUpperCase()) {
            $mensajeInputNombreUsuario.innerHTML = `La primera inicial tiene que ser Mayúsculas...`
            $mensajeInputNombreUsuario.style.color = `red`;
        } else {
            $mensajeInputNombreUsuario.innerHTML = ``;
        }

        if (tamanoArrayApellidos != 2 || tamanoArrayApellidos < 2) {
            $mensajeInputApellidos.innerHTML = `Debes introducir los dos apellidos`;
            $mensajeInputApellidos.style.color = `red`;
        } else {
            $mensajeInputApellidos.innerHTML = ``;
        }

    });

});


