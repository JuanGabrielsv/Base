/*
EJERCICIO 10 

• Dada la página index.html con un temporizador de cuenta regresiva que inicia en 30 segundos.
• El usuario tendrá tres botones: Iniciar, Pausar y Reiniciar. 
• El temporizador se mostrará en pantalla y disminuirá de 1 en 1 segundo. 
• Cuando el temporizador llegue a 0, mostrará:
    "¡Tiempo agotado!".

 Index.html:

<body>
 <h1>Cuenta Regresiva</h1>
 <div id="temporizador">30</div>
 <button id="iniciar">Iniciar</button>
 <button id="pausar">Pausar</button>
 <button id="reiniciar">Reiniciar</button>
</body>
*/

window.addEventListener("DOMContentLoaded", () => {

    const $divTemporizador = document.getElementById("temporizador");
    const $botonIniciar = document.getElementById("iniciar");
    const $botonPausar = document.getElementById("pausar");
    const $botonReiniciar = document.getElementById("reiniciar");
    let intervalo = null;

    $botonIniciar.addEventListener("click", () => {
        let valorDivTemporizador = Number($divTemporizador.textContent);
        intervalo = setInterval(() => {
            $divTemporizador.innerHTML = valorDivTemporizador - 1;
            valorDivTemporizador--;

            if (valorDivTemporizador == 0) {
                $divTemporizador.innerHTML = `¡Tiempo agotado!`;
                clearInterval(intervalo);
            }

        }, 1000);
    });

    $botonPausar.addEventListener("click", () => {
        clearInterval(intervalo);
    });

    $botonReiniciar.addEventListener("click", () => {
        clearInterval(intervalo);
        $divTemporizador.innerText = 30;
    });

});

