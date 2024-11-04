/*
EJERCICIO 05

• Crea un grupo de 4 input de tipo radio con 4 valores.
• No tienen id.
• Un botón sin formulario. 
• Al pulsar el botón, indicar con un alert cuál fue la opción seleccionada.
*/

window.addEventListener("DOMContentLoaded", () => {
    const $aRadioNames = document.getElementsByName("radio");
    const $botonName = document.getElementsByName("boton");

    $botonName[0].addEventListener("click", () => {
        for (let i = 0; i < $aRadioNames.length; i++) {
            if ($aRadioNames[i].checked) {
                alert(`Elegida la opción ${$aRadioNames[i].value}`);
            }
        }
    });
});


