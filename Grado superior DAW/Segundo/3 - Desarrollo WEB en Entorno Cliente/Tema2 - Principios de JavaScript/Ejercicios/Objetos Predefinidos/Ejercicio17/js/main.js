/* 17. Crear una pagina que contenga un botón, de forma que al pulsar el botón, se abra otra ventana de 600x600:
‘selector_color.html’. Al cargar esta segunda página, preguntar al usuario un color. (EJ: red, #3498db) con
un cuadro de dialogo. Al aceptar, mostrar dicho color como fondo de la ventana principal y cerrar la
ventana selector_color. */

let vSegundaVentana;
let vEntradaUsuario;

function iniciarPrograma() {

    //al pulsar el botón, se abra otra ventana de 600x600 ‘selector_color.html’:
    vSegundaVentana = window.open("selector_color.html", "segunda", "width=600, height=600");
    vEntradaUsuario = vSegundaVentana.prompt("Introduce el color:");
    document.body.style.background = `${vEntradaUsuario}`;
    vSegundaVentana.close();
}