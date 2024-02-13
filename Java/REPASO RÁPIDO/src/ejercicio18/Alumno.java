/* EJERCICIO 18
Crea una clase llamada Alumno que tenga como atributos privados el dni, nombre, edad y
nota. Además, tendrá métodos get y set para todos los atributos. Luego crea un programa que
lea por consola los datos de un alumno y los registre en un objeto de la clase que acabas de
crear. */

package ejercicio18;

public class Alumno {

	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

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

	public Double getNota() {
		return nota;
	}

	public void setNota(Double nota) {
		this.nota = nota;
	}

}
