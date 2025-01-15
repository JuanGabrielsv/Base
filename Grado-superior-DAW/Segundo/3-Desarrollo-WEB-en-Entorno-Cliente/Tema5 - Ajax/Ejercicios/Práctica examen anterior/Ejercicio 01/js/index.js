window.addEventListener('DOMContentLoaded', () => {

    const botonObtenerReceta = document.createElement('button');
    botonObtenerReceta.textContent = 'Obtener Receta Aleatoria';
    document.body.appendChild(botonObtenerReceta);

    botonObtenerReceta.addEventListener('click', () => {

        // FORMA CON ASYNC
        async function consulta() {
            try {
                const response = await fetch('https://www.themealdb.com/api/json/v1/1/random.php');
                if (!response.ok) {
                    throw new Error(`HTTP error! status:${response.status}`);
                }
                const data = await response.json();

                let h2 = document.getElementsByTagName('h2');
                let div = document.getElementsByTagName('div');

                if (h2.length > 0) h2[0].remove();
                if (div.length > 0) div[0].remove();

                const titulo = document.createElement('h2');
                const capa = document.createElement('div'); const imagen = document.createElement('img');
                const listaOrdenada = document.createElement('ol');
                const enlace = document.createElement('a');
                const saltoDeLinea = document.createElement('br');

                titulo.textContent = data.meals[0].strMeal;
                imagen.src = data.meals[0].strMealThumb;
                for (let i = 1; i <= 20; i++) {
                    const puntosLista = document.createElement('li');
                    if (data.meals[0][`strIngredient${i}`] != "") {
                        puntosLista.textContent = data.meals[0][`strIngredient${i}`];
                        listaOrdenada.appendChild(puntosLista);
                    }
                };
                enlace.href = data.meals[0].strSource;
                enlace.setAttribute('target', '_blank');
                enlace.textContent = 'Enlace de la receta';

                capa.appendChild(imagen);
                capa.appendChild(listaOrdenada);
                capa.appendChild(enlace);

                document.body.appendChild(titulo);
                document.body.appendChild(capa);
                document.body.appendChild(saltoDeLinea);
                document.body.appendChild(botonObtenerReceta);

            } catch (error) {
                console.log('error');
                let mensajeError = "Error al obtener la receta";
                const capa = document.createElement('div');
                capa.innerHTML = `${error} ${mensajeError}`;
                document.body.appendChild(capa);
            }

        }

        consulta();

        /*// FORMA CON PROMESAS
        fetch('https://www.themealdb.com/api/json/v1/1/random.php')
            .then(response => response.json())
            .then(data => {

                let h2 = document.getElementsByTagName('h2');
                let div = document.getElementsByTagName('div');

                if (h2.length > 0) h2[0].remove();
                if (div.length > 0) div[0].remove();

                const titulo = document.createElement('h2');
                const capa = document.createElement('div'); const imagen = document.createElement('img');
                const listaOrdenada = document.createElement('ol');
                const enlace = document.createElement('a');
                const saltoDeLinea = document.createElement('br');

                titulo.textContent = data.meals[0].strMeal;
                imagen.src = data.meals[0].strMealThumb;
                for (let i = 1; i <= 20; i++) {
                    const puntosLista = document.createElement('li');
                    if (data.meals[0][`strIngredient${i}`] != "") {
                        puntosLista.textContent = data.meals[0][`strIngredient${i}`];
                        listaOrdenada.appendChild(puntosLista);
                    }
                };
                enlace.href = data.meals[0].strSource;
                enlace.setAttribute('target', '_blank');
                enlace.textContent = 'Enlace de la receta';

                capa.appendChild(imagen);
                capa.appendChild(listaOrdenada);
                capa.appendChild(enlace);

                document.body.appendChild(titulo);
                document.body.appendChild(capa);
                document.body.appendChild(saltoDeLinea);
                document.body.appendChild(botonObtenerReceta);

            })
            .catch(error => {
                let mensajeError = "Error al obtener la receta";
                const capa = document.createElement('div');
                capa.innerHTML = `${error} ${mensajeError}`;
                document.body.appendChild(capa);
            });*/


        /*// FORMA CON XHTML
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'https://www.themealdb.com/api/json/v1/1/random.php', true);
        xhr.send();
        xhr.addEventListener('readystatechange', (e) => {

            if (xhr.readyState !== 4) {
                return;
            }

            if (xhr.status >= 200 && xhr.status < 300) {

                let h2 = document.getElementsByTagName('h2');
                let div = document.getElementsByTagName('div');

                if (h2.length > 0) {
                    h2[0].remove();
                }

                if (div.length > 0) {
                    div[0].remove();
                }

                console.log('éxito');
                let json = JSON.parse(xhr.responseText);
                console.log(json);

                const titulo = document.createElement('h2');
                const capa = document.createElement('div');
                const imagen = document.createElement('img');
                const listaOrdenada = document.createElement('ol');
                const enlace = document.createElement('a');
                const saltoDeLinea = document.createElement('br');

                titulo.textContent = json.meals[0].strMeal;
                imagen.src = json.meals[0].strMealThumb;
                for (let i = 1; i <= 20; i++) {
                    const puntosLista = document.createElement('li');
                    if (json.meals[0][`strIngredient${i}`] != "") {
                        puntosLista.textContent = json.meals[0][`strIngredient${i}`];
                        listaOrdenada.appendChild(puntosLista);
                    }
                };
                enlace.href = json.meals[0].strSource;
                enlace.setAttribute('target', '_blank');
                enlace.textContent = 'Enlace de la receta';

                capa.appendChild(imagen);
                capa.appendChild(listaOrdenada);
                capa.appendChild(enlace);

                document.body.appendChild(titulo);
                document.body.appendChild(capa);
                document.body.appendChild(saltoDeLinea);
                document.body.appendChild(botonObtenerReceta);

            } else {
                console.log('error');
                let mensajeError = xhr.statusText || "Error al obtener la receta";
                const capa = document.createElement('div');
                capa.innerHTML = `Error ${xhr.status}: ${mensajeError}`;
                document.body.appendChild(capa);
            }

        });*/
    });
});