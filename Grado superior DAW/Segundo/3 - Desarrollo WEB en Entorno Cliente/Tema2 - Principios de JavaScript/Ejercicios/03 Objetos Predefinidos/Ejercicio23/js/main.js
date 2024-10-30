/*
EJERCICIO23

• Crear una página html con un botón.
• Al pulsarlo, se abrirá una nueva ventana emergente de 400x200 con un mensaje.
• Esta ventana debe cerrarse automáticamente tras 10 segundos. 
• En la ventana principal, se mostrará la cuenta atrás con los segundos que faltan para que la ventana emergente se cierre.
*/

var ventanaNueva;
var $Cuenta = document.getElementById("cuenta");

function abrirVentana() {
  ventanaNueva = window.open(
    "",
    "ventana1",
    "width=400, height=200, top=100, left=300"
  );

  ventanaNueva.document.body.innerHTML = "Esto es un mensaje";

  cuentaAtras(10);
}

function cuentaAtras(pSegundos) {
  const intervalo = setInterval(() => {
    $Cuenta.innerHTML = `${pSegundos}`;
    pSegundos--;

    if (pSegundos == -1) {
      ventanaNueva.close();
      clearInterval(intervalo);
    }
  }, 1000);
}
