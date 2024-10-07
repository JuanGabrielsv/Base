/* 19. Mostrar una pagina que diga ‘Nos vamos!’ y que tras 5 segundos  nos redirija  al buscador de google: https://www.google.com */

const cDireccionGoogle = "https://www.google.com";

document.write(`Nos vamos!`);

let vTemporizador = setTimeout(function () {
    window.open(cDireccionGoogle);
    window.location.href = cDireccionGoogle;
}, 5000);