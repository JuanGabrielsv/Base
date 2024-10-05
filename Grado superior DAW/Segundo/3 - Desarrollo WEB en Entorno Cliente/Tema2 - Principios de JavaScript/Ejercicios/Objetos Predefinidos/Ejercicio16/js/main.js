/* 16. Crear una página index.html con un título h1 ‘Página principal’. Tendrá 6 botones.
Crear otra página segunda.html con un título h2 ‘Página secundaria’ con 3 botones.

◦index.html:
▪Botón 1. Abrirá la ventana segunda.html con 300x400 pixeles y en la posición 400x400.
▪Botón 2. Mover la ventana segunda.html 200 pixeles a la derecha y 100 pixeles abajo.
▪Botón 3. Mover la ventana segunda.html  a la posición 500x200
▪Botón 4. Aumentar el tamaño de la ventana segunda.html 100 pixeles de ancho y 100 alto
▪Botón 5. Cambiar el tamaño de la ventana segunda.html a 100x150.

◦segunda.html:
▪Botón 1: pondrá el fondo de la ventana secundaria de color verde.
▪Botón 2: pondrá el fondo de la ventana principal de color rojo.
▪Botón 3. Cerrar la ventana segunda.html.
▪Botón 4: cerrará la ventana secundaria y a continuación la ventana principal
NOTA1: ejecutar instrucciones js en el evento onclick:
<input type=”button” onclick=” instrucción ” />
NOTA2: color de fondo de una página:
document.body.style.backgroundColor=’xxx’;
      NOTA3: Para que una ventana se muestre por encima de otra, hay que poner el foco en dicha ventana: 
ventana.focus() */

function botonUno() {
    let vSegundaVentana = window.open(
        "segunda.html",
        "Segunda",
        "width=300, height=400, top=400, left=400 toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0");
    vSegundaVentana.focus();
    vSegundaVentana.resizeTo(300, 400) //Esto es para que vuando se vuelva a pulsar el botón recupere su tamaño si este cambió anteriormente.
    vSegundaVentana.moveTo(400, 400) //Esto es para que vuando se vuelva a pulsar el botón recupere su posición si este cambió anteriormente.
}
function botonDos() {
    let vSegundaVentana = window.open(
        "segunda.html",
        "Segunda",
        "width=300, height=400, top=400, left=400, toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0");
    vSegundaVentana.focus();
    vSegundaVentana.moveBy(200, 100);
}
function botonTres() {
    let vSegundaVentana = window.open(
        "segunda.html",
        "Segunda",
        "width=300, height=400, top=400, left=400, toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0");
    vSegundaVentana.focus();
    vSegundaVentana.moveTo(500, 200);
}
function botonCuatro() {
    let vSegundaVentana = window.open(
        "segunda.html",
        "Segunda",
        "width=300, height=400, top=400, left=400, toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0");
    vSegundaVentana.focus();
    vSegundaVentana.resizeBy(100, 100);
}
function botonCinco() {
    let vSegundaVentana = window.open(
        "segunda.html",
        "Segunda",
        "width=300, height=400, top=400, left=400, toolbar=0, location=0, resizable=0, status=0, menubar=0, scrollbars=0");
    vSegundaVentana.focus();
    vSegundaVentana.resizeTo(100, 150);
}

// FUNCIONES PARA segunda.html

// Botón 1: pondrá el fondo de la ventana secundaria de color verde.
function segundaBotonUno() {
    document.body.style.background = "#008000";
}

//Botón 2: pondrá el fondo de la ventana principal de color rojo.
function segundaBotonDos() {
    window.opener.document.body.style.background = "#ff0000";
}

//Botón 3. Cerrar la ventana segunda.html.