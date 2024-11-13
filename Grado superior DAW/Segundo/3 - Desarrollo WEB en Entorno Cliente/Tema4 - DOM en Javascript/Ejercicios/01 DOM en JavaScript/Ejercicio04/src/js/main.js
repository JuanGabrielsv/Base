/*
EJERCICIO 04

• Dado este código, eliminar el primer elemento:
    <p>Soy el primero ahora</p>
    <p id="p1">Soy el primer parrafo</p>
    <p id="p2">Soy el segundo parrafo</p>
    <p id="p3">Soy el nuevo</p> 
*/

window.addEventListener('DOMContentLoaded', () => {
    
    let $nodoBorrar = document.body.children[0];
    
    $nodoBorrar.remove();    
    //document.body.removeChild(document.body.children[0]);

});