let primerNumero = 'no recogido';
let segundoNumero = 'no recogido';
let salida = document.getElementById('salida');
let primerPasoOk = false;
let check = true;

document.getElementById('salida').innerHTML = 'Introduce el primer número';

function nose() {

    if (primerNumero === 'no recogido') {
        primerNumero = Number(document.getElementById('entradaUsuario').value);
        document.getElementById('entradaUsuario').value = '';

        if (!isNaN(primerNumero) && primerNumero !== 0) {
            return document.getElementById('salida').innerHTML = 'Introduce el segundo número';

        } else if (isNaN(primerNumero)) {
            primerNumero = 'no recogido';
            return document.getElementById('salida').innerHTML = 'El número no puede ser una letra <br><br> Introduce el primer número';

        } else if (primerNumero === 0) {
            primerNumero = 'no recogido';
            return document.getElementById('salida').innerHTML = 'El número no puede ser 0 <br><br> Introduce el primer número';
        }
    }

    if (segundoNumero === 'no recogido') {
        segundoNumero = Number(document.getElementById('entradaUsuario').value);
        document.getElementById('entradaUsuario').value = '';

        if (!isNaN(segundoNumero) && segundoNumero !== 0) {
            document.getElementById('salida').innerHTML = 'La suma de ' + primerNumero + ' + ' + segundoNumero + ' es ' + (primerNumero + segundoNumero);

        } else if (isNaN(segundoNumero)) {
            segundoNumero = 'no recogido';
            return document.getElementById('salida').innerHTML = 'El número no puede ser una letra <br><br> Introduce el segundo número';

        } else if (segundoNumero === 0) {
            segundoNumero = 'no recogido';
            return document.getElementById('salida').innerHTML = 'El número no puede ser 0 <br><br> Introduce el segundo número';
        }
    }
}

function sise() {

    salida.innerHTML = 'Introduce el primer número';
    primerNumero = 'no recogido';
    segundoNumero = 'no recogido';

}







