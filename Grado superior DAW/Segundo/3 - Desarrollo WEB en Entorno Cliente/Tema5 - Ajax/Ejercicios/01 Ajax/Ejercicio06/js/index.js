/*
EJERCICIO 06.

1. Insertar un nuevo post en https://jsonplaceholder.typicode.com/posts.
2. El campo id no hace falta que lo indiqueis.
3. En html tenéis una etiqueta div para poner el conjunto de datos insertados. 
4. Hacer la petición con Fetch y await. 
*/
inicioPrograma = () => {

    const div1 = document.getElementById('conjunto-insertado');
    const datosParaInsertar = {
        userId: 83,
        title: 'Datos insertados',
        body: 'Que pasa tomasa que te va la guasa'
    }

    fetch('https://jsonplaceholder.typicode.com/posts', {
        method: 'POST',
        body: JSON.stringify(datosParaInsertar),
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        }
    })
        .then((response) => response.json())
        .then((json) => console.log(json));

};

window.addEventListener('DOMContentLoaded', inicioPrograma);