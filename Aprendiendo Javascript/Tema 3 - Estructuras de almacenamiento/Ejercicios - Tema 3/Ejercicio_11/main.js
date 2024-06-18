/*
Tenemos una lista con todas las notas de la clase. Lo tenemos en este array. Parte de él para 
hacer los siguientes ejercicios (copia la declaración del array tal cual está en tu código al principio 
de cada ejercicio):

const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

EJERCICIO 11

Haz un programa que calcule la media de las notas de los alumnos que han aprobado. 
Imprime el resultado. 
Debería ser: 
 Nota media de aprobados: 8
*/

const arrayNotas = [7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10];

let contador = 0;
let suma = 0;

arrayNotas.forEach(element => {
    if (element >= 5) {
        suma += element;
        contador++;
    }
});

alert('Nota media de aprobados: ' + suma / contador);