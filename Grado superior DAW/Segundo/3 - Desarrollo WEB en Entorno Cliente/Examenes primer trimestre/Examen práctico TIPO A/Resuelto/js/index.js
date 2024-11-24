function getElemento(elementosId, id) {
    var buscarElemento = Array.from(elementosId).find(elemento => elemento.id === id);
    return buscarElemento;
}

window.addEventListener('DOMContentLoaded', () => {
    var elementosId = document.querySelectorAll('[id]');
    const incidencia = [{
        id: 1,
        estado: 'Abierta',
        asunto: 'asunto 1',
        descripcion: 'Descripción 1',
        detalles: {
            prioridad: 'Baja',
            usuario: 'usuario 1'
        }
    },
    {
        id: 2,
        estado: 'Cerrada',
        asunto: 'asunto 2',
        descripcion: 'Descripción 2',
        detalles: {
            prioridad: 'Baja',
            usuario: 'usuario 2'
        }
    },
    {
        id: 3,
        estado: 'Cerrada',
        asunto: 'asunto 3',
        descripcion: 'Esto es una descripción.',
        detalles: {
            prioridad: 'Alta',
            usuario: 'usuario 3'
        }
    },
    {
        id: 4,
        estado: 'Cerrada',
        asunto: 'asunto 4',
        descripcion: 'Descripción 4',
        detalles: {
            prioridad: 'Baja',
            usuario: 'usuario 4'
        }
    },
    {
        id: 5,
        estado: 'Cerrada',
        asunto: 'asunto 5',
        descripcion: 'Descripción 5',
        detalles: {
            prioridad: 'Alta',
            usuario: 'usuario 5'
        }
    },
    {
        id: 6,
        estado: 'Cerrada',
        asunto: 'Error en la base de datos',
        descripcion: 'Descripción 6',
        detalles: {
            prioridad: 'Baja',
            usuario: 'usuario 6'
        }
    },
    {
        id: 7,
        estado: 'Abierta',
        asunto: 'asunto 7',
        descripcion: 'Descripción 7',
        detalles: {
            prioridad: 'Alta',
            usuario: 'usuario 7'
        }
    },
    {
        id: 8,
        estado: 'Cerrada',
        asunto: 'asunto 8',
        descripcion: 'Descripción 8',
        detalles: {
            prioridad: 'Baja',
            usuario: 'usuario 8'
        }
    }];

    getElemento(elementosId, 'searchButton').addEventListener('click', () => {
        var notFound = true;

        const valorId = getElemento(elementosId, 'searchId').value;
        const valorAsunto = getElemento(elementosId, 'searchAsunto').value;
        const valorDescripcion = getElemento(elementosId, 'searchDescripcion').value;
        const valorEstado = getElemento(elementosId, 'searchEstado').value;

        console.log(valorId);
        console.log(valorAsunto);
        console.log(valorDescripcion);
        console.log(valorEstado);

        if (document.getElementById('resultado').firstChild) {
            document.getElementById('resultado').firstChild.remove();
        }

        const tableResultado = document.createElement('table');
        const tHeadResultado = document.createElement('thead');
        const tBodyResultado = document.createElement('tbody');

        tableResultado.appendChild(tHeadResultado);
        tableResultado.appendChild(tBodyResultado);

        let unaIncidencia = incidencia[0];

        for (let i = 0; i < 1; i++) {
            tHeadResultado.appendChild(document.createElement('tr'));
            Object.keys(unaIncidencia).forEach(key => {
                if (key == 'id' || key == 'estado' || key == 'asunto') {
                    let th = tHeadResultado.firstChild.appendChild(document.createElement('th'));
                    th.textContent = key;
                } else if (key == 'detalles') {
                    Object.keys(unaIncidencia.detalles).forEach(key => {
                        if (key == 'prioridad') {
                            let th = tHeadResultado.firstChild.appendChild(document.createElement('th'));
                            th.textContent = key;
                        };
                    });
                }
            });
        }

        const tdAcciones = document.createElement('th');
        tdAcciones.textContent = 'Acciones';
        tHeadResultado.firstChild.appendChild(tdAcciones);

        if (valorId == "" && valorAsunto == "" && valorDescripcion == "" && valorEstado == "Todas") {
            for (let i = 0; i < incidencia.length; i++) {
                let tr = document.createElement('tr');
                let tdId = document.createElement('td');
                let tdEstado = document.createElement('td');
                let tdAsunto = document.createElement('td');
                let tdPrioridad = document.createElement('td');
                let tdAcciones = document.createElement('td');

                tdId.textContent = incidencia[i].id;
                tdEstado.textContent = incidencia[i].estado;
                tdAsunto.textContent = incidencia[i].asunto;
                tdPrioridad.textContent = incidencia[i].detalles.prioridad;
                tdAcciones.innerHTML = `<img src="ver.jpg">`;

                tr.appendChild(tdId);
                tr.appendChild(tdEstado);
                tr.appendChild(tdAsunto);
                tr.appendChild(tdPrioridad);
                tr.appendChild(tdAcciones);

                tBodyResultado.appendChild(tr);
                notFound = true;
            }
        } else {
            for (let i = 0; i < incidencia.length; i++) {

                if (incidencia[i].id == valorId) {
                    let tr = document.createElement('tr');
                    let tdId = document.createElement('td');
                    let tdEstado = document.createElement('td');
                    let tdAsunto = document.createElement('td');
                    let tdPrioridad = document.createElement('td');
                    let tdAcciones = document.createElement('td');

                    tdId.textContent = incidencia[i].id;
                    tdEstado.textContent = incidencia[i].estado;
                    tdAsunto.textContent = incidencia[i].asunto;
                    tdPrioridad.textContent = incidencia[i].detalles.prioridad;
                    tdAcciones.innerHTML = `<img src="ver.jpg">`;

                    tr.appendChild(tdId);
                    tr.appendChild(tdEstado);
                    tr.appendChild(tdAsunto);
                    tr.appendChild(tdPrioridad);
                    tr.appendChild(tdAcciones);

                    tBodyResultado.appendChild(tr);
                    notFound = false;
                }

                if (incidencia[i].estado == valorEstado) {
                    let tr = document.createElement('tr');
                    let tdId = document.createElement('td');
                    let tdEstado = document.createElement('td');
                    let tdAsunto = document.createElement('td');
                    let tdPrioridad = document.createElement('td');
                    let tdAcciones = document.createElement('td');

                    tdId.textContent = incidencia[i].id;
                    tdEstado.textContent = incidencia[i].estado;
                    tdAsunto.textContent = incidencia[i].asunto;
                    tdPrioridad.textContent = incidencia[i].detalles.prioridad;
                    tdAcciones.innerHTML = `<img src="ver.jpg">`;


                    tr.appendChild(tdId);
                    tr.appendChild(tdEstado);
                    tr.appendChild(tdAsunto);
                    tr.appendChild(tdPrioridad);
                    tr.appendChild(tdAcciones);

                    tBodyResultado.appendChild(tr);
                    notFound = false;
                }

                if (incidencia[i].asunto.includes(valorAsunto) && valorAsunto != "") {
                    let tr = document.createElement('tr');
                    let tdId = document.createElement('td');
                    let tdEstado = document.createElement('td');
                    let tdAsunto = document.createElement('td');
                    let tdPrioridad = document.createElement('td');
                    let tdAcciones = document.createElement('td');

                    tdId.textContent = incidencia[i].id;
                    tdEstado.textContent = incidencia[i].estado;
                    tdAsunto.textContent = incidencia[i].asunto;
                    tdPrioridad.textContent = incidencia[i].detalles.prioridad;
                    tdAcciones.innerHTML = `<img src="ver.jpg">`;

                    tr.appendChild(tdId);
                    tr.appendChild(tdEstado);
                    tr.appendChild(tdAsunto);
                    tr.appendChild(tdPrioridad);
                    tr.appendChild(tdAcciones);

                    tBodyResultado.appendChild(tr);
                    notFound = false;
                }

                if (incidencia[i].descripcion.includes(valorDescripcion) && valorDescripcion != "") {
                    let tr = document.createElement('tr');
                    let tdId = document.createElement('td');
                    let tdEstado = document.createElement('td');
                    let tdAsunto = document.createElement('td');
                    let tdPrioridad = document.createElement('td');
                    let tdAcciones = document.createElement('td');

                    tdId.textContent = incidencia[i].id;
                    tdEstado.textContent = incidencia[i].estado;
                    tdAsunto.textContent = incidencia[i].asunto;
                    tdPrioridad.textContent = incidencia[i].detalles.prioridad;
                    tdAcciones.innerHTML = `<img src="ver.jpg">`;

                    tr.appendChild(tdId);
                    tr.appendChild(tdEstado);
                    tr.appendChild(tdAsunto);
                    tr.appendChild(tdPrioridad);
                    tr.appendChild(tdAcciones);

                    tBodyResultado.appendChild(tr);
                    notFound = false;
                }

            }

            if (notFound) {
                alert('no hay entradas');
            }
        }

        const trDeTbody = tBodyResultado.getElementsByTagName('tr');
        const tdDeTbody = tBodyResultado.getElementsByTagName('td');
        const imgDeBody = tBodyResultado.getElementsByTagName('img');


        for (let i = 0; i < trDeTbody.length; i++) {
            trDeTbody[i].addEventListener('mouseover', () => {
                trDeTbody[i].style.backgroundColor = '#ffffcc';
            });
            trDeTbody[i].addEventListener('mouseout', () => {
                trDeTbody[i].style.backgroundColor = 'white';
            });
        }

        for (let i = 0; i < imgDeBody.length; i++) {
            imgDeBody[i].setAttribute('title', 'Detalle de la incidencia');
            imgDeBody[i].setAttribute('style', 'width: 20px; height: 20px;');
        }

        for (let i = 0; i < imgDeBody.length; i++) {
            imgDeBody[i].addEventListener('click', () => {
                const ventanaSecundaria = window.open('', `ventana${i}`, 'width = 500px; height = 500px');
                ventanaSecundaria.document.body.innerHTML = `<h1>${trDeTbody[i].firstChild.textContent}</h1>`;
                for (let j = 0; j < incidencia.length; j++) {
                    if (incidencia[j].id == trDeTbody[i].firstChild.textContent) {
                        ventanaSecundaria.document.body.innerHTML += `<h2>${incidencia[j].descripcion}</h2>`;
                        ventanaSecundaria.document.body.innerHTML += `<b>${incidencia[j].detalles.usuario}</b><br>`;
                    }
                }
                const botonVentanaSecundaria = document.createElement('button');
                botonVentanaSecundaria.setAttribute('id', 'botonCerrar');
                botonVentanaSecundaria.textContent = 'Cerrar Incidencia';
                ventanaSecundaria.document.body.appendChild(botonVentanaSecundaria);

                ventanaSecundaria.document.getElementById('botonCerrar').addEventListener('click', () => {
                    for (let i = 0; i < tdDeTbody.length; i++) {
                        if (tdDeTbody[i].textContent == 'Abierta') {
                            tdDeTbody[i].textContent = 'Cerrada';
                        }

                        for (let j = 0; j < incidencia.length; j++) {
                            if (incidencia[j].id == tdDeTbody[i].textContent) {
                                incidencia[j].estado = 'Cerrada';
                            }
                        }


                    }
                    ventanaSecundaria.close();
                });
            });
        }

        getElemento(elementosId, 'resultado').appendChild(tableResultado);

    });
    console.log(elementosId);

});