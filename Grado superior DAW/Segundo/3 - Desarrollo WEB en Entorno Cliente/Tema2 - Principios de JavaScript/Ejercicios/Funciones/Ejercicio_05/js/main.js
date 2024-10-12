/*
5. Crear una función flecha que permita dibujar una tabla en una página web. 

• Como parámetros tendrá el numero de filas y de columnas: Por defecto 10 y 4. 
• También tendrá un tercer parámetro que permite indicar el color del borde, que por defecto será negro.
• La tabla se crea con un borde de 1 pixel entre cada celda. 
• El borde exterior tendrá 3 pixeles y será del mismo color que el borde de las celdas.
• La tabla ocupará toda la anchura de la página.

1) Llamar a la función para crear la tabla con borde negro, de 10 filas y 4 columnas.
2) Llamarla de nuevo para generar la table de 20 filas, 10 col con borde negro.
3) Dibujar 10 tablas de 5 filas y 4 columnas con borde verde.
*/

let numColumnas;
let numFilas;
let colorBorde;
let bordeEntreCadaCelda = "1px";
let bordeExterior = "3px";
let contadorTablas = 0;

let dibujarTabla = (numFilas = 10, numColumnas = 4, colorBorde = "black") => {

    contadorTablas++;

    document.body.innerHTML += `<table id="tablita${contadorTablas}" style = "border: ${colorBorde} 3px solid; width:100%;"></table>`;
    document.getElementById(`tablita${contadorTablas}`).innerHTML += `<tbody id="bodisito${contadorTablas}"></tbody>`;

    for (let i = 0; i < numFilas; i++) {
        document.getElementById(`bodisito${contadorTablas}`).innerHTML += `<tr id="filita${contadorTablas}${i}"></tr>`;
        for (let j = 0; j < numColumnas; j++) {
            document.getElementById(`filita${contadorTablas}${i}`).innerHTML += `<td style = "border: black 1px solid; height:10px;"></td>`;
        }
    }
}

dibujarTabla(10, 4, "black");
document.body.innerHTML += `<br>`;

dibujarTabla(20, 10);
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;

dibujarTabla(5, 4, "green");
document.body.innerHTML += `<br>`;






console.log(contadorTablas);



