/*
EJERCICIO07 
• Obtener aleatoriamente datos de un usuario haciendo peticiones ajax sobre la api: https://randomuser.me/api/
• Necesitamos conocer: el nombre y apellidos, su correo y su ciudad. 
• Además queremos ver su imagen.
• Crear un botón en html
• Una capa div. 
• Cuando pulsemos el botón, mostraremos la información del usuario en el div. 
• Hacerlo con fetch y promesas.*/
iniciarPrograma = () => {
    const $BotonObtenerDatos = document.getElementById('boton1');
    const $DivResultado = document.getElementById('resultado');

    let usuario;

    $BotonObtenerDatos.addEventListener('click', () => {

        // Creamos la instancia de la petición.
        const xhr = new XMLHttpRequest();

        // Configuramos la petición.
        xhr.open('GET', 'https://randomuser.me/api/', true);

        // Configuramos el evento de devolución de llamada cuando la solicitud se complete.
        xhr.addEventListener('readystatechange', () => {
            if (xhr.readyState !== 4) {
                return;
            }
            // Si la solicitud es exitosa capturamos los datos de la consulta.
            if (xhr.status >= 200 && xhr.status < 300) {
                // Parseamos los datos obtenidos al formato json.
                usuario = JSON.parse(xhr.responseText);

            } else {
                console.log('error');
            }
            $DivResultado.innerHTML = `Nombre: ${usuario.results[0].name.title} ${usuario.results[0].name.first} ${usuario.results[0].name.last} <br>`;
            $DivResultado.innerHTML += `Correo: ${usuario.results[0].email} <br>`;
            $DivResultado.innerHTML += `Ciudad: ${usuario.results[0].location.city} <br>`;
            $DivResultado.innerHTML += `<img src="${usuario.results[0].picture.large}">`
        })
        xhr.send();
    });
}
window.addEventListener('DOMContentLoaded', iniciarPrograma);
