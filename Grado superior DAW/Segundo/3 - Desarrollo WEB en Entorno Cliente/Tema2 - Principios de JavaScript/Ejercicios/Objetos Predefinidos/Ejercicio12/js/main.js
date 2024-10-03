/* 12. Crea un programa que genere una fecha aleatoria en el pasado. El programa debe mostrar la fecha generada
en la consola, en la página y en una alerta.  El rango de la fecha aleatoria será entre el año 2000 y el año
actual. */

let anoActual = new Date().getFullYear();
let randomAno = parseInt(Math.random() * (2024 - 2000 + 1) + 2000);
let randomMes = Math.floor(Math.random() * 12);
let fechaRandom = new Date(randomAno, randomMes)

