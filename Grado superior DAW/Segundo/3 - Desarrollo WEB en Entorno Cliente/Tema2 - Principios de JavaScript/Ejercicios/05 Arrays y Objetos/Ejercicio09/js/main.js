/* 9. Crear un objeto literal llamado factura con las propiedades:

    1. numero, cliente, divisa, subtotal e IVA, dándole valores a cada uno de ellos.
    2. Tendrá también un método que calcula el total ( subtotal + iva).
    3. Imprimir por consola: La factura X(numero) tiene un importe de Y(subtotal) Z(divisa).
*/

let factura = {
    numero: 1,
    cliente: "pepe",
    divisa: "€",
    subtotal: 12.55,
    iva: 21,

    total: function () {
        let ivaAPagar = (this.iva / 100) * this.subtotal;
        return this.subtotal + ivaAPagar;
    }

}

document.body.innerHTML = `La Factura número ${factura.numero} tiene un importe ${factura.total()}${factura.divisa}`;

