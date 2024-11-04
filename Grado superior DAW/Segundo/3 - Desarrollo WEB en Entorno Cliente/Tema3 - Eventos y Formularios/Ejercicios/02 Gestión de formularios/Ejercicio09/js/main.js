/*
EJERCICIO09 

• Crear una página html con un campo de texto (input), poner vuestro nombre y al pulsar un botón,
  mostrareis el contenido del input debajo del botón. 
    Pista: usar etiqueta div

• Añadir al ejercicio que después de pulsar el botón, limpie el cuadro de texto y ponga el foco en él. 
• El nombre lo mostrareis en color azul y en negrita. 
• Usar una clase de estilo llamado ‘resultado’.
*/

window.addEventListener("DOMContentLoaded", () => {
    const $botonActivar = document.getElementById("boton-activar");
    const $inputNombre = document.getElementById("nombre");
    const $divResultado = document.getElementById("resultado");

    $botonActivar.addEventListener("click", () => {
        let valorTexto = $inputNombre.value;

        $divResultado.setAttribute("class", "resultado");
        $divResultado.innerText = valorTexto;

        $inputNombre.value = "";
        $inputNombre.focus();

    });
});