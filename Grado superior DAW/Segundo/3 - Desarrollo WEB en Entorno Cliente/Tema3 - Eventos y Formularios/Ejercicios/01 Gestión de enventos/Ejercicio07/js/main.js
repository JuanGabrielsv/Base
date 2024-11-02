/*
EJERCICIO 07. 

• Sobre el ejercicio anterior, modificar lo necesario para que una vez que se pulsa el botón, si se cumplen
  las dos validaciones, el formulario debe redirigir a la página de: https://ceu.es.
• En caso contrario, el comportamiento debe ser igual al ejercicio anterior. 
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
        let checkNombre = false;
        let checkApellidos = false;

        console.log(arrayValueApellidos);
        console.log(tamanoArrayApellidos);

        if (valueNombreUsuario.substring(0, 1) != valueNombreUsuario.substring(0, 1).toUpperCase()) {
            $mensajeInputNombreUsuario.innerHTML = `La primera inicial tiene que ser Mayúsculas...`
            $mensajeInputNombreUsuario.style.color = `red`;
        } else {
            $mensajeInputNombreUsuario.innerHTML = ``;
            checkNombre = true;
        }

        if (tamanoArrayApellidos >= 2) {
            $mensajeInputApellidos.innerHTML = ``;
            checkApellidos = true;
            
        } else {
            $mensajeInputApellidos.innerHTML = `Debes introducir los dos apellidos`;
            $mensajeInputApellidos.style.color = `red`;            
        }

        if (checkNombre == true && checkApellidos == true) {
            window.open("https://ceu.es");
        }

    });

});

