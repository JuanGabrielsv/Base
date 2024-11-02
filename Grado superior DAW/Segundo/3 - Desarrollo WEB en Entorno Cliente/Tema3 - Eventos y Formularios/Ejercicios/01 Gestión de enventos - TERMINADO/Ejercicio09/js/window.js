/*
EJERCICIO 09.

• Dada la página ‘window.html’ que contiene un título y un botón ‘Abrir Página’, 
• Crear código JavaScript de forma que, al pulsarlo se abra otra ventana: ‘datos.html’ de 400x300. 
• Esta segunda pantalla tendrá:
    - 2 cuadros de texto donde el usuario tendrá que introducir su nombre y sus apellidos
    - 1 cuadro de tipo fecha (type=”date”) dónde seleccionará la fecha de nacimiento.
    - 1 botón ‘Mostrar’, para que muestre en la página principal, los datos del usuario junto con su
      fecha de nacimiento en formato dd/mm/yyyy. Y deberá mostrar también, los años bisiestos que ha
      habido desde que nació.

NOTA: Un año es bisiesto si el año es divisible por 4 pero no divisible por 100, o bien, el año debe ser
divisible por 400.

window.html:

<body>
    <h1>Ventana Principal</h1>
    <button id="abrirPagina">Abrir Página</button>
    <div id="resultado"></div>
</body>
*/

window.addEventListener("DOMContentLoaded", () => {

    const $buttonAbrirPagina = document.getElementById("abrirPagina");
    const $divResultado = document.getElementById("resultado");

    $buttonAbrirPagina.addEventListener("click", () => {

        var ventanaDatos = window.open("datos.html", "ventana-datos", "width=400, height=300");

    });

});

function anoBisiesto(parametroAno) {
    return (parametroAno % 400 == 0 || parametroAno % 4 == 0 && parametroAno % 100 != 0);
}

