/*
EJERCICIO 09.

Vamos a crear un blog. 

1. La página HTML tiene un título en h1.
2. Un botón (Load more).
3. Un buscador.
4. Por defecto, al entrar, se usará la api: https://jsonplaceholder.typicode.com/posts?_page=1&_limit=5
5. Mostrar 5 posts, con su título y cuerpo. 
6. Los posts irán en la capa con id=”posts-list” de la página html.
7. Cada post será un div que colgará de la capa con id=”posts-list”
8. El botón ‘Load More’, cargará otros nuevos 5 posts, en la misma capa del punto anterior. 
9. Pero la llamada a la api varía, y cada vez que pulsemos el botón, cambiaremos a la pagina siguiente, es decir:
    jsonplaceholder.typicode.com/posts?_page=2&_limit=5
    • El atributo page varia cada vez que pulsemos el botón
10. Cuando se pulse sobre cada post, hará otra petición ajax a los comentarios del post. 
    • Para ello es importante saber el id del post. Api: /posts/id_del_post/comments.
11. Los comentarios irán en la capa con id=”post-details”, debajo del botón Load More. 
12. Cada comentario será un div que colgará de la capa con id =”post-details”.
13. El buscador podrá cargar en la capa con id=”post-details”, el post cuyo numero indiquemos en el cuadro de
    texto. 
14. Si no se escribe ningún número, se avisará con mensaje alert.

NOTA: Hacer las peticiones ajax con api fetch y await.

Código Html:
<div id="blog.container">
    <h1>Blog</h1>
    <div id="posts-list"></div>
    <button id="load-more-btn">Load More</buñtton>
    <div id="post-details"></div>
    <input type="text" id="search-input" placeholder="Search..." />
    <button id="search-btn">Search</button>
    <div id="loading-spinner" class="spinner"></div>
</div>
*/

iniciarPrograma = () => {
    const postList = document.getElementById('post-list');
    fetchData();
    postList.innerHTML = fetchData().forEach();;
};

window.addEventListener('DOMContentLoaded', iniciarPrograma);

async function fetchData() {
    try {
        const response = await fetch('https://jsonplaceholder.typicode.com/posts?_page=1&_limit=5');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json(); // Espera y procesa el JSON
        console.log(data); // Muestra los datos obtenidos
    } catch (error) {
        console.error('Error al realizar la solicitud:', error); // Manejo de errores
    }
}