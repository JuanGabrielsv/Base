/* 2.- Crear una página html con un <H1> POSTS </H1> y un botón. Cuando pulsemos un botón vamos a llamar a la
api: jsonplaceholder.typicode.com/posts , y vamos a pintar el resultado en una tabla. Sacar en cada fila el title y el
body, cada uno en una columna diferente. */
let inicio = () => {

    const xhr = new XMLHttpRequest();

    xhr.open("GET", "https://jsonplaceholder.typicode.com/posts", true);
    xhr.send();
    xhr.addEventListener("readystatechange", (e) => {
        if (xhr.readyState !== 4) return;

        if (xhr.status >= 200 && xhr.status < 300) {
            console.log("éxito");

            let json = JSON.parse(xhr.responseText);
            document.createElement('td');
            console.log(json);

        } else {
            console.log('error');
            let message = xhr.statusText || "Ocurrió un error";
            //$xhr.innerHTML = `Error ${xhr.status}: ${message}`;
        }
    });
}

window.addEventListener("DOMContentLoaded", (inicio));