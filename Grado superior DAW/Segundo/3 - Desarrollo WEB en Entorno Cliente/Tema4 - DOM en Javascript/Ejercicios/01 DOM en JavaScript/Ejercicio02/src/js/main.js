/*
2. Dado el siguiente código:

    <div id="div1">
        <p id="p1">Soy el primer parrafo</p>
        <p id="p2">Soy el segundo parrafo</p>
    </div>

• Añadir un tercer elemento <p> al final, con el texto: “Soy el nuevo” y añadirle un id.
*/

window.addEventListener('DOMContentLoaded', () => {

    let elementoP = document.createElement('p');

    elementoP.setAttribute("id","p3");

    document.getElementById('div1').appendChild(elementoP).textContent = 'Soy el nuevo';

});

