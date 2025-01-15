/* 12. Crea un programa que genere una fecha aleatoria en el pasado. El programa debe mostrar la fecha generada
en la consola, en la página y en una alerta.  El rango de la fecha aleatoria será entre el año 2000 y el año
actual. */

let anoActual = new Date().getFullYear();
let randomAno = parseInt(Math.random() * (2024 - 2000 + 1) + 2000);
let randomMes = Math.floor(Math.random() * 12);
let randomDia;

if (randomMes === 1) {
    randomDia = Math.floor(Math.random() * 28) + 1;
    if (randomAno % 4 === 0) {
        randomDia = Math.floor(Math.random() * 29) + 1;
    }
} else if (randomMes === 3 || randomMes === 5 || randomMes === 8 || randomMes === 10) {
    randomDia = Math.floor(Math.random() * 30) + 1;
} else {
    randomDia = Math.floor(Math.random() * 31) + 1;
}

let randomFecha = new Date(randomAno, randomMes, randomDia);

document.write(randomFecha.toLocaleString());


