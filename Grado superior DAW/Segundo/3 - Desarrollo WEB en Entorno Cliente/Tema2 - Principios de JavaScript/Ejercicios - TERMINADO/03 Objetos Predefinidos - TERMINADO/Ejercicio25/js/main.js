/*
25. Crear una página html con el siguiente body:

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

• Crear código JavaScript tal que al pulsar el botón, se abra una ventana emergente donde se muestre la cuenta atrás
  de segundos que quedan para que se cierre automáticamente. 
• El número de segundos vendrá en el campo cuyo id es ‘segundos’. 
• Cuando se cierre, debe escribirse en la página principal, “Ya han pasado X segundos y se ha cerrado la
  ventana emergente”.
*/

let $resultado = document.getElementById("resultado");
let $segundos = document.getElementById("segundos");

function abrirVentana() {
  var ventanaAbierta = window.open("", "ventana1", "");
  let segundos = $segundos.value;

  ventanaAbierta.document.body.innerHTML = `${segundos}`;
    const intervalo = setInterval(() => {
        
        ventanaAbierta.document.body.innerHTML = `${segundos -1}`;
        segundos--;      

        if(segundos == 0){
            ventanaAbierta.close();
            document.getElementById("resultado").innerHTML = `Ya han pasado ${$segundos.value} segundos y se ha cerrado.`;
        }

    }, 1000);

}
