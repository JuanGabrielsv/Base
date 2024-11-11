/*
1. Dado el siguiente código:

    <div id="myDIV">
        <p>First p element</p>
        <p>Second p element</p>
    </div>

• Poner el fondo del primer <p> de color amarillo.
• Poner el fondo del segundo <p> de color naranja.
• Poner el color rojo a todos los elementos p
*/

window.addEventListener('DOMContentLoaded', () => {
    const div = document.getElementById('myDIV');

    console.log(div.childNodes);
    console.log(div.children);
    console.log(div.firstChild);
    console.log(div.firstElementChild);
    console.log(div.firstElementChild);
    console.log(div.firstElementChild.outerText);
    console.log(div.firstElementChild.textContent);

    div.firstElementChild.style.backgroundColor = 'yellow';
    div.lastElementChild.style.backgroundColor = 'orange';

    for (const element of div.getElementsByTagName('p')) {
        element.style.color = 'red';
    }
    
});