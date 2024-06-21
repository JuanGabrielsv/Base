const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];


let salida = document.getElementById('salida');
let input = document.getElementById('input');
let contador = 0;

salida.innerHTML = '¿Qué nota estás buscando?';

function iniciarPrograma() {

    let nota;
    let contador = 0;

    nota = Number(input.value)
    input.value = '';
    

    if (!isNaN(nota) && nota >= 0) {
        arrayNotas.forEach(notas => {
            if (notas > nota) {
                contador++;
            }
        });

        if (contador === 0) {
            return salida.innerHTML = 'No hay notas mayores a esa nota';            
        } else {
            return salida.innerHTML = "Has introducido el " + nota + '<br>Hay ' + contador + ' notas mayores a la nota que metiste';
        }

    } else {
        return salida.innerHTML = '<p style=" color: #ee0000;">Datos incorrectos</p><br>Introduce una nota';

    }

}