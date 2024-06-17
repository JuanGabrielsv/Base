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
const arrayPosiblesPalabras = ['azulejo', 'tenedor', 'saltamontes', 'carretilla', 'molinero', 'sofisticado', 'terremoto', 'culinario', 'teclado', 'primavera'];

/* 2. Al empezar el juego, la máquina debe elegir una palabra al azar del array. 
      Para ello, obtén un aleatorio entre 0 y 9. */
const arrayLetrasDelUsuario = new Array();

let arrayPalabraSecreta = [];
let numeroRandom;
let palabraElegida;
let entradaUsuario;
let intentos = 10;
let existe = false;
let mensaje = 'Adivina la palabra: ';

/* ELEGIMOS LA PALABRA SECRETA POR NÚMERO RANDOM */
numeroRandom = Math.floor(Math.random() * 10);
palabraElegida = arrayPosiblesPalabras[numeroRandom];

arrayPalabraSecreta = Array.from(palabraElegida);
const arrayPalabraAcertada = new Array(arrayPalabraSecreta.length);

for (let i = 0; i < arrayPalabraAcertada.length; i++) {
    arrayPalabraAcertada[i] = '_';
}

while (intentos > 0) {
    existe = false;
    entradaUsuario = prompt(mensaje + arrayPalabraAcertada + '\nIntentos: ' + intentos + '\nIntroduce un letra: ');

    // VALIDACIÓN DE LETRA INTRODUCIDA
    if (entradaUsuario !== null && entradaUsuario !== '' && entradaUsuario.length === 1 && entradaUsuario != 0) {
        entradaUsuario = entradaUsuario.toLowerCase().trim();
    } else {
        alert('Datos incorrectos');
        continue;
    }

    // COMPROBAMOS SI LA LETRA ESTÁ EN LA PALABRA
    if (!palabraElegida.includes(entradaUsuario)) {
        alert("La letra no está en la palabra");
        intentos--;
        continue;
    }

    // COMPROBAMOS SI LA LETRA YA SE HA DICHO
    for (let i = 0; i < arrayLetrasDelUsuario.length; i++) {
        if (arrayLetrasDelUsuario[i] === entradaUsuario) {
            existe = true;
            break;
        }
    }
    if (existe) {
        alert("Ya has dicho esa letra");
        continue;
    }

    // SE HA PASADO TODAS LAS VALIDACIONES, AÑADIMOS LA LETRA AL ARRAY DE LETRAS DICHAS
    arrayLetrasDelUsuario.push(entradaUsuario);

    for (let i = 0; i < arrayPalabraSecreta.length; i++) {
        if (arrayPalabraSecreta[i] === entradaUsuario) {
            arrayPalabraAcertada[i] = (arrayPalabraSecreta[i]);
        }
    }

    if (arrayPalabraSecreta.toString() === arrayPalabraAcertada.toString()) {
        alert('Has acertado la palabra\n' + 'Palabra: ' + palabraElegida + '\n¡¡HAS GANADO!! ');
        break;
    }
}

if (intentos === 0) {
    alert('No has acertado la palabra...\nPalabra: ' + palabraElegida + '\n¡¡HAS PERDIDO!!');
}
