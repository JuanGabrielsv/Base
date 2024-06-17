/*
EJERCICIO 08

1. Crea un array de números decimales que tenga este contenido: 5.4, 3.1, 9.0, 4.7
2. Imprime el contenido del array utilizando un bucle foreach
3. Calcula la suma de todo el array utilizando también un bucle foreach 
*/

const arrayNumeros = [5.4, 3.1, 9.0, 4.7];

let suma = 0;

arrayNumeros.forEach(element => {
    console.log(element);
});

arrayNumeros.forEach(element => {
    suma += element;
});

alert(suma);