/*Equipo.
	o Atributos privados con métodos get y set:
		- Nombre -> String
		- Capitan -> Jugador
		- Jugadores -> Lista de Jugador
	o Constructor que reciba por parámetro el atributo nombre.
	o Método equals que compare los nombres.
	o Método toString para que se imprima algo tal que así:
	
	Real Madrid C.F. – Capitán: Marcelo – Jugadores: [1 – Courtois, 2- Carvajal, …]
*/

package ejercicios_básicos_ejercicio_41;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Equipo {
	
	//Atributos privados con métodos get y set:
	//	- Nombre -> String
	//	- Capitan -> Jugador
	//	- Jugadores -> Lista de Jugador
	
	private String nombreEquipo;
	private Jugador capitan;
	private List<Jugador> jugadores;
	
	// Constructor que reciba por parámetro el atributo nombre.
	
	public Equipo (String nombre) {
		this.nombreEquipo = nombre;
		jugadores = new ArrayList<>();
	}
	
	// GETTERS AND SETTERS.

	public String getNombreEquipo() {
		return nombreEquipo;
	}

	public void setNombreEquipo(String nombreEquipo) {
		this.nombreEquipo = nombreEquipo;
	}

	public Jugador getCapitan() {
		return capitan;
	}

	public void setCapitan(Jugador capitan) {
		this.capitan = capitan;
	}

	public List<Jugador> getJugadores() {
		return jugadores;
	}

	public void setJugadores(List<Jugador> jugadores) {
		this.jugadores = jugadores;
	}
	
	// Método equals que compare los nombres.

	@Override
	public int hashCode() {
		return Objects.hash(nombreEquipo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Equipo other = (Equipo) obj;
		return Objects.equals(nombreEquipo, other.nombreEquipo);
	}
	
	// Método toString para que se imprima algo tal que así:	
	// Real Madrid C.F. – Capitán: Marcelo – Jugadores: [1 – Courtois, 2- Carvajal, …]

	@Override
	public String toString() {
		return nombreEquipo + " - Capitán: " + capitan + " - Jugadores: " + jugadores;
	}
	
	
	
	

}
