/*
EJERCICIO 24
Crea métodos toString() para las clases que has creado. Úsalos en tus programas para imprimir
al final el objeto que has creado (tanto el profesor como el alumno)
*/
package ejercicios_básicos_ejercicio_24;

public class Profesor extends Persona {

	@Override
	public String toString() {
		return "Profesor [getNombre()=" + getNombre() + ", getEdad()=" + getEdad() + "]";
	}	

}
