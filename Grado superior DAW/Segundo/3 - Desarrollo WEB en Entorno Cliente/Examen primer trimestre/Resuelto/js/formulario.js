window.addEventListener('DOMContentLoaded', () => {
    const botonEnviar = document.getElementById('enviarButton');
    const divError = document.getElementById('errorMessage');
    const correoElectronico = document.getElementById('correo');
    const calendario = document.getElementById('fechaNacimiento');
    const contrasena = document.getElementById('contraseña');
    const sorpresa = document.getElementById('sorpresa');
    const quieroSorpresa = document.getElementById('quieroSorpresa');
    const noQuieroSorpresa = document.getElementById('noQuieroSorpresa');
    const sorpresaId = document.getElementById('sorpresaId');

    botonEnviar.addEventListener('click', (e) => {

        e.preventDefault();
        var valorNombre = document.getElementById('nombre').value;
        var valorCorreo = correoElectronico.value;
        var arrayValueCorreo = valorCorreo.split("");
        var contieneArroba = false;
        var fechaNacimientoValue = calendario.value;
        var fechaNacimientoDate = new Date(fechaNacimientoValue);
        var anoActual = new Date().getFullYear();
        var valorContrasena = contrasena.value;

        for (let i = 0; i < arrayValueCorreo.length; i++) {
            if (arrayValueCorreo[i] == "@") {
                contieneArroba = true;
            }
        }

        if (valorNombre == "") {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'El campo nombre no puede estar vacio';
        } else if (valorCorreo == "") {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'Correo no puede estar vacio';
        } else if (!contieneArroba) {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'Correo debe contener una @';
        } else if (fechaNacimientoValue == "") {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'Fecha nacimiento no puede estar vacio';
        } else if (anoActual - fechaNacimientoDate.getFullYear() < 18) {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'Eres menor de edad';
        } else if (valorContrasena.length < 8 || valorContrasena == "") {
            divError.setAttribute('style', 'color:red;');
            divError.innerHTML = 'Contraseña tiene que tener mas de 8 caracteres';
        } else {
            sorpresa.setAttribute('style', 'display: block;');
            quieroSorpresa.addEventListener('click', () => {
                var numeroRandom = Math.floor(Math.random() * (2 - 1 + 1)) + 1;
                console.log(numeroRandom);

                if (numeroRandom == 1) {
                    var imgElement = document.createElement('img');
                    imgElement.setAttribute('src', '../sorpresa1.jpg');
                    sorpresaId.appendChild(imgElement);
                } else {
                    var imgElement = document.createElement('img');
                    imgElement.setAttribute('src', '../sorpresa2.jpg');
                    sorpresaId.appendChild(imgElement);
                }
            });

            noQuieroSorpresa.addEventListener('change', () => {
                const temporizador = setTimeout(() => {
                    var imgElement = document.createElement('img');
                    imgElement.setAttribute('src', '../sorpresaNO.jpg');
                    sorpresaId.appendChild(imgElement);
                }, 3000);
            });

        }



    });

});