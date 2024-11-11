/*
EJERCICIO03

• Añadir otro elemento <p> con el texto: “Soy el primero ahora”, delante del primer p.
*/

window.addEventListener('DOMContentLoaded', () => {

    let elementoP = document.createElement('p');
    let elementoPPrimero = document.createElement('p');

    elementoP.setAttribute("id","p3");
    

    document.getElementById('div1').appendChild(elementoP).textContent = 'Soy el nuevo';
    document.getElementById('')

});

