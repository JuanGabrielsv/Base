package ejercicios_básicos_ejercicio_41;

import java.util.ArrayList;
import java.util.List;

public class Equipo {
	private String nombre;
	private Jugador capitan;
	private List<Jugador> jugadores;
	
	public Equipo(String nombre) {
		this.nombre = nombre;
		jugadores = new ArrayList<>();
	}
	
	public String getNombre() {
		return nombre;
	}
	
	@Override
	public String toString() {	
		return nombre + " - Capitan: " + capitan.getNombre()	+ " Jugadores: " + jugadores;
	}
	
	

}
