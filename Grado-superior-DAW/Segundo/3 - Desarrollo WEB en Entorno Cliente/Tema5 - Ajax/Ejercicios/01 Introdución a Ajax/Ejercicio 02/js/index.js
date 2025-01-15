/* EJERCICIO 02
• Crear una página html con un <H1> POSTS </H1> y un botón. 
• Cuando pulsemos un botón vamos a llamar a la api:
    jsonplaceholder.typicode.com/posts
• Pintar el resultado en una tabla. Sacar en cada fila el title y el body, cada uno en una columna diferente. */

let json;
let fila;
const tabla = document.createElement('table');
const tabla_THead = document.createElement('thead');
const tabla_TBody = document.createElement('tbody');
const tabla_THead_Tr = document.createElement('tr');
const tabla_THead_Th_Title = document.createElement('th');
const tabla_THead_Th_Body = document.createElement('th');

tabla_THead_Th_Body.textContent = 'Body';
tabla_THead_Th_Title.textContent = 'Title';

tabla_THead_Tr.appendChild(tabla_THead_Th_Title);
tabla_THead_Tr.appendChild(tabla_THead_Th_Body);
tabla_THead.appendChild(tabla_THead_Tr);
tabla.appendChild(tabla_THead);
tabla.appendChild(tabla_TBody);

cargarPost = () => {
    //Creamos la instacia del servicio para la consulta
    const xhr = new XMLHttpRequest();

    // Preparamos la consulta: 'TIPO DE REQUEST', 'DIRECCIÓN DE LA API', 'ASYNC'.
    xhr.open("GET", "https://jsonplaceholder.typicode.com/posts", true);

    xhr.addEventListener("readystatechange", (e) => {
        if (xhr.readyState !== 4) {
            console.log('readyState: ' + xhr.readyState);
            return;
        }

        if (xhr.status >= 200 && xhr.status < 300) {
            console.log('Status: ' + xhr.status);
            json = JSON.parse(xhr.responseText);

            //Forma de pintar la tabla con FOREACH */

            /*json.forEach(element => {
                fila = document.createElement('tr');

                let tdTitulo = document.createElement('td');
                tdTitulo.textContent = element.title;
                fila.appendChild(tdTitulo);

                let tdBody = document.createElement('td');
                tdBody.textContent = element.body;
                fila.appendChild(tdBody);
                
                tabla_TBody.append(fila);
            });*/

            for (let i = 0; i < json.length; i++) {
                fila = document.createElement('tr');
                fila.appendChild(document.createElement('td')).textContent = json[i].title;
                fila.appendChild(document.createElement('td')).textContent = json[i].body;
                tabla_TBody.appendChild(fila);
            }
        } else {
            alert('Error de red');
        }

    });
    xhr.send();
    document.body.append(tabla);
}
inicio = () => {
    document.getElementById('boton-llamar').addEventListener('click', cargarPost);
}
window.addEventListener("DOMContentLoaded", inicio);