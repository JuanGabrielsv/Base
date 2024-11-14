/*
EJERCICIO16.

• Crear una tabla desde JavaScript con 2 filas y dos columnas.
• El texto de cada celda será: ‘Posición: ij’, donde i es la fila y la j la columna. 
• La primera columna tendrá un fondo de color rojo. 
• La segunda columna tendrá un fondo amarillo y el texto de esta columna está en negrita.
*/

window.addEventListener('DOMContentLoaded', () => {

    /* CREAMOS EL ELEMENTO TABLA */
    let $tabla = document.createElement('table');
    $tabla.style.border = '1px solid';

    /* CREAMOS LAS FILAS Y COLUMNAS */
    for (let i = 1; i <= 2; i++) {
        const fila = document.createElement('tr');
        for (let j = 0; j < 2; j++) {
            const columna = document.createElement('td');
            columna.textContent = `Posición: ${i}${j}`;
            fila.appendChild(columna);
            if (j == 0) {
                columna.style.backgroundColor = 'red';
            } else {
                columna.style.backgroundColor = 'yellow';
                columna.style.fontWeight = 'bold';
            }
        }
        $tabla.appendChild(fila);
    }
    document.body.appendChild($tabla);

});