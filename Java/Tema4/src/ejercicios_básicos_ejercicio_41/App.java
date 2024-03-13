/*
EJERCICIO 41
Vamos a crear un programa para gestionar los partidos de futbol de la liguilla interna de la
CEU. Para ello, nos crearemos un conjunto de clases para poder manejar los datos. Las clases
son las siguiente:

• Jugador.
	o Atributos privados con métodos get y set:
		- Nombre -> String
		- Dorsal -> Integer
	o Constructor que reciba los dos atributos por parámetro
	o Método equals() que compare los dorsales
	o Método toString() para que imprima algo tal que: “9 – Blas”

• Equipo.
	o Atributos privados con métodos get y set:
		- Nombre -> String
		- Capitan -> Jugador
		- Jugadores -> Lista de Jugador
	o Constructor que reciba por parámetro el atributo nombre.
	o Método equals que compare los nombres.
	o Método toString para que se imprima algo tal que así:
	
	Real Madrid C.F. – Capitán: Marcelo – Jugadores: [1 – Courtois, 2- Carvajal, …]
	
• Resultado.
	o Atributos privados con métodos get y set:
		• golesLocales  Integer
		• golesVisitante  Integer
	o Constructor por defecto que inicializa el resultado a 0
	o Método equals que compare los dos atributos
	o Método toString para que se imprima algo tal que así: 0 – 0
	o Métodos:
		• isVictoriaLocal() que devuelve Boolean si han ganado los locales
		• isVictoriaVisitante() que devuelve Boolean si han ganado los visitantes
		• isEmpate() que devuelve Boolean si ha sido empate.
		
• Partido.
	o Atributos privados con métodos get y set:
		- equipoLocal -> Equipo
		- equipoVisitante -> Equipo
		- resultado -> Resultado
	o Constructor por defecto
	o Método toString para que se imprima algo tal que así:
	
		Real Madrid C.F. vs F.C.Barcelona [0 – 0]
		
	o Métodos:
		• getEquipoGanador() que devuelve el Equipo que haya ganado. Si hay empate, devolverá null.
		
Cuando tengas todas las clases terminadas, crea un programa que haga lo siguiente:

1. Crea dos equipos con al menos 3 jugadores cada uno. Solicitando los datos al usuario.
Designa al capitán de cada equipo (será el primer jugador indicado). Cuando los
tengas, imprime los equipos por consola.
2. Crea un partido para estos dos equipos. Establece el resultado en 0 a 0. Imprime el
partido.
3. Pregunta al usuario por el resultado y cámbialo. Imprime el partido.
4. Imprime el equipo ganador.
5. Añade al equipo visitante un jugador con el dorsal 99 y nombre “Blas infiltrado”. Imprime el equipo visitante.
6. Cambia el capitán del equipo local para que sea el último jugador de la lista de sus jugadores. Imprime el equipo local. 
*/

package ejercicios_básicos_ejercicio_41;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
