/*
EJERCICIO 20

Realiza un programa con el que poder jugar al Ahorcado. Hazlo del siguiente modo:
Preparación del juego:

    1. Crea un array que contenga estas 10 palabras: azulejo, tenedor, saltamontes,
       carretilla, molinero, sofisticado, terremoto, culinario, teclado y primavera.
    2. Al empezar el juego, la máquina debe elegir una palabra al azar del array. 
       Para ello, obtén un aleatorio entre 0 y 9.
    3. Ahora crea un array que sería lo que el usuario va a ver. Sería un array con el tamaño
       total de la palabra, en cada posición estarían las letras que el usuario haya acertado.


Desarrollo del juego
1. Muestra al usuario el array de letras que ya ha tiene acertadas. Donde no haya
ninguna letra acertada, muestra un hueco para que el usuario sepa cuál es el tamaño
total.
2. Solicita al usuario una letra.
3. Comprueba si está en la palabra. Si está, rellena el array de letras en la posición o
posiciones correctas. Si no está, incrementa un contador de intentos fallidos y
muéstralo.
4. Si el contador de intentos fallidos ha llegado a 10, muestra GAME OVER. Fin del juego.
5. Si no, repetir de nuevo desde el punto 1.
Fin del juego
1. Terminará cuando el contador de intentos fallidos llegue a 10 o cuando todas las letras
estén descubiertas. 
*/

/* 1. Crea un array que contenga estas 10 palabras:        
       (azulejo, tenedor, saltamontes, carretilla, molinero, sofisticado, terremoto, culinario, teclado, primavera). */
const aPosiblesPalabras = ['azulejo', 'tenedor', 'saltamontes', 'carretilla', 'molinero', 'sofisticado', 'terremoto', 'culinario', 'teclado', 'primavera'];

/* 2. Al empezar el juego, la máquina debe elegir una palabra al azar del array. 
      Para ello, obtén un aleatorio entre 0 y 9. */
let numeroRandom;
let palabraElegida;
let palabraAcertada = '';
let entradaUsuario;
let letraSubstring;
let check = true;
let mensaje = 'Adivina la palabra: ';

numeroRandom = Math.floor(Math.random() * 10);
palabraElegida = aPosiblesPalabras[numeroRandom];

for (let i = 0; i < palabraElegida.length; i++) {
    if (i === palabraElegida.length - 1) {
        palabraAcertada += '_';
    } else {
        palabraAcertada += '_ '
    }
}
console.log(mensaje + palabraAcertada);


do {
    entradaUsuario = prompt("Introduce una vocal o consonante: ").toLowerCase();
    
    if (palabraAcertada.includes(entradaUsuario)) {
        alert("Ya has dicho esa letra");
        continue;
    } else if (!palabraElegida.includes(entradaUsuario)) {
        alert("Esa letra no está en la plabra");
        continue;
    }

    for (let i = 0; i < palabraElegida.length; i++) {
        
        letraSubstring = palabraElegida.substring(i, i + 1);
        
        if (letraSubstring === entradaUsuario) {
            
        }
        
            
        
    }
    console.log(mensaje + palabraAcertada);
    
} while (check);
