/*
EJERCICIO10
• Crear una página html con un formulario
• Un objeto select provincias con 4 provincias (4 options)
• Crear un botón que al pulsarlo muestre en un alert la información de la provincia seleccionada:
  índice del option seleccionado, descripción y valor.
• Añadir otro objeto select múltiple, pero que permita la selección multiple.
• Otro botón que al pulsarlo muestre por alert la descripción de las provincias seleccionadas (deben aparecer separadas por coma).
*/

window.addEventListener("DOMContentLoaded", () => {
    const select = document.getElementById('provincias')
    const boton1 = document.getElementById('boton1')
    const selectValue = document.getElementById('provincias').selectedValue

    boton1.addEventListener('click', () => {

        alert(`${selectValue}\n${select.selectedIndex}`)
    })

})

