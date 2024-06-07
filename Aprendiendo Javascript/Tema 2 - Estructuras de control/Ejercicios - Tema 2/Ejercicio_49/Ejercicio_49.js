/*
EJERCICIO 49

Realizar un programa que solicite al usuario una palabra por consola. 
Mostrar por consola las diferentes letras de esa palabra en cada línea. 
Por ejemplo, si la palabra indicada por el usuario es “indonesia” el resultado debería ser:

i
n
d
o
n
e
s
i
a 
*/

let vPalabra;
let vMensaje = '';

console.log('Introduce una palabra');
vPalabra = prompt();

for (let i = 0; i < vPalabra.length; i++) {    
        vMensaje += vPalabra.substring(i, i + 1) + '\n';      
}

console.log(vMensaje);