/* EJERCICIO 24
Crea métodos toString() para las clases que has creado. Úsalos en tus programas para imprimir
al final el objeto que has creado (tanto el profesor como el alumno) */

package ejercicio24;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;

/////////////////////////// GET AND SET ////////////////////////////////
	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public Double getNota() {
		return nota;
	}

	public void setNota(Double nota) {
		this.nota = nota;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
/////////////////////////// FIN GET AND SET ////////////////////////////////	

	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + ", getNombre()=" + getNombre()
				+ ", getEdad()=" + getEdad() + "]";
	}

	
	
	

}
