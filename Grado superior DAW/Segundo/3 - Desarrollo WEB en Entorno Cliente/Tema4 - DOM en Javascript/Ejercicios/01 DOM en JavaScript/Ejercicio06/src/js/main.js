/* 
EJERCICIO 07. 

• Crear 3 párrafos con sus id individuales. Desde JavaScript borrar el segundo de los párrafos.
*/

window.addEventListener('DOMContentLoaded', () => {
    let $parrafoP = document.createElement('p');
    $parrafoP.textContent = 'Un texto cualquiera';
    document.body.appendChild($parrafoP);
});