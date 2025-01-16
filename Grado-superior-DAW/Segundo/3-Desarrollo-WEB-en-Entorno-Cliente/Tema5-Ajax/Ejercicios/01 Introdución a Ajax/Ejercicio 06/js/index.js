/*
EJERCICIO 06.

1. Insertar un nuevo post en https://jsonplaceholder.typicode.com/posts.
2. El campo id no hace falta que lo indiqueis.
3. En html tenéis una etiqueta div para poner el conjunto de datos insertados. 
4. Hacer la petición con Fetch y await. 
*/
const datosParaInsertar = {
    userId: 83,
    title: 'Datos insertados',
    body: 'Que pasa tomasa que te va la guasa'
}

inicioPrograma = () => {

    introducirDatos('https://jsonplaceholder.typicode.com/posts', datosParaInsertar);

};

async function introducirDatos(url, objeto) {
    const div1 = document.getElementById('conjunto-insertado');
    try {
        const response = await fetch(url, {
            method: 'POST',
            body: JSON.stringify(objeto),
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
            }
        });
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        div1.innerHTML = `<pre>${JSON.stringify(data, null, 2)}</pre>`;
    } catch (error) {
        console.error('Error al realizar la solicitud:', error);
    }
}

window.addEventListener('DOMContentLoaded', inicioPrograma);