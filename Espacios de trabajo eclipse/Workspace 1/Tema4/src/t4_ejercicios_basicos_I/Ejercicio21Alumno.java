/* EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas? */

package t4_ejercicios_basicos_I;

public class Ejercicio21Alumno {
	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;

	public Ejercicio21Alumno() {
		this.dni = "";
		this.nombre = "";
		this.edad = 0;
		this.nota = 0.0;
	}

	public Ejercicio21Alumno(String dni, String nombre, Integer edad, Double nota) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.edad = edad;
		this.nota = nota;
	}

	public void aprobar() {
		nota = 5.0; // this.nota = 5.0;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dniNuevo) {
		this.dni = dniNuevo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombreNuevo) {
		this.nombre = nombreNuevo;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edadNuevo) {
		this.edad = edadNuevo;
	}

	public Double getNota() {
		return nota;
	}

	public void setNota(Double notaNuevo) {
		this.nota = notaNuevo;
	}

}
