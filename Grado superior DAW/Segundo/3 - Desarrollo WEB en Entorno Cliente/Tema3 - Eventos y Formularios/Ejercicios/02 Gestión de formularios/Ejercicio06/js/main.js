/*
EJERCICIO 06

• Crear el mismo ejercicio anterior con los input y el botón dentro de un formulario. ¿Se te ocurre forma de hacerlo a
  través del formulario?
*/

window.addEventListener("DOMContentLoaded", () => {
    const $arrayFormulario1 = document.forms["formulario"];

    for (let i = 0; i < $arrayFormulario1.length; i++) {
        if ($arrayFormulario1[i].getAttribute("name") == "boton") {
            $arrayFormulario1[i].addEventListener("click", () => {
                for (let i = 0; i < $arrayFormulario1.length; i++) {
                    if ($arrayFormulario1[i].checked) {
                        alert(`Seleccionada opoción ${$arrayFormulario1[i].value}`);
                    }
                }
            });
        }
    }

});


