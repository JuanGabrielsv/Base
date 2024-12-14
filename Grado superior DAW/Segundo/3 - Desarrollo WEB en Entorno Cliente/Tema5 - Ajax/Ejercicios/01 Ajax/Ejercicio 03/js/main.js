/* --------------------------------------------------------------------------------------------------
EJERCICIO 03.
• Crear una página html con un <h1> ¿Sí o No?. ✔
• Tendrá un botón y un <p> para mostrar ahí la respuesta. ✔
• Cuando pulsemos el botón, se conectará con la api yesno.wtf/api para obtener la respuesta Si o No. ✔
• Tambien cargaremos en el resultado la imagen que devuelva. ✔
-------------------------------------------------------------------------------------------------- */

inicioPrograma = () => {

    const $Boton1 = document.getElementById('boton1');
    const $Respuesta = document.getElementById('respuesta');
    const $Img1 = document.createElement('img');

    document.body.appendChild($Img1);

    let resultado;

    $Boton1.addEventListener('click', () => {
        /*
                // Modo con XMLHttpResquest().
                // Creamos la instancia del objeto XMLHttpRequest.
                const xhr = new XMLHttpRequest();
        
                // Configuramos la solicitud de petición.
                xhr.open('GET', 'https://yesno.wtf/api', true);
                xhr.send();
        
                // Configuramos el evento de devolución de llamada cuando la solicitud se complete.
                xhr.addEventListener('readystatechange', () => {
        
                    // Si la petición llega al estado completada salimos de la consulta
                    if (xhr.readyState !== 4) {
                        return;
                    }
        
                    // Compobamos que la solicitud ha sido exitosa y si es así guardamos los datos recibidos.
                    if (xhr.status >= 200 && xhr.status < 300) {
                        resultado = JSON.parse(xhr.responseText);
                    } else {
                        return console.log('error');
                    }
        
                    $Respuesta.innerText = resultado.answer;
                    $Img1.setAttribute('src', resultado.image);
        
                });
        */

        // Modo con fetch
        fetch('https://yesno.wtf/api')

            // convertimos la respuesta a formato JSON
            .then(response => response.json())

            // Aquí es donde guardamos los datos recibidos 
            .then(resultado => {
                console.log(resultado)
                $Respuesta.innerText = resultado.answer;
                $Img1.setAttribute('src', resultado.image);
            })
            .catch(error => console.log('Error:', error));
    });
}
window.addEventListener('DOMContentLoaded', inicioPrograma);



