/*const boton1 = document.getElementById('boton1');
const boton2 = document.getElementById('boton2');
var ventana1;
var boton3;

window.addEventListener("DOMContentLoaded", () => {

    boton1.addEventListener('click', () => {
        ventana1 = window.open('', 'ventana1', 'width=600, height=600, top=200, left=2600');
    })

    boton2.addEventListener('click', () => {
        boton3 = ventana1.document.createElement('button');

        console.log(boton3);
        ventana1.focus();
        ventana1.document.body.style.backgroundColor = 'blue';
        ventana1.document.body.appendChild(boton3);

    });
})*/

/*const boton1 = document.getElementById('boton1');
const boton2 = document.getElementById('boton2');
let ventana1;

window.addEventListener("DOMContentLoaded", () => {
    boton1.addEventListener('click', () => {
        ventana1 = window.open('', 'ventana1', 'width=600, height=600, top=200, left=2600');
    });

    boton2.addEventListener('click', () => {
        if (ventana1) {
            const boton3 = document.createElement('button');
            boton3.textContent = 'Soy un botón';
            boton3.setAttribute('id', 'boton3');

            console.log(boton3);
            ventana1.focus();
            ventana1.document.body.style.backgroundColor = 'blue';
            ventana1.document.body.appendChild(boton3);

            boton3.addEventListener('click', () => {
                window.opener.document.body.style.backgroundColor = 'red';
            })

        } else {
            alert('Primero abre la ventana con el botón 1.');
        }
    });
});*/

const boton1 = document.getElementById('boton1');
const boton2 = document.getElementById('boton2');
const boton4 = document.getElementById('boton4');
let ventana1;

window.addEventListener("DOMContentLoaded", () => {

    boton1.addEventListener('click', () => {
        ventana1 = window.open('', 'ventana1', 'width=600, height=600, top=200, left=2600');
    });

    boton2.addEventListener('click', () => {

        if (ventana1 && !ventana1.closed) {

            ventana1.focus();
            const boton3 = ventana1.document.createElement('button');
            boton3.textContent = 'Soy un botón';
            boton3.setAttribute('id', 'boton3');
            ventana1.document.body.style.backgroundColor = 'blue';

            if (!ventana1.document.getElementById('boton3')) {
                ventana1.document.body.appendChild(boton3);
            }

            boton3.addEventListener('click', () => {
                ventana1.opener.document.body.style.backgroundColor = 'red';
            });

        } else {
            alert('Primero abre la ventana con el botón 1 o asegúrate de que siga abierta.');
        }

    });

    boton4.addEventListener('click', () => {

        if (ventana1 && !ventana1.closed) {
            ventana1.close();
        } else {
            alert('no hay ventana abierta');
        }

    });

});

