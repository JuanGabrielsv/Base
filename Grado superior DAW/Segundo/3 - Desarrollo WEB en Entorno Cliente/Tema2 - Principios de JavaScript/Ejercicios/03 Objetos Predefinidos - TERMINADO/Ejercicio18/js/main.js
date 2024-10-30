/* 18. Vamos a utilizar temporizadores: Crear una pagina y que cada segundo cambie de color el fondo: naranja /
azul hasta pulsar un botón Detener */

let v_temporizador = setInterval(function () {
    document.body.style.backgroundColor = `orange`;
}, 1000);

let v_temporizadorDos = setInterval(function () {
    document.body.style.backgroundColor = `blue`;
}, 2000);

function parar() {
    clearInterval(v_temporizador);
    clearInterval(v_temporizadorDos);
}
