/*
EJERCICIO 09
Solicita una palabra al usuario y a continuación deletréala (imprime cada letra por separado).
Utiliza para ello un .from y un bucle foreach 
*/

let arrayPalabra;

let palabra = 'Manolito';

arrayPalabra = Array.from(palabra);

arrayPalabra.forEach(element => {
    console.log(element);
});

alert(arrayPalabra);