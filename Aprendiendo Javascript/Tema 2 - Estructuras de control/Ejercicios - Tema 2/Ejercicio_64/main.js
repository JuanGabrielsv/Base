/*
EJERCICIO 64
Realiza un programa para que puedas jugar contra el ordenador a los chinos. La dinámica sería:

    1. El programa generará de forma aleatoria la cantidad de chinas que guarda en su
       mano (entre 0 y 3).
    2. El programa solicita la apuesta al usuario (tendrá que ser un número entre 0 y 6).
       Si no es así, volver a solicitarlo.
    3. El programa a continuación genera su apuesta de forma aleatoria (entre 0 y 6,
       pero no puede ser la misma que la del usuario). Una vez generada, se la indica al
       usuario.
    4. El programa solicita al usuario que “abra su mano”, es decir, que indique cuántas
       chinas esconde.
    5. El programa indicará el resultado final del juego: Si ha ganado el usuario, si ha
       ganado el programa, o si no ha ganado nadie.
    6. Al terminar el juego se pregunte al usuario si quiere otra partida. En caso afirmativo, repetir.
       Cuando el usuario no quiera más partidas, mostrar el marcador final. 
*/

let manoMaquina;
let check = true;
let apuestaJugador;
let apuestaMaquina;
let manoJugador;
let contadorGanadas = 0;
let contadorPerdidas = 0;
let contadorEmpatadas = 0;
let puntuacionMaquina = 0;
let puntuacionJugador = 0;

do {
   apuestaJugador = prompt("¿Cuánto apuestas? 1, 2, 3, 4 o 5");
   if (apuestaJugador > 0 && apuestaJugador < 6) {
      apuestaMaquina = Math.floor(Math.random() * 5) + 1;
      while (apuestaJugador == apuestaMaquina) {
         apuestaMaquina = Math.floor(Math.random() * 5) + 1;
      }
      alert("Apuesta de la máquina: " + apuestaMaquina + "\nApuesta del jugador: " + apuestaJugador);
      manoJugador = prompt("¿Cuántas chinas tienes en la mano?");
      while (manoJugador > 3 || manoJugador < 0) {
         alert("Has introducido una mentira, repite...");
         manoJugador = prompt("¿Cuántas chinas tienes en la mano?");
      }
      manoMaquina = Math.floor(Math.random() * 4);
      if (manoJugador > manoMaquina) {
         contadorGanadas++;
         puntuacionJugador += apuestaMaquina;
         puntuacionMaquina = puntuacionMaquina - apuestaMaquina;
         alert("HAS GANADO\n\nChinas de la máquina: " + manoMaquina + "\nChinas en tu mano: " + manoJugador);
      } else if (manoJugador < manoMaquina) {
         contadorPerdidas++;
         puntuacionJugador = puntuacionJugador - apuestaJugador;
         puntuacionMaquina += apuestaJugador;
         alert("HAS PERDIDO\n\nChinas de la máquina: " + manoMaquina + "\nChinas en tu mano: " + manoJugador);
      } else {
         contadorEmpatadas++;
         alert("EMPATE\n\nChinas de la máquina: " + manoMaquina + "\nChinas en tu mano: " + manoJugador);
      }
      check = confirm("¿Quieres jugar otra partida?");
      if (check === false) {
         alert("RESULTADO\n\nPartidas ganadas: " + contadorGanadas + "\nPartida empatadas: " + contadorEmpatadas + "\nPartidas perdidas: " 
            + contadorPerdidas + "\n\nPuntuación máquina: " + puntuacionMaquina + "\nPuntuación Jugador: " + puntuacionJugador);
      }
   } else if (apuestaJugador === null) {
      check = false;
   }
   else {
      alert("Has introducido una opción no válida");
   }
} while (check);