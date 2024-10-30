/*
EJERCICIO24

• Variar el ejercicio anterior para que en la página index.html, haya además, un campo de tipo input que reciba el número de segundos tras los que la ventana
  emergente se cierre.
*/

function abrirVentana() {
  const $tiempoCuentaAtras = document.getElementById("tiempoCuentaAtras");
  var nuevaVentana = window.open(
    "",
    "ventanaNueva",
    "width=400, height=200, top=100, left=300"
  );
  nuevaVentana.document.body.innerHTML = `Esto es un mensaje`;

  cuentaAtras($tiempoCuentaAtras.value);
}

function cuentaAtras(pSegundos) {
  const $cuentaAtras = document.getElementById("cuentaAtras");
  $cuentaAtras.innerHTML = `${pSegundos}`;
  
  const intervalo = setInterval(() => {
  
    $cuentaAtras.innerHTML = `${pSegundos - 1}`;
    pSegundos--;

    if (pSegundos == 0) {
      window.open("", "ventanaNueva", "").close();
      clearInterval(intervalo);
    }
  }, 1000);
}
