/*
EJERCICIO11
• Crear un formulario con un cuadro de texto ‘edad’ y un botón.
• Al pulsar el botón, comprobar si la edad insertada es mayor o menor de edad. 
• Poner el resultado en un div debajo del botón. 
• Si es mayor de edad el color del texto es verde, y en caso contrario rojo. 
• En caso de que el valor introducido no sea un número indicarlo con un mensaje en rojo en el mismo div.

    - Utilizar estilos individuales
    - Crear dos clases de estilo, uno para el texto en rojo y otro para el texto en verde.
*/



window.addEventListener('DOMContentLoaded', () => {
    const formularioById = document.getElementById('formulario');
    const formularioByName = document.getElementsByName('formulario');
    const formularioForms = document.forms;
    const formularioFormsId = document.forms['formulario']; //Esto vale tanto para 'name' como para 'id'
    const boton1 = document.getElementById('boton1');
    const resultado = document.getElementById('resultado');

    console.log(formularioById[0].value);
    console.log(formularioByName[0][0].value);
    console.log(formularioForms[0][0].value);
    console.log(formularioFormsId[0].value);

    boton1.addEventListener('click', () => {
        const edad = Number(formularioForms[0][0].value);

        if (isNaN(edad)) {
            resultado.innerHTML = 'No es un número';
            resultado.setAttribute('class', 'texto-rojo');

        } else if (edad >= 18) {
            resultado.innerHTML = 'Mayor de edad';
            resultado.setAttribute('class', 'texto-verde');
        } else {
            resultado.innerHTML = 'Menor de edad';
            resultado.setAttribute('class', 'texto-rojo');
        }

    });

})