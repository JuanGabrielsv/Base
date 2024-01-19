/*
EJERCICIO 22
Crea una clase Curso que tenga los atributos privados identificador y descripción. Añade los
métodos get y set. Haz que la clase Alumno tenga un atributo de tipo Curso. Recuerda crear su
get/set
Adapta el programa que has creado para probar para que también solicite el curso.
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
