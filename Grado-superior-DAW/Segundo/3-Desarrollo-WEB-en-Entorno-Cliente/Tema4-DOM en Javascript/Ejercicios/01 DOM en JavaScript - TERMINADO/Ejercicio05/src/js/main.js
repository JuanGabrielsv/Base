/*
EJERCICIO 05.

• Dado el código anterior, reemplazar el primer <p> por otro elemento <p> con el texto: ‘reemplazado’. 
    
*/

window.addEventListener('DOMContentLoaded', () => {
    const $primerP = document.body.children[0];
    let $nuevoP = document.createElement('p');
    $nuevoP.textContent = 'reemplazado';
    document.body.replaceChild($nuevoP, $primerP);
});