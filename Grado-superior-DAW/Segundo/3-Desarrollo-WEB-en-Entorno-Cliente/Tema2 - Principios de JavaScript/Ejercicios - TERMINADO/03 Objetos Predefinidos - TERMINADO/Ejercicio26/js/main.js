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

function abrirVentana() {
  window.open("emergente.html", "ventana1", "");   
}
