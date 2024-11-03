/*
EJERCICIO 02

• Crea un archivo HTML con un input de tipo ‘text’ con un valor, y un botón. 
• Cuando se pulse el botón, preguntar al usuario vuestro nombre y modificar el valor del input con el valor introducido. 
• Cambiar también el texto del botón a ‘pulsado’. 
*/

window.addEventListener("DOMContentLoaded", () => {
    const arrayFormulario = document.forms["formulario"];
    let entradaUsuario;

    arrayFormulario["boton"].addEventListener("click", () => {
        entradaUsuario = prompt("¿Cuál es tu nombre?");
        arrayFormulario["texto"].value = entradaUsuario;
        arrayFormulario["boton"].innerText = `"pulsado"`;
    });

    console.log(arrayFormulario["texto"].value);
});


