/*
Tenemos una lista con todas las notas de la clase. Lo tenemos en este array. Parte de él para 
hacer los siguientes ejercicios (copia la declaración del array tal cual está en tu código al principio 
de cada ejercicio):

const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

EJERCICIO 1

Haz un programa que cuente cuántos alumnos han suspendido (tienen menos de un 5). 
Imprime la cantidad. 
El resultado debería ser: "Total alumnos suspensos: 7"
*/

const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

let contador = 0;

arrayNotas.forEach(element => {
    if (element < 5) {
        contador++;
    }
});

alert('Total de alumnos suspensos: ' + contador);

