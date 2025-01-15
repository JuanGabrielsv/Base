//1. Crear una página cuyo código JS cree dos fechas: una actual y otra con vuestro cumpleaños:
let fechaActual = new Date();
let fechaCumpleanos = new Date(1983, 4, 26);
//1. Imprimir las dos fechas por pantalla con la información completa.
console.log(fechaActual);
console.log(fechaCumpleanos);
//2. Extraer su año e imprimirlos por pantalla.
console.log(fechaActual.getFullYear());
console.log(fechaCumpleanos.getFullYear());
//3. Actualizar el año de la fecha actual por la del año pasado. Escribir la fecha con un formato más legible.
fechaActual.setFullYear(2023);
console.log(fechaActual.toLocaleDateString());
//4. Escribir por pantalla la fecha actual obteniendo el día, el mes y el año por separado y concatenando el símbolo “/”: (dd/mm/yyyy).
console.log(fechaActual.getDate() + "/" + (fechaActual.getMonth() + 1) + "/" + fechaActual.getFullYear());

