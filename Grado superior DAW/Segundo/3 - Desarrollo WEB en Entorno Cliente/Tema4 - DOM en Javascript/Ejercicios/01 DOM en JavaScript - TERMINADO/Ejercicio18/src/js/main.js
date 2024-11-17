/*
EJERCICIO18.

• Sobre el ejercicio anterior, cuando pulsemos el botón, añadir desde Javascript una columna nueva, que será un checkbox. 
• Cada checkbox tiene un id diferente: “checkbox1”, “checkbox2”,… y un name con el valor “marcar.”
*/

window.addEventListener('DOMContentLoaded', () => {

    const $tBody = document.getElementById('cuerpoTabla');

    /* CREAMOS EL ARRAY DE 4 OBJETOS LITERALES */
    const arrayObjetos = [
        {
            id: 1,
            nombre: "Perica",
            precio: 2.25,
            código: "080K025G"
        },
        {
            id: 2,
            nombre: "Laura",
            precio: 1.99,
            código: "033J015G"
        },
        {
            id: 3,
            nombre: "Mamen",
            precio: 0.66,
            código: "113R615X"
        },
        {
            id: 4,
            nombre: "Paco",
            precio: 15.21,
            código: "666Q115G"
        }
    ];

    for (let i = 0; i < arrayObjetos.length; i++) {
        const $fila = document.createElement('tr');

        for (const key in arrayObjetos[i]) {

            if (key == "id") {
                $fila.setAttribute('id', `${arrayObjetos[i][key]}`);
                continue;
            } else {
                const $celda = document.createElement('td');
                $celda.textContent = arrayObjetos[i][key];
                $fila.appendChild($celda);
            }

        }
        $tBody.appendChild($fila);
    }

    /*EJERCICIO18.

• Sobre el ejercicio anterior, cuando pulsemos el botón, añadir desde Javascript una columna nueva, que será un checkbox. 
• Cada checkbox tiene un id diferente: “checkbox1”, “checkbox2”,… y un name con el valor “marcar.”*/

    const $botonAnadir = document.getElementById('boton-anadir');
    const $nuevaFila = document.createElement('th');
    $nuevaFila.textContent = 'hola';

    $botonAnadir.addEventListener('click', () => {
        const $trTheadTable = document.querySelector('table thead tr');
        $trTheadTable.insertBefore($nuevaFila, $trTheadTable.firstChild);

        $filasTbody = document.querySelectorAll('table tbody tr');

        $filasTbody.forEach((element, index) => {
            const $nuevaCelda = document.createElement('td');
            const $checkbox = document.createElement('input');
            $checkbox.type = 'checkbox';
            $checkbox.id = `chekbox${index + 1}`;
            $checkbox.name = 'marcar';
            $nuevaCelda.insertBefore($checkbox, $nuevaCelda.firstChild);
            element.insertBefore($nuevaCelda, element.firstChild);
        });

    });
});