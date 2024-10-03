/* 3. Crear un programa que pida al usuario dos números: el día y el mes de tu cumpleaños, y saque todos los
años en que tu cumpleaños va a caer en domingo desde este año hasta el año 2100.
NOTA: los meses comienzan por 0. */

let diaCumpleanos = Number(prompt("Introduce el día de tu cumpleaños"));
let mesCumpleanos = Number(prompt("Introduce el mes de tu cumpleaños")) - 1;
let anoActual = new Date().getFullYear();

for (let ano = anoActual; ano <= 2100; ano++) {
    var fechaCumpleano = new Date(ano, mesCumpleanos, diaCumpleanos);
    if (fechaCumpleano.getDay() === 0) {
        document.write(fechaCumpleano.getFullYear() + `<br>`);
    }
}

console.log(fechaCumpleano.getDay());
console.log(fechaCumpleano.getDate());


