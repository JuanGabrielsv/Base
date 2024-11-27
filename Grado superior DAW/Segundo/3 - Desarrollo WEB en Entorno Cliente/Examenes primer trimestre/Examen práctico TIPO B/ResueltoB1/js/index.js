//*************************************************** A ********************************************************/
const aProductos = [
    {
        id: 1,
        categoria: {
            tipo: 'Ropa',
            marca: 'Adidas'
        },
        nombre: 'Zapatillas deportivas',
        descripcion: 'Unas zapatillas para correr',
        cantidad: 25
    },
    {
        id: 2,
        categoria: {
            tipo: 'Electrónica',
            marca: 'Razer'
        },
        nombre: 'Auriculares',
        descripcion: 'Auriculares G730 RGB Color',
        cantidad: 20
    },
    {
        id: 3,
        categoria: {
            tipo: 'Muebles',
            marca: 'Logitech'
        },
        nombre: 'Silla gaming',
        descripcion: 'Silla Gaming color verde moco',
        cantidad: 30
    },
    {
        id: 4,
        categoria: {
            tipo: 'Ropa',
            marca: 'Puma'
        },
        nombre: 'Pantalones deportivos',
        descripcion: 'Pantalones color azúl de material licra',
        cantidad: 50
    },
    {
        id: 5,
        categoria: {
            tipo: 'Electrónica',
            marca: 'Intel'
        },
        nombre: 'Portátil Gaming',
        descripcion: 'Portátil Gamer, 128GB RAM, 100TB Disco, RTX5090 Nvidia',
        cantidad: 10
    },
    {
        id: 6,
        categoria: {
            tipo: 'Muebles',
            marca: 'Steel Series'
        },
        nombre: 'Escritorio elevador',
        descripcion: 'Escritorio con elevación automática ajustable 1.5m max',
        cantidad: 5
    },
    {
        id: 7,
        categoria: {
            tipo: 'Ropa',
            marca: 'Nike'
        },
        nombre: 'Camiseta deportiva',
        descripcion: 'Camiseta para hacer deporte',
        cantidad: 85
    },
    {
        id: 8,
        categoria: {
            tipo: 'Electrónica',
            marca: 'Corsair'
        },
        nombre: 'Teclado mecánico',
        descripcion: 'Teclado mecánico red RGB',
        cantidad: 20
    },
    {
        id: 9,
        categoria: {
            tipo: 'Muebles',
            marca: 'Ikea'
        },
        nombre: 'Alfombra',
        descripcion: 'Alfombra protectora para el deslizamiento de sillas con ruedas',
        cantidad: 25
    },
    {
        id: 10,
        categoria: {
            tipo: 'Ropa',
            marca: 'Adidas'
        },
        nombre: 'Gorra underground',
        descripcion: 'Gorra para la playa y que no te de el sol',
        cantidad: 40
    }
];

//*************************************************** B ********************************************************/

window.addEventListener('DOMContentLoaded', () => {
    const botonBuscar = document.getElementById('searchButton');
    const divResultado = document.getElementById('resultado');
    const divMensaje = document.getElementById('mensaje')
    botonBuscar.addEventListener('click', (e) => {
        e.preventDefault();
        if (document.getElementById('tablita')) {
            document.getElementById('tablita').remove()
        }
        if (document.getElementById('error')) {
            document.getElementById('error').remove()
        }
        const tabla = document.createElement('table');
        const tHead = document.createElement('tHead');
        const tBody = document.createElement('tBody');
        const trHead = document.createElement('tr');
        const thHeadId = document.createElement('th');
        const thHeadTipo = document.createElement('th');
        const thHeadNombre = document.createElement('th');
        const thHeadVender = document.createElement('th')
        const thHeadCantidad = document.createElement('th');
        let trBody = '';
        let enlaces;
        let check = true
        let valorIdString = document.getElementById('searchId').value
        let valorId = Number(document.getElementById('searchId').value)
        let valorNombre = String(document.getElementById('searchNombre').value).trim().toLowerCase()
        let valorDescripcion = String(document.getElementById('searchDescripcion').value).trim().toLowerCase()
        let valorCantidadString = document.getElementById('searchCantidad').value
        let valorCantidad = Number(document.getElementById('searchCantidad').value)
        tabla.id = 'tablita'
        thHeadId.textContent = 'ID'
        thHeadTipo.textContent = 'Tipo'
        thHeadNombre.textContent = 'Nombre'
        thHeadVender.textContent = 'Vender'
        thHeadCantidad.textContent = 'Cantidad'
        trHead.appendChild(thHeadVender)
        trHead.appendChild(thHeadId)
        trHead.appendChild(thHeadTipo)
        trHead.appendChild(thHeadNombre)
        trHead.appendChild(thHeadCantidad)
        tHead.appendChild(trHead)
        tabla.appendChild(tHead)
        tabla.appendChild(tBody)
        divResultado.appendChild(tabla);
        aProductos.forEach(element => {
            if (element.id === valorId && element.cantidad > valorCantidad) {
                let fila = document.createElement('tr')
                fila.appendChild(document.createElement('td')).appendChild(document.createElement('a')).href = '#'
                fila.firstElementChild.firstElementChild.style.color = 'green'
                fila.firstElementChild.firstElementChild.textContent = 'Vender todo'
                fila.appendChild(document.createElement('td')).textContent = element.id
                fila.appendChild(document.createElement('td')).textContent = element.categoria.tipo
                fila.appendChild(document.createElement('td')).textContent = element.nombre
                fila.appendChild(document.createElement('td')).textContent = element.cantidad
                tBody.appendChild(fila)
                check = false
            }
            if (element.nombre.toLowerCase() === valorNombre && element.id !== valorId && element.cantidad > valorCantidad) {
                let fila = document.createElement('tr')
                fila.appendChild(document.createElement('td')).appendChild(document.createElement('a')).href = '#'
                fila.firstElementChild.firstElementChild.style.color = 'green'
                fila.firstElementChild.firstElementChild.textContent = 'Vender todo'
                fila.appendChild(document.createElement('td')).textContent = element.id
                fila.appendChild(document.createElement('td')).textContent = element.categoria.tipo
                fila.appendChild(document.createElement('td')).textContent = element.nombre
                fila.appendChild(document.createElement('td')).textContent = element.cantidad
                tBody.appendChild(fila)
                check = false
            }
            if (element.descripcion.toLowerCase().includes(valorDescripcion) &&
                element.id !== valorId && element.nombre.toLowerCase() !== valorNombre &&
                valorDescripcion !== '' && element.cantidad > valorCantidad) {
                let fila = document.createElement('tr')
                fila.appendChild(document.createElement('td')).appendChild(document.createElement('a')).href = '#'
                fila.firstElementChild.firstElementChild.style.color = 'green'
                fila.firstElementChild.firstElementChild.textContent = 'Vender todo'
                fila.appendChild(document.createElement('td')).textContent = element.id
                fila.appendChild(document.createElement('td')).textContent = element.categoria.tipo
                fila.appendChild(document.createElement('td')).textContent = element.nombre
                fila.appendChild(document.createElement('td')).textContent = element.cantidad
                tBody.appendChild(fila)
                check = false
            }
            if (element.cantidad > valorCantidad && valorCantidad !== 0 && element.id !== valorId) {
                let fila = document.createElement('tr')
                fila.appendChild(document.createElement('td')).appendChild(document.createElement('a')).href = '#'
                fila.firstElementChild.firstElementChild.style.color = 'green'
                fila.firstElementChild.firstElementChild.textContent = 'Vender todo'
                fila.appendChild(document.createElement('td')).textContent = element.id
                fila.appendChild(document.createElement('td')).textContent = element.categoria.tipo
                fila.appendChild(document.createElement('td')).textContent = element.nombre
                fila.appendChild(document.createElement('td')).textContent = element.cantidad
                tBody.appendChild(fila)
                check = false
            }
        })
        if (valorIdString === '' && valorNombre === '' && valorDescripcion === '' && valorCantidadString === '') {
            aProductos.forEach(element => {
                let fila = document.createElement('tr')
                fila.appendChild(document.createElement('td')).appendChild(document.createElement('a')).href = '#'
                fila.firstElementChild.firstElementChild.style.color = 'green'
                fila.firstElementChild.firstElementChild.textContent = 'Vender todo'
                fila.appendChild(document.createElement('td')).textContent = element.id
                fila.appendChild(document.createElement('td')).textContent = element.categoria.tipo
                fila.appendChild(document.createElement('td')).textContent = element.nombre
                fila.appendChild(document.createElement('td')).textContent = element.cantidad
                tBody.appendChild(fila)
                check = false
            })
            //*************************************************** C ********************************************************/
        }
        if (check) {
            divMensaje.innerHTML = `<p id="error" style="color: red; font-weight: bold;">No existen productos para mostrar</p>`
        }
        //*************************************************** D ********************************************************/       
        trBody = tabla.querySelectorAll('tbody tr')
        trBody.forEach(element => {
            element.addEventListener('mouseover', () => {
                element.style.backgroundColor = '#ddeeac'
            })
            element.addEventListener('mouseout', () => {
                element.style.backgroundColor = 'darkseagreen'
            })
        })
        //*************************************************** E ********************************************************/
        enlaces = tabla.querySelectorAll('a')
        enlaces.forEach(element => {
            element.addEventListener('click', () => {
                let ventanaEmergente = window.open('', 'ventana1', 'width=600px height=600px')
            })
        })


    })
})