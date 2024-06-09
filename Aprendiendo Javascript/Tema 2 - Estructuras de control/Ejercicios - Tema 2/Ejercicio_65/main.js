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

let posicionJugador = 0;
let posicionMaquina = 0;
let numeroSacado = 0;
let check = true;



do {
  alert("\nJugador: posicion " + posicionJugador + "\nMáquina: posicion " + posicionMaquina + "\n\nTurno del JUGADOR. Pulse ENTER para tirar el dado.");
  numeroSacado = tirarDado();
  if (numeroSacado === 6) {
    posicionJugador += numeroSacado;
    alert("HAS SACADO UN " + numeroSacado + "!!\n\nAvanzas a la posición: " + posicionJugador);
    
  }
  
  
  check = false;
} while (check);