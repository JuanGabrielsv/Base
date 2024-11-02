/*
EJERCICIO 08. 

• Validar el formulario antes de enviarlo. 
• Comprobar que el nombre, apellidos y edad tienen valor (no se dejan en blanco). 
• La edad debe ser un número y sus valores deben estar comprendidos entre 0 y 105. 
• Validar que se ha seleccionado alguna provincia.

    Si se cumplen todas las validaciones:

• Preguntar al usuario con un mensaje si deseas enviar el formulario.
• En caso afirmativo, se enviará. 
• En caso negativo no hará nada.
• Se mostrará sólo el primer error que no cumpla la validación.
• Cuando no se cumpla alguna validación debe aparecer el mensaje correspondiente en la etiqueta div (id=”resultado”) del final en color rojo. 
*/

window.addEventListener("DOMContentLoaded", () => {

    const $inputTextNombre = document.getElementById("nombre");
    const $inputTextApellidos = document.getElementById("apellidos");
    const $inputTextEdad = document.getElementById("edad");
    const $inputSelectProvincia = document.getElementById("provincia");    
    const $inputSubmitButtonEnviar = document.getElementById("enviar");
    const $divResultado = document.getElementById("resultado");

    $inputSubmitButtonEnviar.addEventListener("click", (e) => {

        let valueTextNombre = String($inputTextNombre.value).trim();
        let valueTextApellidos = String($inputTextApellidos.value).trim();
        let valueTextEdad = String($inputTextEdad.value).trim();
        let valueSelectProvincia = String($inputSelectProvincia.value).trim();

        if (valueTextNombre.length === 0) {

            $divResultado.innerHTML = `El campo Nombre está vacio`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else if (valueTextApellidos.length === 0) {

            $divResultado.innerHTML = `El campo Apellidos está vacio`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else if (valueTextEdad.length === 0) {

            $divResultado.innerHTML = `El campo Edad está vacio`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else if (isNaN(valueTextEdad)) {

            $divResultado.innerHTML = `El campo Edad no es un número`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else if (valueTextEdad < 0 || valueTextEdad > 105) {

            $divResultado.innerHTML = `La edad debe de estar entre 0 y 105`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else if (valueSelectProvincia == "0") {

            $divResultado.innerHTML = `No ha seleccionado provincia`;
            $divResultado.style.color = `red`;
            e.preventDefault();

        } else {

            $divResultado.innerHTML = ``;
            let confirmacion = Boolean(confirm("Los datos del formulario están correctos. ¿Quieres enviarlo?"));

            if (!confirmacion) {
                e.preventDefault();
            }

        }
    });

});