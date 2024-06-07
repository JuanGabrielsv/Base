/* 
EJERCICIO 51

• Realizar un programa que solicite una palabra al usuario y luego la escriba invertida. 
• Por ejemplo, si la palabra indicada es “indonesia”, el resultado debería ser “aisenodni”.
• Cuando te funcione, prueba con un palíndromo.
*/

let vPalabra = String();
let vPalabraInvertida = String('');

vPalabra = prompt('Introduce una palabra');

for (let i = vPalabra.length; i >= 0; i--) {
    vPalabraInvertida += vPalabra.substring(i - 1, i);
}

alert(vPalabraInvertida);
