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

//import { tirarDado } from "./funciones.js";
import * as misFunciones from "./funciones.js";

const CASILLA19 = 19;
const CASILLA31 = 31;
const CASILLA56 = 56;

let posicionJugador = 0;
let posicionMaquina = 0;
let numeroSacado = 0;
let penalizacionJugador = 0;
let penalizacionMaquina = 0;
let resta;
let turnoJugador = true;
let turnoMaquina = true;
let check = true;

//posicionJugador = 59;

do {
  penalizacionJugador--;
  penalizacionMaquina--;

  while (turnoJugador) {

    turnoJugador = false;
    /* SE TIRA EL DADO AL COMIENZO DE LA RONDA */
    alert("Es tu turno JUGADOR\nActualmente estás en la posición " + posicionJugador + "\nPresiona ENTER para lanzar el dado");
    numeroSacado = misFunciones.tirarDado();

    if (numeroSacado === 6) {
      alert("Has sacado un " + numeroSacado + "\n\nRepites turno de momento...");
      turnoJugador = true;
    } else {
      alert("Has sacado un " + numeroSacado);
    }

    posicionJugador += numeroSacado;

    /* COMPROBACIÓN SI LA TIRADA SUPERA LA CASILLA 60 */
    while (posicionJugador > 60) {
      resta = posicionJugador - 60;
      posicionJugador = 60 - resta;

      if (posicionJugador === 56) {
        alert("Has caido en la casilla 56, pierdes 3 turnos:");
        penalizacionJugador = 3;
        turnoJugador = false;
      } else if (posicionJugador === 55) {
        alert("Has caido en una Oca y tiro por que me toca... Presiona ENTER para tirar de nuevo");
        numeroSacado = misFunciones.tirarDado();
        posicionJugador += numeroSacado;
        alert("Has sacado un " + numeroSacado);
      }
    }

    /* COMPROBAMOS SI HA CAIDO EN UNA OCA */
    while (posicionJugador % 5 === 0 && posicionJugador != 60) {
      if (posicionJugador === 55) {
        alert("Has caido en la última Oca, no sumas nada pero vuelves a tirar dado.");
        numeroSacado = misFunciones.tirarDado();
        alert("Has sacado un " + numeroSacado);
        posicionJugador += numeroSacado;
        while (posicionJugador > 60) {
          resta = posicionJugador - 60;
          posicionJugador = 60 - resta;

          if (posicionJugador === 56) {
            alert("Has caido en la casilla 56, pierdes 3 turnos:");
            penalizacionJugador = 3;
            turnoJugador = false;
          } else if (posicionJugador === 55) {
            alert("Has caido en una Oca y tiro por que me toca... Presiona ENTER para tirar de nuevo");
            numeroSacado = misFunciones.tirarDado();
            posicionJugador += numeroSacado;
            alert("Has sacado un " + numeroSacado);
          }
        }
      } else {
        alert("Has caido en una Oca, casilla " + posicionJugador + " pasas a la casilla de la siguiente Oca a la "
          + (posicionJugador + 5) + " y tiro por que me toca...\nPresiona ENTER para tirar de nuevo");
        posicionJugador += 5;
        numeroSacado = misFunciones.tirarDado();
        if (numeroSacado === 6 && turnoJugador === false) {
          alert("Has sacado un " + numeroSacado + "\n\nRepites turno de momento...");
          turnoJugador = true;
        }
        alert("Has sacado un " + numeroSacado);
        posicionJugador += numeroSacado;
        while (posicionJugador > 60) {
          resta = posicionJugador - 60;
          posicionJugador = 60 - resta;

          if (posicionJugador === 56) {
            alert("Has caido en la casilla 56, pierdes 3 turnos:");
            penalizacionJugador = 3;
            turnoJugador = false;
          } else if (posicionJugador === 55) {
            alert("Has caido en una Oca y tiro por que me toca... Presiona ENTER para tirar de nuevo");
            numeroSacado = misFunciones.tirarDado();
            posicionJugador += numeroSacado;
            alert("Has sacado un " + numeroSacado);
          }
        }
      }
    }

    /* EVALUAMOS FINALMENTE LAS CONDICIONES DE LAS CASILLAS NORMALES */
    if (posicionJugador === CASILLA19) {
      alert("Oh que pena, caes en la casilla 19. Pierdes 1 turno");
      turnoJugador = false;
      penalizacionJugador = 1;
    } else if (posicionJugador === CASILLA31) {
      turnoJugador = false;
      alert("Oh que pena, caes en la casilla 31. Pierdes 2 turnos");
      penalizacionJugador = 2;
    } else if (posicionJugador === CASILLA56) {
      turnoJugador = false;
      alert("Oh que pena, caes en la casilla 56. Pierdes 3 turnos");
      penalizacionJugador = 3;
    }

    /* FINALMENTE COMPROBAMOS SI LA POSICIÓN ES 60 */
    if (posicionJugador === 60) {
      alert("Alcanzas la posición 60, HAS GANADO !!");
      turnoJugador = false;
      turnoMaquina = false;
    } else {
      alert("Fin de turno, tu posición final es la casilla: " + posicionJugador);
    }

  }

  while (turnoMaquina) {

    turnoMaquina = false;
    /* SE TIRA EL DADO AL COMIENZO DE LA RONDA */
    alert("Es el turno de la MÁQUINA\nActualmente está en la posición " + posicionMaquina + "\nPresiona ENTER para lanzar el dado");
    numeroSacado = misFunciones.tirarDado();

    if (numeroSacado === 6) {
      alert("Ha sacado un " + numeroSacado + "\n\nRepetirá turno de momento...");
      turnoMaquina = true;
    } else {
      alert("Ha sacado un " + numeroSacado);
    }

    posicionMaquina += numeroSacado;

    /* COMPROBACIÓN SI LA TIRADA SUPERA LA CASILLA 60 */
    while (posicionMaquina > 60) {
      resta = posicionMaquina - 60;
      posicionMaquina = 60 - resta;

      if (posicionMaquina === 56) {
        alert("Ha caido en la casilla 56, pierdes 3 turnos:");
        penalizacionMaquina = 3;
        turnoMaquina = false;
      } else if (posicionMaquina === 55) {
        alert("Ha caido en una Oca y tira por que le toca... Presiona ENTER para tirar de nuevo");
        numeroSacado = misFunciones.tirarDado();
        posicionMaquina += numeroSacado;
        alert("Ha sacado un " + numeroSacado);
      }
    }

    /* COMPROBAMOS SI HA CAIDO EN UNA OCA */
    while (posicionMaquina % 5 === 0 && posicionMaquina != 60) {
      if (posicionMaquina === 55) {
        alert("Ha caido en la última Oca, no suma nada pero vuelve a tirar dado.");
        numeroSacado = misFunciones.tirarDado();
        alert("Ha sacado un " + numeroSacado);
        posicionMaquina += numeroSacado;
        while (posicionMaquina > 60) {
          resta = posicionMaquina - 60;
          posicionMaquina = 60 - resta;

          if (posicionMaquina === 56) {
            alert("Ha caido en la casilla 56, pierde 3 turnos:");
            penalizacionMaquina = 3;
            turnoMaquina = false;
          } else if (posicionMaquina === 55) {
            alert("Ha caido en una Oca y tira por que le toca... Presiona ENTER para tirarle de nuevo");
            numeroSacado = misFunciones.tirarDado();
            posicionMaquina += numeroSacado;
            alert("Ha sacado un " + numeroSacado);
          }
        }
      } else {
        alert("Has caido en una Oca, casilla " + posicionMaquina + " pasas a la casilla de la siguiente Oca a la "
          + (posicionMaquina + 5) + " y tiro por que me toca...\nPresiona ENTER para tirar de nuevo");
        posicionMaquina += 5;
        numeroSacado = misFunciones.tirarDado();
        if (numeroSacado === 6 && turnoMaquina === false) {
          alert("Has sacado un " + numeroSacado + "\n\nRepites turno de momento...");
          turnoMaquina = true;
        }
        alert("Has sacado un " + numeroSacado);
        posicionMaquina += numeroSacado;
        while (posicionMaquina > 60) {
          resta = posicionMaquina - 60;
          posicionMaquina = 60 - resta;

          if (posicionMaquina === 56) {
            alert("Has caido en la casilla 56, pierdes 3 turnos:");
            penalizacionMaquina = 3;
            turnoJugador = false;
          } else if (posicionMaquina === 55) {
            alert("Has caido en una Oca y tiro por que me toca... Presiona ENTER para tirar de nuevo");
            numeroSacado = misFunciones.tirarDado();
            posicionMaquina += numeroSacado;
            alert("Has sacado un " + numeroSacado);
          }
        }
      }
    }

    /* EVALUAMOS FINALMENTE LAS CONDICIONES DE LAS CASILLAS NORMALES */
    if (posicionMaquina === CASILLA19) {
      alert("Oh que pena, caes en la casilla 19. Pierdes 1 turno");
      turnoMaquina = false;
      penalizacionMaquina = 1;
    } else if (posicionMaquina === CASILLA31) {
      turnoMaquina = false;
      alert("Oh que pena, caes en la casilla 31. Pierdes 2 turnos");
      penalizacionMaquina = 2;
    } else if (posicionMaquina === CASILLA56) {
      turnoMaquina = false;
      alert("Oh que pena, caes en la casilla 56. Pierdes 3 turnos");
      penalizacionMaquina = 3;
    }

    /* FINALMENTE COMPROBAMOS SI LA POSICIÓN ES 60 */
    if (posicionMaquina === 60) {
      alert("La máquina alcanza la posición 60, TE HA GANADO !!");
      turnoJugador = false;
      turnoMaquina = false;
    } else {
      alert("Fin de turno, la posición final de la MÁQUINA es la casilla: " + posicionMaquina);
    }
  }

  if (posicionJugador === 60 || posicionMaquina === 60) {
    break;
  } else if (penalizacionJugador > 0) {
    turnoJugador = false;
  } else if (penalizacionJugador <= 0) {
    turnoJugador = true;
  }

  if (penalizacionMaquina > 0) {
    turnoMaquina = false;
  } else if (penalizacionMaquina <= 0) {
    turnoMaquina = true;
  }



} while (check);
