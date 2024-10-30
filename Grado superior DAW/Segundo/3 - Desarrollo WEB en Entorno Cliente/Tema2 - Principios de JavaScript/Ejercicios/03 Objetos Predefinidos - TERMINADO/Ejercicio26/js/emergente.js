/*
EJERCICIO 26

• Repetir el ejercicio anterior pero en este caso, la página ‘emergente.html’ está previamente creada. 

index.html

    <body>
        <h1>Ventana Emergente con Temporizador Personalizado</h1>
        <p>
        Ingresa el número de segundos para que la ventana emergente se cierre
        automáticamente.
        </p>
        <label for="segundos">Número de segundos: </label>
        <input
        type="text"
        id="segundos"
        min="1"
        placeholder="Escribe el tiempo en segundos"
        />
        <button onclick="abrirVentana()">Abrir Ventana Emergente</button>
        <p id="resultado"></p>
        <!--Aquí se mostrará el mensaje cuando la ventana se cierrre -->
    </body>

emergente.html

    <body>
        <h2>Cuenta atrás en la ventana emergente</h2>
        <p id="cuentaAtras">Esperando...</p>
    </body>
*/


let ventanaPadre = window.opener.document.getElementById("segundos");
let segundos = window.opener.document.getElementById("segundos").value;
let $cuentaAtras = document.getElementById("cuentaAtras");

$cuentaAtras.innerHTML = segundos;
let intervalo = setInterval(() => {
    $cuentaAtras.innerHTML = `${segundos - 1}`;
    segundos--;

    if (segundos == 0 || segundos < 0) {

        window.opener.document.getElementById("resultado").innerHTML = `Ya han pasado ${ventanaPadre.value} segundos y se ha cerrado.`;
        clearInterval(intervalo);
        window.close();
    }

}, 1000);

