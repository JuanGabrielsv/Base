/*
• Jugador.
	o Atributos privados con métodos get y set:
		- Nombre -> String
		- Dorsal -> Integer
	o Constructor que reciba los dos atributos por parámetro
	o Método equals() que compare los dorsales
	o Método toString() para que imprima algo tal que: “9 – Blas”
*/
package ejercicios_básicos_ejercicio_41;

import java.util.Objects;

public class Jugador {

	// Atributos privados con métodos get y set:
	// - Nombre -> String
	// - Dorsal -> Integer

	private String nombre;
	private Integer dorsal;

	// Constructor que reciba los dos atributos por parámetro.

	public Jugador(String nombre, Integer dorsal) {
		this.nombre = nombre;
		this.dorsal = dorsal;
	}
	
	// GETTERS AND SETTERS

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getDorsal() {
		return dorsal;
	}

	public void setDorsal(Integer dorsal) {
		this.dorsal = dorsal;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dorsal);
	}	
	
	// Método equals() que compare los dorsales.
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Jugador other = (Jugador) obj;
		return Objects.equals(dorsal, other.dorsal);
	}
	
	// Método toString() para que imprima algo tal que: “9 – Blas”.
	
	@Override
	public String toString() {
		return dorsal + " - " + nombre;
	}
	

}
