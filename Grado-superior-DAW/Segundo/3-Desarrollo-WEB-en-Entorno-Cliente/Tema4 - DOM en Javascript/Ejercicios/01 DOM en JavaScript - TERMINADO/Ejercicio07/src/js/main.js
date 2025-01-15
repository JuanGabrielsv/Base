/* 
EJERCICIO 07. 

• Crear 3 párrafos con sus id individuales. Desde JavaScript borrar el segundo de los párrafos.
*/

window.addEventListener('DOMContentLoaded', () => {
    const $hijosDeBody = document.body.children;
    document.body.removeChild($hijosDeBody[1]);
});

