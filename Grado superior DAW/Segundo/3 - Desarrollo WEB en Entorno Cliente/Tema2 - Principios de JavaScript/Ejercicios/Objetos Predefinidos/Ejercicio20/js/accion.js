/*
20. CREAR UNA PÁGINA CON LAS SIGUIENTES CARACTERÍSTICAS:

    1. Mostrar el mensaje ‘En un lugar de la Mancha’ por consola cada 2 segundos.
    2. Usar un botón en la página  para parar el temporizador anterior: 
       <input type="button" onclick="para()" >
    3. Usar otro botón en la página para mostrar por consola el  mensaje ‘Han pasado 3 segundos’ después de
       3 segundos, una sóla vez. 
    4. Usar otro botón para abrir una ventana nueva de 300x300 y escribir  un texto con <p> en su interior
       desde js. Esta ventana nueva debe mostrar la hora actual en formato HH:MM:SS. Se tiene que
       actualizar continuamente como un reloj.
    5. Parar el reloj a los 5 segundos.
    6. Cerrarla tras 10 segundos.

NOTA1: Usar el código js en un fichero independiente: accion.js
NOTA2: Usar funciones dentro de los temporizadores.
*/

//1. Mostrar el mensaje ‘En un lugar de la Mancha’ por consola cada 2 segundos.
let vTemporizadorUno = setInterval(function () {
    console.log("En un lugar de la Mancha\n");
}, 2000);

/*2. Usar un botón en la página  para parar el temporizador anterior:
     <input type="button" onclick="para()" > */
function para() {
    clearInterval(vTemporizadorUno);
}

/*3. Usar otro botón en la página para mostrar por consola el  mensaje ‘Han pasado 3 segundos’ después de
     3 segundos, una sóla vez. */
function haPasado() {
    setTimeout(function () {
        console.log("Han pasado 3 segundos")
    }, 3000);
}

/*4. Usar otro botón para abrir una ventana nueva de 300x300 y escribir  un texto con <p> en su interior
     desde js. Esta ventana nueva debe mostrar la hora actual en formato HH:MM:SS. Se tiene que
     actualizar continuamente como un reloj. */
function nuevaVentana() {
    let vNuevaVentana = window.open("", "nuevaVentana", "width=300, height=300");
    vNuevaVentana.document.body.innerHTML = `<p>${new Date().toLocaleTimeString()}</p>`
    let vTemporizadorDos = setInterval(function () {
        vNuevaVentana.document.body.innerHTML = `<p>${new Date().toLocaleTimeString()}</p>`
        /*let fecha = new Date().toLocaleTimeString();
        vNuevaVentana.document.body.innerHTML = `<p>${fecha}</p>`*/
    }, 1000);

    //5. Parar el reloj a los 5 segundos.
    let vTemporizadorTres = setTimeout(function () {
        clearInterval(vTemporizadorDos);
    }, 5000);

    //6. Cerrarla tras 10 segundos.
    let vTemporizadorCuatro = setTimeout(function () {
        vNuevaVentana.close();
    }, 10000);
}



