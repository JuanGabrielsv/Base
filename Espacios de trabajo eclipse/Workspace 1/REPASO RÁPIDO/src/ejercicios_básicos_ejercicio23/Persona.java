/*
EJERCICIO 23
Crea una clase Profesor vacía que herede de Persona. Crea un programa que solicite por
pantalla todos los datos de un profesor nuevo. El programa tendrá que crear un objeto
Profesor y meter todos esos datos que el usuario le proporciona.
*/
package ejercicios_básicos_ejercicio23;

public class Persona {

	private String nombre;
	private Integer edad;

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getEdad() {
		return edad;
	}
	public void setEdad(Integer edad) {
		this.edad = edad;
	}
	
}
