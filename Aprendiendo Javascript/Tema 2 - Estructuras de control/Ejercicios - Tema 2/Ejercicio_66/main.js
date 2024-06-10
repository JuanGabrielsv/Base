/*
EJERCICIO 66
El juego consiste en adivinar un número aleatorio generado por el ordenador entre el rango que le indiques. 
Se le preguntará al usuario:

  1 - El número inicial del rango.
  2 - El número final del rango.
  3 - El número de intentos en los que crees que vas a adivinar el número secreto.

Se generará el número aleatorio entre los rangos marcados por el usuario.
EL usuario tendrá que ir proponiendo valores mientras que le queden intentos por adivinar. 
*/

import * as misFunciones from "./funciones.js";

let numeroRandom;
let rangoInicial;
let rangoFinal;
let numeroDeIntentos;
let numero;
let acertado = true;
let check = true;

while (check) {
  try {
    rangoInicial = BigInt(prompt("Introduce el número del inicio del rango: "));
    if (rangoInicial < 0) {
      alert("El número no puede ser menor que 0");
    } else {
      break;
    }
  } catch (error) {
    alert("Tienes que introducir un número entero, no valen decimales, letras o espacios...");
  }
}

while (check) {
  try {
    rangoFinal = BigInt(prompt("Rango Inicial: " + rangoInicial + "\n\nIntroduce el número del final del rango: "));
    if (rangoFinal === rangoInicial) {
      alert("El rango inicial no puede ser igual que el rango final");
    } else if (rangoFinal < rangoInicial) {
      alert("El rango final no puede ser menor que el rango inicial");
    } else {
      break;
    }
  } catch (error) {
    alert("Tienes que introducir un número entero, no valen decimales, letras o espacios...");
  }
}

while (check) {
  try {
    numeroDeIntentos = BigInt(prompt("Rango Inicial: " + rangoInicial + "\nRango Final: " + rangoFinal + "\n\nIntroduce las cantidad de intentos que vas a usar: "));
    if (numeroDeIntentos <= 0) {
      alert("El número de intentos no puede ser 0 o menor...");
    } else {
      break;
    }
  } catch (error) {
    alert("Tienes que introducir un número entero, no valen decimales, letras o espacios...");
  }
}

numeroRandom = misFunciones.generarNumeroRandomEntreDosNumeros(rangoInicial, rangoFinal);

while (numeroDeIntentos > 0) {
  try {
    numero = BigInt(prompt("Rango Inicial: " + rangoInicial + "\nRango Final: " + rangoFinal + "\nNumero de intentos: " + numeroDeIntentos + "\n\n¿Qué número ha salido?"));
    if (numero === BigInt(numeroRandom)) {
      acertado = true;
      break;
    } else if (numero < rangoInicial) {
      alert("El número no puede ser inferior al rango inicial");
    } else if (numero > rangoFinal) {
      alert("El rango no puede ser mayor que el rango final");
    } else {
      numeroDeIntentos--;
      acertado = false;
      alert("* NO HAS ACERTADO *\n\nRango Inicial: " + rangoInicial + "\nRango Final: " + rangoFinal + "\nNumero de intentos: " + numeroDeIntentos);
    }
  } catch (error) {
    alert("Tienes que introducir un número entero, no valen decimales, letras o espacios...");
  }
}

if (acertado === true) {
  alert("Has acertado, GANAS LA PARTIDA");
} else {
  alert("Te quedastes sin intentos y no has acertado, eres un pringad@ bye!\n\nEl número era el: " + numeroRandom);
}






