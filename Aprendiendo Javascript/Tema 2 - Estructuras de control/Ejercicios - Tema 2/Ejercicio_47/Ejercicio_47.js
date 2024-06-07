/* 
EJERCICIO 47

Realizar un programa que genere contraseñas del siguiente modo: pedirá al usuario una
palabra de al menos 8 caracteres. 
Si no tiene esa longitud, volverá a pedir otra hasta que el usuario indique una de al menos esa longitud. Después, el programa cambiará las letras de esa
palabra por números siguiendo estas reglas:

 a -> 4
 e -> 3
 i -> 1
 o -> 0
 t -> 7

El resultado se mostrará por consola. 
*/

const TAMANO_MINIMO = 8;

let vPalabra;
let vPalabraCodificada;
let check = true;

while (check) {

    vPalabra = prompt('Introduce una palabra');
    if (vPalabra === null) {
        alert('El tamaño de la palabra tiene que tener 8 carácteres como mínimo');        
    
    } else if (vPalabra.length < TAMANO_MINIMO) {
        alert('El tamaño de la palabra tiene que tener 8 carácteres como mínimo');
    
    } else {
        check = false;
    }
    vPalabraCodificada = vPalabra;
    vPalabraCodificada = vPalabraCodificada.replaceAll('a', '4');
    vPalabraCodificada = vPalabraCodificada.replaceAll('e', '3');
    vPalabraCodificada = vPalabraCodificada.replaceAll('i', '1');
    vPalabraCodificada = vPalabraCodificada.replaceAll('o', '0');
    vPalabraCodificada = vPalabraCodificada.replaceAll('t', '7');

    alert(vPalabraCodificada);
    
}
