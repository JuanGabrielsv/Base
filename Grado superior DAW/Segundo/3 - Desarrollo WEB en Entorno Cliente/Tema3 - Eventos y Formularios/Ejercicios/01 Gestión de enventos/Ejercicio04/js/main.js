/*
EJERCICIO04.

• Crear una página con dos botones: uno ‘Sumar’ y otro ‘Restar’. 
• Debajo hay un div que inicialmente muestra un 5. 
• Al pulsar el botón Sumar, se sumará uno, y al pulsar el botón restar, se restará uno. 
• El div tendrá que actualizarse en cada operación. 
• Cuando se llegue al valor 3, el div debe mostrar un mensaje que indique ‘Alcanzado valor 3’. 
• Cuando vuelva a ser distinto de 3, el mensaje debe desaparecer. 
*/

window.addEventListener("DOMContentLoaded", () => {

    const $botonSumar = document.getElementById("boton-sumar");
    const $botonRestar = document.getElementById("boton-restar");
    const $divNumero = document.getElementById("div-numero");

    let valorNumero = Number($divNumero.textContent);

    $botonSumar.addEventListener("click", () => {

        valorNumero++;
        if (valorNumero == 3) {
            $divNumero.innerHTML = `Alcanzado valor 3`;
            $divNumero.style.fontSize = "14px";
            $divNumero.style.textAlign = "center";
        } else {
            $divNumero.innerHTML = `${valorNumero}`;
            $divNumero.style.fontSize = "64px";            
        }

    });

    $botonRestar.addEventListener("click", () => {

        valorNumero--;
        if (valorNumero == 3) {
            $divNumero.innerHTML = `Alcanzado valor 3`;
            $divNumero.style.fontSize = "14px";
            $divNumero.style.textAlign = "center";
        } else {
            $divNumero.innerHTML = `${valorNumero}`;
            $divNumero.style.fontSize = "64px";            
        }

    });

});