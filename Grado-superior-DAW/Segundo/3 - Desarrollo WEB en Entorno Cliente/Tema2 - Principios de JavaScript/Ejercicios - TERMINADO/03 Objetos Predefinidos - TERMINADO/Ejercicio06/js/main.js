//6. Escribir por pantalla una representación textual con el nombre completo del día de la semana en español.

let fechaActual = new Date(1983, 4, 26);

if (fechaActual.getDay() == 0) {
    document.write(`Domingo <br>`);
} else if (fechaActual.getDay() == 1) {
    document.write(`Lunes <br>`);
} else if (fechaActual.getDay() == 2) {
    document.write(`Martes <br>`);
} else if (fechaActual.getDay() == 3) {
    document.write(`Miércoles <br>`);
} else if (fechaActual.getDay() == 4) {
    document.write(`Jueves <br>`);
} else if (fechaActual.getDay() == 5) {
    document.write(`Viernes <br>`);
} else {
    document.write(`Sábado <br>`);
}