/* 
EJERCICIO0  08. 

• Crear una página HTML con un enlace con color: #1a73e8 y con letra negrita 
  ( Font-weight:bold). 
• Mostrar un mensaje alert con el contenido de su atributo href, color y 
  font-weight.
*/

window.addEventListener('DOMContentLoaded', () => {
    alert(document.body.children[0].style.color + '\n' +
        document.body.children[0].style.fontWeight + "\n" +
        document.body.children[0].getAttribute('href'));
});

