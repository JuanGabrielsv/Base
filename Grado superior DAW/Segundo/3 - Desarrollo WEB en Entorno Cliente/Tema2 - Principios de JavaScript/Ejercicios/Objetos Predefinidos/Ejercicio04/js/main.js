// 4. Crear un programa que muestre la fecha actual en distintos formatos:
let fechaUno = new Date();

//1. dd/mm/yyyy.
console.log(fechaUno.toLocaleDateString());

//2. Dia de la semana mes día año, en inglés: Ej Mon Sep 30 2024.
document.write(fechaUno.toDateString());

//3. dd/mm/yyyy hh:mm:ss.
document.write(`<br>` + fechaUno.toLocaleString());

//4. Hh:mm:ss
document.write(`<br>` + fechaUno.toLocaleTimeString());