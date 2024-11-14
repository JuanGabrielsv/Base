/* 
EJERCICIO 09. 

• Dada una página HTML con un párrafo <p>. 
• Crear una clase de estilo llamado parrafo1 con fondo de color a #f0f0f0 y con el texto centrado. 
• Asignarle la clase de estilo al parrafo desde JavaScript.
*/

window.addEventListener('DOMContentLoaded', () => {
    const $parrafoP = document.body.children[0];
    $parrafoP.setAttribute('class','parrafo1');
    /* OTRA FORMA DE HACERLO */
    //$parrafoP.className = 'parrafo1';
});


