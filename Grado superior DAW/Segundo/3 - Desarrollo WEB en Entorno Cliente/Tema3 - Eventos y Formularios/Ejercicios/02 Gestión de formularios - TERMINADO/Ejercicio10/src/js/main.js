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
    const select2 = document.getElementById('provincias-multiples')
    const boton1 = document.getElementById('boton1')
    const boton2 = document.getElementById('boton2')


    boton1.addEventListener('click', () => {
        const selectValue = document.getElementById('provincias').value
        const selectDescripcion = select.options[select.selectedIndex].text

        alert(`${selectValue}\n${select.selectedIndex}\n${selectDescripcion}`)
    })

    boton2.addEventListener('click', () => {        
        const seleccionados = []

        for (let i = 0; i < select2.options.length; i++) {
            if (select2.options[i].selected) {
                seleccionados.push(select2.options[i].text)
            }
        }
        
        alert(`${seleccionados.join(', ')}`)
    })

})

