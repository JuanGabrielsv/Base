/* EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas? */

package ejercicio21;

public class Persona {

	private String nombre;
	private Integer edad;

/////////////////////////// GET AND SET ////////////////////////////////	
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
/////////////////////////// FIN GET AND SET ////////////////////////////////	

}
