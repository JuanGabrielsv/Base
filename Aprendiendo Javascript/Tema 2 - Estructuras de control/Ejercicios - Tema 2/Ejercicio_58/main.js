/* 
EJERCICIO 58
Realizar un programa que juegue a Piedra/Papel/Tijera con el usuario. El programa funcionará
del siguiente modo:

    1. Mostrará un mensaje indicando: “Piedra, papel, tijera… un, dos, tres… ya!!”
    2. A continuación, se quedará esperando a que el usuario indique una de las tres
       opciones. Estas opciones se indicarán con la palabra completa, pero podrán ser
       escritas en mayúscula o minúsculas, nos da igual.
    3. Luego, el programa generará aleatoriamente su mano (una de las tres), y se la
       mostrará al usuario.
    4. Por último, indicará quién ha ganado y preguntará al usuario si desea echar
       otra partida. En caso afirmativo, repetir todo el proceso. En caso negativo, mostrar el
       marcador final de victorias y terminar. 
*/

const PIEDRA = "piedra";
const PAPEL = "papel";
const TIJERA = "tijera";

let check = true;
let elegidoJugador;
let elegidoMaquina;
let contadorEmpate = 0;
let contadorPerdidas = 0;
let contadorGanadas = 0;
let volverAJugar = true;

do {
  console.log("Piedra, papel, tijera... un, dos, tres... ya!!");
  while (check) {
    try {
      elegidoJugador = prompt("¿Qué eliges?").toLowerCase().trim();
      switch (elegidoJugador) {
        case PIEDRA:
          console.log("Has elegido: " + elegidoJugador);
          elegidoJugador = 1;
          break;
        case PAPEL:
          console.log("Has elegido: " + elegidoJugador);
          elegidoJugador = 2;
          break;
        case TIJERA:
          console.log("Has elegido: " + elegidoJugador);
          elegidoJugador = 3;
          break;
        default:
          console.error("Has introducido una opción no válida...");
          continue;
      }
    } catch (error) {
      console.error("Has introducido una opción no válida...");
      continue;
    }

    elegidoMaquina = Math.floor(Math.random() * 3) + 1;

    if (elegidoMaquina === 1) {
      console.log("La máquina ha elegido: piedra");
    } else if (elegidoMaquina === 2) {
      console.log("La máquina ha elegido: papel");
    } else {
      console.log("La máquina ha elegido: tijera");
    }

    if (elegidoJugador === elegidoMaquina) {
      console.log("empate");
      contadorEmpate++;
    } else if (
      (elegidoJugador === 1 && elegidoMaquina === 2) ||
      (elegidoMaquina === 3 && elegidoJugador === 2) ||
      (elegidoMaquina === 1 && elegidoJugador === 3)
    ) {
      console.log("pierdes");
      contadorPerdidas++;
    } else {
      console.log("ganas");
      contadorGanadas++;
    }

    console.log("¿Quieres volver a jugar?");
    volverAJugar = confirm();
    if (volverAJugar === true) {
      break;
    } else {
      console.log(
        "GANADAS: " +
          contadorGanadas +
          "\nPERDIDAS: " +
          contadorPerdidas +
          "\nEMPATADAS: " +
          contadorEmpate
      );
      check = false;
    }
  }
} while (check);
