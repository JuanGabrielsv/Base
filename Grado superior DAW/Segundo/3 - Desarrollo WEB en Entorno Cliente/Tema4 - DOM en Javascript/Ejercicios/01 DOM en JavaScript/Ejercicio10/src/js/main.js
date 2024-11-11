/*
EJERCICIO10 
• Dada la siguiente lista en html: 

    <ul id="lista">
        <li>Lorem ipsum dolor sit amet</li>
        <li>Consectetuer adipiscing elit</li>
        <li>Sed mattis enim vitae orci</li>
        <li>Phasellus libero</li>
        <li>Maecenas nisl arcu</li>
    </ul>

• Añadir un botón que al pulsarse añada un elemento nuevo li a la
lista.
*/

window.addEventListener('DOMContentLoaded', () => {
    const boton = document.getElementById('boton');
    const lista = document.getElementById('lista');

    boton.addEventListener('click', () => {
        let listaNueva = document.createElement('li');
        lista.appendChild(listaNueva).textContent = 'nueva li';
    });
    
});

