/*
EJERCICIO 07

• Crear un formulario con 6 checkbox y un botón ‘validar’
• Cuando pulsemos el botón, validará que hay 3 o más checkbox marcados. 
• Mostrar  por alert un mensaje que indique si hay o no 3 o más de 3 checkbox marcados.
• Una vez realizado, crear otro checkbox independiente con dos botones nuevos: marcar y desmarcar.
• Cuando pulsemos el botón marcar, marcaremos el checkbox y cuando pulsemos el botón desmarcar,
  desmarcará el checkbox.
*/

window.addEventListener("DOMContentLoaded", () => {
    const $arrayFormulario1 = document.forms["formulario1"];
    const $arrayFormulario2 = document.forms["formulario2"];

    let $Formulario1BotonValidar;

    for (let i = 0; i < $arrayFormulario1.length; i++) {
        if ($arrayFormulario1[i].getAttribute("name") == "boton-validar") {
            $Formulario1BotonValidar = $arrayFormulario1[i];
        };
    }

    $Formulario1BotonValidar.addEventListener("click", () => {
        let contador = 0;

        for (let i = 0; i < $arrayFormulario1.length; i++) {
            if ($arrayFormulario1[i].getAttribute("name") == "checkbox" && $arrayFormulario1[i].checked) {
                contador++;
            }
        }

        if (contador >= 3) {
            alert("Hay 3 o mas checkbox marcados");
        } else {
            alert("No hay 3 o mas checkbox marcados");
        }

    });

    $arrayFormulario2[1].addEventListener("click", () => {
        $arrayFormulario2[0].checked = true;
    });

    $arrayFormulario2[2].addEventListener("click", () => {
        $arrayFormulario2[0].checked = false;
    });

});



