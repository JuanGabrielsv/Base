/*
EJERCICIO13.

• Crear una página HTML con un botón dentro de una etiqueta section (<section id="ContentFormulario">),
• Al pulsarlo, desde JavaScript, genere un formulario.
• Dicho formulario debe tener los siguientes atributos: una anchura de 300px, un action a la página de google y el method será get. 

Además, el formulario debe contener:

- Un input de tipo text para el nombre, con el atributo placeholder ‘Nombres’ y estilo: width: 100%; margin: 10px 0px; padding: 5px;
- Un input de tipo text para los apellidos, con el atributo placeholder ‘Apellidos’ y estilo: width: 100%; margin: 10px 0px; padding: 5px;
- Un input de tipo text para el email, con el atributo placeholder ‘Email’ y estilo: width: 100%; margin: 10px 0px; padding: 5px;
- Un input de tipo text para el asunto, con el atributo placeholder ‘Asunto’ y estilo: width:100%; margin: 10px 0px; padding: 5px;
- Un input de tipo text para el Mensaje, con el atributo placeholder ‘Mensaje’ y estilo: width: 100%; height: 200px; margin: 10px 0px; padding: 5px;
- Un botón con el valor ‘Enviar’ con estilo width: 100px; margin: 10px 0px; padding: 10px; background: #F05133; color:#fff; border: solid 1px #000; y con un mensaje de alert cuando se pulse el botón.
*/

window.addEventListener('DOMContentLoaded', () => {
    document.getElementById('boton-generar-formulario').addEventListener('click', () => {

        /* CREAMOS EL FORMULARIO Y LE AÑADIMOS SUS ATRIBUTOS */
        const $formulario1 = document.createElement('form');
        $formulario1.setAttribute('method', 'get');
        $formulario1.setAttribute('style', 'width: 300px;');
        $formulario1.setAttribute('action', 'https://www.google.es');

        /* CREAMOS LOS ELEMENTOS QUE CONTENDRÁ EL FORMULARIO */
        const $primerInput = document.createElement('input');
        $primerInput.setAttribute('placeholder', 'Nombre');
        $primerInput.setAttribute('style', 'width: 100%; margin: 10px 0px; padding: 5px;');

        const $segundoInput = document.createElement('input');
        $segundoInput.setAttribute('placeholder', 'Apellidos');
        $segundoInput.setAttribute('style', 'width: 100%; margin: 10px 0px; padding: 5px;');

        const $tercerInput = document.createElement('input');
        $tercerInput.setAttribute('placeholder', 'Email');
        $tercerInput.setAttribute('style', 'width: 100%; margin: 10px 0px; padding: 5px;');

        const $cuartoInput = document.createElement('input');
        $cuartoInput.setAttribute('placeholder', 'Asunto');
        $cuartoInput.setAttribute('style', 'width: 100%; margin: 10px 0px; padding: 5px;');

        const $quintoInput = document.createElement('input');
        $quintoInput.setAttribute('placeholder', 'Mensaje');
        $quintoInput.setAttribute('style', 'width: 100%; height: 200px; margin: 10px 0px; padding: 5px;');

        const $botonEnviar = document.createElement('button');
        $botonEnviar.setAttribute('style', 'width: 100%; margin: 10px 0px; padding: 10px; background-color: #F05133; color: #fff; border: solid 1px #000;');
        $botonEnviar.textContent = 'Enviar';

        /* INSERTAMOS LOS ELEMENTOS EN EL FORMULARIO */
        $formulario1.appendChild($primerInput);
        $formulario1.appendChild($segundoInput);
        $formulario1.appendChild($tercerInput);
        $formulario1.appendChild($cuartoInput);
        $formulario1.appendChild($quintoInput);
        $formulario1.appendChild($botonEnviar);

        /* INSERTAMOS EL FORMULARIO EN SECTION */
        document.getElementById('ContentFormulario').appendChild($formulario1);
    });
});


