/* EJERCICIO 29
Crea un método validar() en la clase Alumno que devuelva un Boolean indicando si todos los
datos del alumno son válidos o no. Para que los datos de un alumno sean correctos se deben
dar estas circunstancias:

- El DNI debe ser válido de acuerdo con el método validarDni() que ya tenemos.
- El curso no puede ser null
- El nombre no puede ser null y tiene que tener una longitud mínima de 10 caracteres.
- La edad no puede ser null y tendrá que estar comprendida entre 12 y 65 (ambas inclusive).

Modifica el programa del ejercicio 25 para que al final del todo recorra el array de alumnos y
compruebe uno a uno si son válidos. Si alguno no lo es, avisa al usuario por consola. 
*/
package ejercicios_básicos_ejercicio_29;

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
