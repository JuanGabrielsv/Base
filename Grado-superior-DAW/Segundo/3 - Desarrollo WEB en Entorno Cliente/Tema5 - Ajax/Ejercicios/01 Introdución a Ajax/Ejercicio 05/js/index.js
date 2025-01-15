/*------------------------------------------------------------------------------------
EJERCICIO 05 
1. Crear un fichero json en vuestro proyecto con nombre data.json. 
2. Crear un objeto literal students que será un array de objetos literales. 
3. Dentro de cada objeto habrá información de cada alumno: 
    id: numero
    nombre: cadena
    notas: array de 4 notas. 
4. Crear datos para 5 alumnos en el fichero.
5. Crear un fichero js que haga una llamada ajax a dicho fichero
6. Crear una tabla con la información de los alumnos con 4 columnas: 
    ID
    Nombre
    Notas (que aparecerán separadas por comas)
    Media de notas
---------------------------------------------------------------------------------------*/
inicioPrograma = () => {

    const tabla = document.getElementById('studentTable');
    let suma;
    let fila;
    let media;

    // MODO CON XMLHttpResquest
    const xhr = new XMLHttpRequest();
    let datos;

    xhr.open('GET', 'data.json', true);
    xhr.send();

    xhr.addEventListener('readystatechange', () => {
        if (xhr.readyState !== 4) {
            return;
        }

        if (xhr.status >= 200 && xhr.status < 300) {
            datos = JSON.parse(xhr.responseText);
            datos.students.forEach(element => {
                fila = document.createElement('tr');
                fila.appendChild(document.createElement('td')).textContent = element.id;
                fila.appendChild(document.createElement('td')).textContent = element.nombre;
                fila.appendChild(document.createElement('td')).textContent = element.notas;

                suma = element.notas[0];

                for (let i = 1; i < element.notas.length; i++) {
                    suma += element.notas[i];
                }

                media = suma / element.notas.length;

                fila.appendChild(document.createElement('td')).textContent = media;

                document.querySelector('tbody').appendChild(fila);

            });
        } else {
            return console.log('Error:', xhr.status);
        }
    })

    // MODO CON FETCH
    /*
    fetch('data.json')
        .then(response => response.json())
        .then(data => {
            console.log(data);
            data.students.forEach(element => {
                fila = document.createElement('tr');
                fila.appendChild(document.createElement('td')).textContent = element.id;
                fila.appendChild(document.createElement('td')).textContent = element.nombre;
                fila.appendChild(document.createElement('td')).textContent = element.notas;

                suma = element.notas[0];

                for (let i = 1; i < element.notas.length; i++) {
                    suma += element.notas[i];
                }

                media = suma / element.notas.length;

                fila.appendChild(document.createElement('td')).textContent = media;

                document.querySelector('tbody').appendChild(fila);

            });
        })
        .catch(error => {
            console.log('Error: ', error)
        })
    */




}

window.addEventListener('DOMContentLoaded', inicioPrograma);