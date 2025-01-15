window.addEventListener('DOMContentLoaded', (e) => {
    const botonConsulta = document.createElement('button');
    botonConsulta.textContent = 'Cargar personajes';
    document.body.appendChild(botonConsulta);

    botonConsulta.addEventListener('click', () => {

        // FORMA CON ASYNC AWAIT


        /* //FORMA CON XHTMLRequest
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://rickandmortyapi.com/api/character/', true)
        xhr.send();

        xhr.addEventListener('readystatechange', (e) => {
            if (xhr.readyState !== 4) {
                return;
            }

            if (xhr.status >= 200 && xhr.status < 300) {
                console.log('Éxito');
                let json = JSON.parse(xhr.responseText);
                console.log(json);

                console.log(json.results[0].image)

                const tabla = document.createElement('table');
                const tHead = document.createElement('thead');
                const trThead = document.createElement('tr');
                const thThead = document.createElement('th');
                thThead.textContent = 'Personajes Rick and Morty';
                const tBody = document.createElement('tbody');

                tabla.appendChild(tHead);
                tHead.appendChild(trThead);
                trThead.appendChild(thThead);

                let contador = 0;

                json.results.forEach(element => {
                    let div = document.createElement('div');
                    div.setAttribute('class', 'character-row');
                    let trPersonajesFila = document.createElement('tr');
                    div.appendChild(trPersonajesFila);

                    for (let i = 0; i < json.results.length; i++) {
                        let divCaracter = document.createElement('div');
                        let tdCaracter = document.createElement('td');
                        tdCaracter.appendChild(divCaracter);
                        let imageCaracter = document.createElement('img');
                        imageCaracter.src = json.results[i].image;
                        divCaracter.appendChild(imageCaracter);
                        trPersonajesFila.appendChild(tdCaracter);

                        contador++;

                        if (contador == 3) {
                            contador = 0;
                            break;
                        }
                    }
                    tBody.appendChild(div);
                });
                tabla.appendChild(tBody);
                document.body.appendChild(tabla);

            } else {
                console.log('error');
                let mensaje = xhr.statusText || 'Ocurrió un error';
            }
        }); */
    });
});