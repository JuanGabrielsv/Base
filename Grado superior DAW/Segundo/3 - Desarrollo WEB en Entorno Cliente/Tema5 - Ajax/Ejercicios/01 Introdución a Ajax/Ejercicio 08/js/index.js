/*
EJERCICIO 08.
Queremos obtener datos aleatorios de 10 usuarios: https://randomuser.me/api/?results=10.
1. Mostraremos la foto y su nombre, apellidos, correo, dirección y ciudad.
2. En html tenemos una capa div. 
3. Para cada usuario tendremos que crear un div desde js, y unirlo al div de la página html.
4. Cada usuario, tendrá un botón para poder cambiar aleatorioamente ese usuario.
5. Hacerlo con fetch y promesas.
*/
iniciar = () => {
    const capaDiv = document.getElementById('capaDiv')
    capaDiv.style = 'display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr;'
    let idUsuario = 1

    fetch('https://randomuser.me/api/?results=10')
        .then((response) => response.json())
        .then((data) =>
            data.results.forEach((element) => {
                if (idUsuario > 10) {
                    idUsuario = 1
                }

                let boton = document.createElement('button')
                let divUsuario = document.createElement('div')
                let imagen = document.createElement('img')
                let parrafo = document.createElement('p')

                boton.textContent = 'Cambiar'
                boton.id = `usuario${idUsuario}`
                divUsuario.style = 'text-align: center; margin-top: 2rem'
                divUsuario.id = `id-usuario${idUsuario}`
                imagen.src = `${element.picture.large}`
                parrafo.innerHTML = `
                ${element.name.title}
                ${element.name.first}
                ${element.name.last}
                <br>
                ${element.email}
                <br>
                ${element.location.street.name}, ${element.location.street.number}<br>
                ${element.location.city} (${element.location.country})`

                divUsuario.appendChild(imagen)
                divUsuario.appendChild(parrafo)
                divUsuario.appendChild(boton)
                capaDiv.appendChild(divUsuario)

                idUsuario++

                boton.addEventListener('click', () => {
                    fetch('https://randomuser.me/api/?results=1')
                        .then((response) => response.json())
                        .then((data) => data.results.forEach((element) => {
                            let cambiarUsuario = document.getElementById(`id-${boton.id}`)
                            imagen.src = element.picture.large
                            parrafo.innerHTML = `
                            ${element.name.title}
                            ${element.name.first}
                            ${element.name.last}
                            <br>
                            ${element.email}
                            <br>
                            ${element.location.street.name}, ${element.location.street.number}<br>
                            ${element.location.city} (${element.location.country})`
                        }))
                        .catch((error) => console.log('Error:', error))
                })
            })
        )
        .catch((error) => console.log('Error:', error))
}

window.addEventListener('DOMContentLoaded', iniciar)
