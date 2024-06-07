const VALOR_EURO = 166.386;

export function mostrarMenu() {
  console.log(
    "*** MENÚ ***\n1 - Pasar de Pesetas a Euros.\n2 - Pasar de Euros a Pesetas.\n3 - Salir.\n"
  );
}

export function opcionElegida() {
  return Number(prompt());
}

export function pedirCantidad() {
  console.log("Introduce la cantidad:");
  return Number(prompt());
}

export function pasarAPesetas(pesetas) {
  return pesetas / VALOR_EURO;
}

export function pasarAEuros(euros) {
    return euros * VALOR_EURO;
}
