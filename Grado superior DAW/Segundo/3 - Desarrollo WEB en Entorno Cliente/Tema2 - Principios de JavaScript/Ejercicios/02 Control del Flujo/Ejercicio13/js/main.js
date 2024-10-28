/*
EJERCICIO13

• Calcular y mostrar la media de 3 números leídos por el teclado. 
• Si el promedio es mayor o igual a 7 mostrar por pantalla ‘Promocionado’.
*/

function calcularMedia(numero1, numero2, numero3) {
  let media = (numero1 + numero2 + numero3) / 3;
  return media;
}

function promocionado(parametro) {
  if (parametro >= 7) {
    document.body.innerHTML += ` Promocionado`;
  }
}

function comenzarPrograma() {
  let numero1 = Number(prompt("Introduce el primer número: "));
  let numero2 = Number(prompt("Introduce el segundo número: "));
  let numero3 = Number(prompt("Introduce el tercer número: "));

  document.body.innerHTML = `La media es: ${calcularMedia(numero1, numero2, numero3).toFixed(2)}`;

  promocionado(calcularMedia(numero1, numero2, numero3));
}

comenzarPrograma();
