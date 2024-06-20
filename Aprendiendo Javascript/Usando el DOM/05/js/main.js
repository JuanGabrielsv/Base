const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

let salida = document.getElementById('salida');
let input = document.getElementById('input');
let mensaje = '';
let posicion;
let existe = false;
let contador = 0;
let nota;

salida.innerHTML = '¿Qué nota estás buscando?';

function iniciar() {
    nota = Number(input.value);
    mensaje = '';
    existe = false;
    contador = 0;
    input.value = '';

    if (!isNaN(nota)) {

        for (let i = 0; i < arrayNotas.length; i++) {
            if (arrayNotas[i] === nota) {
                existe = true;
                contador++;
            }
        }

        if (existe === true) {
            mensaje += 'Existe ' + contador + ' notas<br>';
            for (let i = 0; i < arrayNotas.length; i++) {
                if (arrayNotas[i] === nota) {
                    posicion = i;
                    mensaje += 'En la posición ' + posicion + '<br>';
                }
            }
            return salida.innerHTML = mensaje;

        } else {
            return salida.innerHTML = 'La nota no existe';
        }

    } else {
        return salida.innerHTML = 'Debes introducir un número del 0 al 10';
    }
}