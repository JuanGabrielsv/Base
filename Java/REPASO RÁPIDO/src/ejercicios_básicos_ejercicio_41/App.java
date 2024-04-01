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
		• golesLocales -> Integer
		• golesVisitante -> Integer
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

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		

		// 1. Crea dos equipos con al menos 3 jugadores cada uno. Solicitando los datos al usuario.
		// Designa al capitán de cada equipo (será el primer jugador indicado). Cuando los
		// tengas, imprime los equipos por consola.

		System.out.println("DIME EL NOMBRE DEL PRIMER EQUIPO: ");
		Equipo equipo1 = new Equipo(sc.nextLine());
		cargarJugadores(sc, equipo1);		

		System.out.println("DIME EL NOMBRE DEL SEGUNDO EQUIPO: ");
		Equipo equipo2 = new Equipo(sc.nextLine());
		cargarJugadores(sc, equipo2);
		
		System.out.println(equipo1);
		System.out.println(equipo2);
		
		// 2. Crea un partido para estos dos equipos. Establece el resultado en 0 a 0. Imprime el partido.
		
		Partido partido1 = new Partido();
		Resultado resultado1 = new Resultado();		
		partido1.setEquipoLocal(equipo1);
		partido1.setEquipoVisitante(equipo2);
		partido1.setResultado(resultado1);
		System.out.println(partido1);
		
		// 3. Pregunta al usuario por el resultado y cámbialo. Imprime el partido.
		
		System.out.println("DIME LOS GOLES PARA EL EQUIPO " + equipo1.getNombreEquipo());
		partido1.getResultado().setGolesLocales(Integer.parseInt(sc.nextLine()));
		System.out.println("DIME LOS GOLES PARA EL EQUIPO " + equipo2.getNombreEquipo());
		partido1.getResultado().setGolesVisitante(Integer.parseInt(sc.nextLine()));
		System.out.println(partido1);
		
		// 4. Imprime el equipo ganador.
		
		System.out.println(partido1.getEquipoGanador());
		
		// 5. Añade al equipo visitante un jugador con el dorsal 99 y nombre “Blas infiltrado”. Imprime el equipo visitante.
		
		Jugador infiltrado = new Jugador("Blas infiltrado", 99);
		equipo2.getJugadores().add(infiltrado);
		System.out.println(equipo2);
		
		// 6. Cambia el capitán del equipo local para que sea el último jugador de la lista de sus jugadores. Imprime el equipo local.
		
		equipo1.setCapitan(equipo1.getJugadores().get(equipo1.getJugadores().size() - 1));
		System.out.println(equipo1);
		
		sc.close();

	}

	private static void cargarJugadores(Scanner sc, Equipo equipo) {
		for (int i = 0; i < 3; i++) {
			System.out.println("INTRODUCE EL DORSAL: ");
			Integer dorsal = Integer.parseInt(sc.nextLine());
			System.out.println("INTRODUCE EL NOMBRE DE JUGADOR: ");
			String nombre = sc.nextLine();
			Jugador jugador = new Jugador(nombre, dorsal);
			equipo.getJugadores().add(jugador);
		}
		equipo.setCapitan(equipo.getJugadores().get(0));
	}

}
