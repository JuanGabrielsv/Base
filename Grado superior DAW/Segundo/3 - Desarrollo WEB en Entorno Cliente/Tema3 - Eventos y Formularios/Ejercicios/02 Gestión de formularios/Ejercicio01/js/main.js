/*
EJERCICIO 01. 

• Crea un archivo HTML con un párrafo (<p>) con el texto: “Texto Original”. 
• Preguntar al usuario si quiere cambiar texto y en caso afirmativo, cambiar su texto a “Texto Cambiado”. 
• En caso negativo, preguntar si quiere cambiar el color de la letra. En caso afirmativo, cambiar la letra a color naranja.
*/
window.addEventListener("DOMContentLoaded", () => {
    const $texto = document.getElementById("texto");
    let promptValue = confirm("¿Quieres cambiar el texto?");

    if (promptValue) {
        $texto.innerText = "Texto Cambiado";
    } else if (!promptValue) {
        promptValue = confirm("¿Quieres cambiarle el color de la letra?");
        if (promptValue) {
            $texto.style.color = "orange";
        }
    }

});

