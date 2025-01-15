/*
EJERCICIO11

• Realizar los apartados siguientes creando todo el código desde JavaScript:

A. Dado un array con las estaciones del año, crear una lista con cada uno de los valores del array. 
• Crear también un titulo en h2 ‘Estaciones del año’. (Utilizar createElement).
B. Dado un array con los continentes, crear ahora la lista utilizando innerHTML.
*/

window.addEventListener('DOMContentLoaded', () => {

    const arrayEstaciones = ['Invierno', 'Verano', 'Otoño', 'Invierno'];
    const arrayContinentes = ['Europa', 'América', 'Asia', 'África', 'Oceanía'];
    let elementoUl = document.createElement('ul');
    let elementoUl2 = document.createElement('ul');
    let elementoH2 = document.createElement('h2');
    let elementoH22 = document.createElement('h2');

    document.body.appendChild(elementoH2).textContent = 'Estaciones del año';
    document.body.appendChild(elementoUl).setAttribute('id', 'ul');

    let ulElemento = document.getElementById('ul');

    for (let i = 0; i < arrayEstaciones.length; i++) {
        let elementoLi = document.createElement('li');
        ulElemento.appendChild(elementoLi).textContent = arrayEstaciones[i];
    }

    document.body.appendChild(elementoH22).textContent = 'Continentes';
    document.body.appendChild(elementoUl2).setAttribute('id', 'ul2');
    
    let ulElemento2 = document.getElementById('ul2');

    for (let i = 0; i < arrayContinentes.length; i++) {
        let elementoLi2 = document.createElement('li');
        ulElemento2.appendChild(elementoLi2).textContent = arrayContinentes[i];
    }

});

