/*
EJERCICIO 04.

• Dada la api: opentdb.com/api.php?amount=5&type=multiple
• Mostrar una lista con todas las pistas que aparecen:
    Category
    question
    correct_answer.

• La etiqueta ul está creada en el html, las li no.
• Estilos para los li (poner en js): 
    backgroundColor: #e9e9e9
    padding: 10px
    margin: 5px 0
    border: 1px solid #ccc
    borderRadius: 4px
    fontFamily: Arial, sans-serif
    color: #333.

• Poner la correct_answer en negrita.
• Al pasar por encima de alguna li, el color de fondo sea: #d1d1d1
*/
inicioPrograma = () => {

    //FORMA CON FETCH
    // Creamos la instancia del elemento ul 'lista1'
    const lista1 = document.getElementById('lista1');

    // Iniciamos la petición al servidor API
    fetch('https://opentdb.com/api.php?amount=5&type=multiple')
        .then(datos => datos.json())
        .then(datos => {

            // Presentamos los datos 
            datos.results.forEach(element => {
                let li = document.createElement('li');

                li.style.padding = '10px';
                li.style.margin = '5px 0';
                li.style.border = '1px solid #ccc';
                li.style.borderRadius = '4px';
                li.style.fontFamily = 'Arial, sans-serif';
                li.style.color = '#333';
                li.innerHTML = `Categoría: ${element.category} <br>`;
                li.innerHTML += `Pregunta: ${element.question} <br>`;
                li.innerHTML += `Respuesta: <b>${element.correct_answer}</b>`;

                lista1.appendChild(li);

                li.addEventListener('mouseover', () => {
                    li.style.backgroundColor = '#d1d1d1';
                });

                li.addEventListener('mouseout', () => {
                    li.style.backgroundColor = 'white';
                });

            });

        })
        .catch(error => console.log('Error: ', error));

    /*
    // Creamos la instacia del elemento ul 'lista1'
    const lista1 = document.getElementById('lista1');
    let datosDevueltos;

    // Forma con XMLHttpRequest.
    // Creamos la instacia de la petición XMLHttpResquest().
    const xhr = new XMLHttpRequest();

    // Configuramos el tipo de solicitud, dirección del servidor y async.
    xhr.open('GET', 'https://opentdb.com/api.php?amount=5&type=multiple', true);
    xhr.send();

    // Configuramos el evento de petición para controlar que la petición se hace correctamente o si devuelve un error.
    xhr.addEventListener('readystatechange', () => {

        // Si la solicitud se está realizando correctamente salimos del evento para que continue con la petición, si llega al estado 4 continua.
        if (xhr.readyState !== 4) {
            return;
        }

        // Si la solicitud ha alcanzado el nivel 4, comprobamos que el estado devuelto sea un ok y guardamos los datos recibidos
        if (xhr.status >= 200 && xhr.status < 300) {
            datosDevueltos = JSON.parse(xhr.responseText);
        } else {
            return console.log('error');
        }

        // Presentamos los datos 
        datosDevueltos.results.forEach(element => {
            let li = document.createElement('li');

            li.style.padding = '10px';
            li.style.margin = '5px 0';
            li.style.border = '1px solid #ccc';
            li.style.borderRadius = '4px';
            li.style.fontFamily = 'Arial, sans-serif';
            li.style.color = '#333';
            li.innerHTML = `Categoría: ${element.category} <br>`;
            li.innerHTML += `Pregunta: ${element.question} <br>`;
            li.innerHTML += `Respuesta: <b>${element.correct_answer}</b>`;

            lista1.appendChild(li);

            li.addEventListener('mouseover', () => {
                li.style.backgroundColor = '#d1d1d1';
            });

            li.addEventListener('mouseout', () => {
                li.style.backgroundColor = 'white';
            });

        });

    });
    */

}

window.addEventListener('DOMContentLoaded', inicioPrograma);