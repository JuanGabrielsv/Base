/*
EJERCICIO 09.

• Dada la página ‘window.html’ que contiene un título y un botón ‘Abrir Página’, 
• Crear código JavaScript de forma que, al pulsarlo se abra otra ventana: ‘datos.html’ de 400x300. 
• Esta segunda pantalla tendrá:
    - 2 cuadros de texto donde el usuario tendrá que introducir su nombre y sus apellidos
    - 1 cuadro de tipo fecha (type=”date”) dónde seleccionará la fecha de nacimiento.
    - 1 botón ‘Mostrar’, para que muestre en la página principal, los datos del usuario junto con su
      fecha de nacimiento en formato dd/mm/yyyy. 
    - Mostrar también, los años bisiestos que ha habido desde que nació.

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

    const $botonMostrar = document.getElementById("boton-mostrar");
    const $inputNombreUsuario = document.getElementById("input-nombre-usuario");
    const $inputApellidos = document.getElementById("input-apellidos");
    const $inputDateFechaNacimiento = document.getElementById("input-date-fecha-nacimiento");

    $botonMostrar.addEventListener("click", () => {

        let fechaNacimiento = new Date($inputDateFechaNacimiento.value);
        let fechaActual = new Date();
        let anoNacimiento = fechaNacimiento.getFullYear();
        let anoActual = fechaActual.getFullYear();

        console.log(typeof (fechaNacimiento));
        console.log(fechaNacimiento);
        console.log(typeof (fechaActual));
        console.log(fechaActual);

        window.opener.document.getElementById("resultado").innerHTML = `Nombre: ${$inputNombreUsuario.value}<br/>`;
        window.opener.document.getElementById("resultado").innerHTML += `Apellidos: ${$inputApellidos.value}<br/>`;
        window.opener.document.getElementById("resultado").innerHTML += `Fecha de Nacimiento: ${fechaNacimiento.toLocaleDateString()}<br/>`;
        window.opener.document.getElementById("resultado").innerHTML += `Años bisiestos:`;

        for (let i = anoNacimiento; i <= anoActual; i++) {
            if(i % 400 == 0 || i % 4 == 0 && i % 100 != 0) {
                
                window.opener.document.getElementById("resultado").innerHTML += ` ${i} `;
            }            
        }

    });
});

