/*
EJERCICIO 37

Realizar un programa que calcule los descuentos a aplicar a una compra según los
siguientes criterios:

    - Si la compra es superior a 100 unidades, aplicar un 40% de descuento.
    - Si la compara está entre 25 y 100 unidades, 20% de descuento
    - Si la compra está entre 10 y 24 unidades, realizar un 10% de descuento.
    - Si la compra es inferior a 10 unidades, no se aplica descuento.

• Se nos pedirá por teclado Precio y Unidades. 
• Se obtendrá como resultado el Subtotal a pagar, el Descuento aplicado y el Total a pagar.

Por ejemplo, si indicamos precio 100 y unidades 50, el resultado será:

    - Subtotal = 100 x 50 = 5000 euros
    - Descuento = 20% de 5000 = 1000 euros
    - Total = 5000 – 1000 = 4000 euros

(Trabajaremos con cifras decimales) 
*/

const DESCUENTO_40 = 0.40;
const DESCUENTO_20 = 0.20;
const DESCUENTO_10 = 0.10;
const CIEN_UNIDADES = 100;
const VEINTICINCO_UNIDADES = 25;
const DIEZ_UNIDADES = 10;
const SALIR = null;
const INICIAR_PROGRAMA = "1";
const CIEN = 100;

let vOpcion;
let vPrecio;
let vUnidades;
let vPrecioTotalSinDescuento;
let vDescuento;
let vDescuentoAplicado;

while (vOpcion !== SALIR) {
    vOpcion = prompt("Bienvenido al programa que te aplica descuento según las unidades que te lleves.\n\n(1) Iniciar el programa.\n(Botón Cancelar) Salir.\n");

        if (vOpcion === SALIR) {
            alert("Cerrando Programa");
            break;

        } else if (vOpcion === INICIAR_PROGRAMA) {            
            vPrecio = prompt("Introduce el precio por unidad");
            vUnidades = prompt("¿Cuántas unidades llevas?");
            vPrecioTotalSinDescuento = vPrecio * vUnidades;

                if (vUnidades > CIEN_UNIDADES) {
                    vDescuento = vPrecioTotalSinDescuento * DESCUENTO_40;
                    vDescuentoAplicado = DESCUENTO_40;

                } else if (vUnidades >= VEINTICINCO_UNIDADES && vUnidades <= CIEN_UNIDADES) {
                    vDescuento = vPrecioTotalSinDescuento * DESCUENTO_20;
                    vDescuentoAplicado = DESCUENTO_20;

                } else if (vUnidades < VEINTICINCO_UNIDADES && vUnidades >= DIEZ_UNIDADES) {
                    vDescuento = vPrecioTotalSinDescuento * DESCUENTO_10;
                    vDescuentoAplicado = DESCUENTO_10;

                } else {
                    vDescuento = 0;
                    vDescuentoAplicado = 0;
                }
            
            alert("- Subtotal = " + vUnidades + " x " + vPrecio + " = " + vPrecioTotalSinDescuento 
                + "\n- Descuento = " + (vDescuentoAplicado * CIEN) + "% de " + vPrecioTotalSinDescuento + " = " + vDescuento 
                + "\n- Total = " + vPrecioTotalSinDescuento + " - " + vDescuento + " = " + (vPrecioTotalSinDescuento - vDescuento) + " euros");

        } else {
            alert("La opción introducida no es válida");
        }
}