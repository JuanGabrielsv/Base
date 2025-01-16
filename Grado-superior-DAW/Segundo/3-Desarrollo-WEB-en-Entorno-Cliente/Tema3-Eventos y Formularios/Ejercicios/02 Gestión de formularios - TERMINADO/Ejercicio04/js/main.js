/*
EJERCICIO 4 
• Crear una página HTML con 4 checkbox, con los valores: 1,2,3 y 5.
• Un botón. 
• Al pulsar el botón, mostrar en un alert la suma obtenida sólo de los checkbox marcados. 
• Después todos los check volverán a estar desmarcados. 
• Crear el html sin formulario.

Ejemplo, si marcamos los dos primeros, la suma es 3. Hacerlo de dos formas:
◦ 1º: Los checkbox tienen un id para poder acceder a cada uno individual.
◦ 2º: Los checkbox no tienen un id propio, tienen un name común.
*/

window.addEventListener("DOMContentLoaded", () => {
    const $checkbox1Id = document.getElementById("checkbox1");
    const $checkbox2Id = document.getElementById("checkbox2");
    const $checkbox3Id = document.getElementById("checkbox3");
    const $checkbox4Id = document.getElementById("checkbox4");
    const $checkboxName = document.getElementsByName("checkbox");
    const $botonId = document.getElementById("boton");
    const $botonName = document.getElementsByName("boton");

    $botonName[0].addEventListener("click", () => {
        let suma = 0;
        
        for (let i = 0; i < $checkboxName.length; i++) {
            if ($checkboxName[i].checked) {
                suma += Number($checkboxName[i].value);
                $checkboxName[i].checked = false;
            };
        }
        
        alert(suma);

    });
});
