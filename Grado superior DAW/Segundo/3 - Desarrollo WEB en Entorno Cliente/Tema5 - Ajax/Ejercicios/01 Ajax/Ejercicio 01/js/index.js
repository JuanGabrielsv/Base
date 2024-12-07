/* EJERCICIO01 

Obtener el usuario con id=5 de jsonplaceholder.typicode.com/users.
• Mostrar los datos del usuario en distintos <p> de un div de una página html: Nombre, usuario, correo y la dirección.
*/

iniciarPrograma = () => {

    // Creamos la instancia de XMLHttpRequest.
    const xhr = new XMLHttpRequest();

    // Configuramos la solicitud de petición.
    xhr.open("GET", "https://jsonplaceholder.typicode.com/users/5", true);

    // Configurar la función de devolución de llamada cuando la solicitud se complete.
    xhr.addEventListener("readystatechange", (e) => {
        if (xhr.readyState !== 4) {
            return;
        }
        if (xhr.status >= 200 && xhr.status < 300) { // La solicitud fué exitosa.
            let usuario = JSON.parse(xhr.responseText); // Se parsea a formato json los datos obtenidos.
            console.log(usuario);
            mostrarInfoUsuario(usuario);
        } else { // La solicitud falló.
            document.getElementById("usuario-info").innerHTML = "Error al cargar el usuario";
        }
    });

    // Configurar la función de devolución de llamada para manejar errores de red.
    xhr.onerror = function () {
        document.getElementById("usuario-info").innerHTML = "Error de red";
    };

    // Enviamos la solicitud.
    xhr.send();
};

mostrarInfoUsuario = (usuario) => {
    let usuarioInfoDiv = document.getElementById("usuario-info");
    usuarioInfoDiv.innerHTML = '<h2>Nombre: ' + usuario.name + '</h2>';
    usuarioInfoDiv.innerHTML += '<p>Usuario: ' + usuario.username + '</p>';
    usuarioInfoDiv.innerHTML += '<p>Email: ' + usuario.email + '</p>';
    usuarioInfoDiv.innerHTML += '<p>Dirección: ' + usuario.address.street + ', ' + usuario.address.suite + ', ' + usuario.address.city + '</p>';
}

window.addEventListener('DOMContentLoaded', iniciarPrograma);