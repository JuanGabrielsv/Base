/*
21.Crear una página index.html que contenga los siguientes botones:

    1.Botón que abre dos ventanas: ventana1.html y ventana2.html, ambas de 300x200. La ventana1 en
      la posición 100,300 y la ventana2 en la posición 500,300.
    2.Botón que cierra las dos ventanas
    3.Botón para cambiar el fondo de la primera ventana a:#FFECA1 
    4.Botón para cambiar el fondo de la segunda ventana a:#EFC3CA 

    • ventana1.html tiene dos botones:    
        5.Botón para enviar a la ventana2 el mensaje: “La ventana 1 te saluda”
        6.Botón para cambiar el fondo de la segunda ventana a: #7DDA58

    • ventana2.html tiene dos botones:
        7.Botón para enviar a la ventana1 el mensaje: “La ventana 2 te saluda”
        8.Botón para cambiar el fondo de la segunda ventana a: #5DE2E7

Incluir todo el código JavaScript en un único fichero accion.js
*/

/*1.Botón que abre dos ventanas: ventana1.html y ventana2.html, ambas de 300x200. La ventana1 en
    la posición 100,300 y la ventana2 en la posición 500,300. */

let ventanaUno;
let ventanaDos;

function botonUno() {
    ventanaUno = window.open("ventana1.html", "ventana1", "width=300, height=200, top=100, left=300");
    ventanaDos = window.open("ventana2.html", "ventana2", "width=300, height=200, top=500, left=300");
}

//2.Botón que cierra las dos ventanas.

function botonDos() {
    ventanaUno.close();
    ventanaDos.close();
}