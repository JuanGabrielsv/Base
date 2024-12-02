/* 1.- Obtener el usuario con id=5 de jsonplaceholder.typicode.com/users.
Mostrar los datos del usuario en distintos <p> de un div de una página html: Nombre, usuario, correo y la
dirección. */

const xhr = new XMLHttpRequest();

xhr.open("GET", "https://jsonplaceholder.typicode.com/users/5", true);
xhr.send();
xhr.addEventListener("readystatechange", (e) => {
    if (xhr.readyState !== 4) return;

    if (xhr.status >= 200 && xhr.status < 300) {
        console.log("éxito");

        let json = JSON.parse(xhr.responseText);
        console.log(json.name);




    } else {
        console.log('error');
        let message = xhr.statusText || "Ocurrió un error";
        //$xhr.innerHTML = `Error ${xhr.status}: ${message}`;
    }



})