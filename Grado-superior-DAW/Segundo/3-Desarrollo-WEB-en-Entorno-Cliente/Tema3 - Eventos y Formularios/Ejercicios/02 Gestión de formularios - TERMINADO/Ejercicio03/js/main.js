/*
EJERCICIO 03

• Crea un archivo HTML con 1 checkbox, desmarcado por defecto.
• Un botón. 
• Al hacer clic en el botón, marcarlo automáticamente. 
*/

window.addEventListener("DOMContentLoaded", () => {
    const aFormulario = document.forms['formulario'];

    aFormulario['boton'].addEventListener("click", () => {
        aFormulario['checkbox'].setAttribute("checked", "checked");
    });
});