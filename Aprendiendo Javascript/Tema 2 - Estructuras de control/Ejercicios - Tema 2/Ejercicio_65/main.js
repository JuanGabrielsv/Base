/*
EJERCICIO 65
Construye un programa que sea el juego de la oca donde puedas jugar contra el ordenador. 
El programa irá mostrando en cada tirada en qué casilla (en qué número) se encuentra cada jugador.
Es decir, al principio saldrá:

- Jugador: posición 0
- Ordenador: posición 0
Turno de “Jugador”. Pulse ENTER para tirar el dado.

- En cada turno le irá tocando al jugador o al ordenador alternativamente. 
- Para dar paso al siguiente turno siempre el usuario tendrá que pulsar ENTER.
- La simulación del dado se debe hacer con un aleatorio entre 1 y 6. 
- Según el resultado del dado se debe sumar la posición que ocupa jugador u ordenador (según en qué turno estemos).
- Ganará quien llegue antes a la casilla 60.
- Si te pasas del 60 debes retroceder. Es decir, si estoy en el 58 y me toca un 5, debo ir a la
  posición 57 (59, 60, 59, 58 y 57).
- Si a un jugador le toca en el dado un 6 repetirá turno.
- Si un jugador cae en alguna casilla múltiplo de 5, podrá avanzar (de oca a oca y tiro
  porque me toca) a la siguiente casilla que sea múltiplo de 5. Cuando ocurra algo así, avisa al usuario de lo ocurrido.
- Si caes en la casilla de la posición 19, pierdes un turno.
- Si caes en la casilla de la posición 31, pierdes dos turnos.
- Si caes en la casilla de la posición 56, pierdes tres turnos.
Cuando ocurra algo así, debes avisar al usuario de lo ocurrido.
*/

import { tirarDado } from "./funciones.js";

const CASILLA19 = 19;
const CASILLA31 = 31;
const CASILLA56 = 56;

let posicionJugador = 0;
let posicionMaquina = 0;
let numeroSacado = 0;
let turnoGlobal = 0;
let penalizacion = 0;
let turnoJugador = true;
let turnoMaquina = true;
let check = true;



do {
  turnoGlobal++;

  while (turnoJugador) {
    
    alert("\nJugador: posicion " + posicionJugador + "\nMáquina: posicion " + posicionMaquina + "\n\nTurno del JUGADOR. Pulse ENTER para tirar el dado.");
    numeroSacado = tirarDado();
    posicionJugador += numeroSacado;

    if (posicionJugador > 60) {
      
    }

    while (posicionJugador < 60) {
      
    }

    if (numeroSacado === 6) {
      posicionJugador += numeroSacado;
      alert("HAS SACADO UN " + numeroSacado + " repites turno...");
      turnoJugador = true;
    }

    alert("Has sacado un " + numeroSacado + "\nAvanzas a la posicion " + posicionJugador);

    do {
      if (posicionJugador % 5 === 0) {
        posicionJugador += 5;
        alert("Has caido en una Oca\nTu nueva posición es: " + posicionJugador + " vuelve a tirar el dado, presiona ENTER");
        numeroSacado = tirarDado();
        posicionJugador += numeroSacado;
        alert("Sacas un " + numeroSacado + " y continuas a la casilla " + posicionJugador);
      }
    } while (numeroSacado === 5);

    if (posicionJugador === CASILLA19) {
      alert("Oh que pena, caes en la casilla 19. Pierdes 1 turno");
      turnoJugador = false;
      penalizacion = 1;
    } else if (posicionJugador === CASILLA31) {
      turnoJugador = false;
      alert("Oh que pena, caes en la casilla 31. Pierdes 1 turno");
      penalizacion = 2;
    } else if (posicionJugador === CASILLA56) {
      turnoJugador = false;
      alert("Oh que pena, caes en la casilla 56. Pierdes 1 turno");
      penalizacion = 3;
    }

      

    

    
  
  }
  check = false;
} while (check);















/*if (posicionJugador % 5 === 0) {
        posicionJugador += 5;
        alert("Has caido en un Oca, y tiro por que me toca !\nHas pasado a la posición: " + posicionJugador + "\nPresiona ENTER para volver a tirar el dado.");
        numeroSacado = tirarDado();                       
      } 

      if (posicionJugador === CASILLA19) {        
        alert("Has caido en la casilla " + posicionJugador + ", pierdes un turno.");        
        penalizacion = 1;        
      } else if (posicionJugador === CASILLA31) {
        alert("Has caido en la casilla " + posicionJugador + ", pierdes dos turnos.");        
        penalizacion = 2;
      } else if (posicionJugador === CASILLA56) {
        alert("Has caido en la casilla " + posicionJugador + ", pierdes tres turnos.");        
        penalizacion = 3;
      }*/