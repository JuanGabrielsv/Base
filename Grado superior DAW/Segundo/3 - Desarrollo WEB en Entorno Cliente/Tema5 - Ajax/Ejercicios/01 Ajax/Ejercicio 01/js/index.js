/* EJERCICIO01 

Obtener el usuario con id=5 de jsonplaceholder.typicode.com/users.
• Mostrar los datos del usuario en distintos <p> de un div de una página html: Nombre, usuario, correo y la dirección.
*/

iniciarPrograma = () => {
    const xhr = new XMLHttpRequest(); // Creamos la instancia de XMLHttpRequest    
    xhr.open("GET", "https://jsonplaceholder.typicode.com/users/5", true); // Configuramos la solicitud de petición    
    xhr.send(); // Enviamos la solicitud de petición previamente configurada    
    xhr.addEventListener("readystatechange", (e) => { // Configurar la función de devolución de llamada cuando la solicitud se complete
        if (xhr.readyStatete !== 4) {
            return;
        }
        if (xhr.status >= 200 && xhr.status < 300) { // La solicitud fué exitosa.
            let json = JSON.parse(xhr.responseText); // Se parsea a formato json los datos obtenidos.
            console.log(json.name); // Imprime por consola el contenido del json que le indiquemos.
        } else { // La solicitud falló.
            document.getElementById("usuario-info").innerHTML = "Error al cargar el usuario";
            let message = xhr.statusText || "Ocurrió un error";
        }
    });
}