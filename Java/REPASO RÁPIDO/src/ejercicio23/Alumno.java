/* EJERCICIO 23
• Crea una clase Profesor vacía que herede de Persona. 
• Crea un programa que solicite por pantalla todos los datos de un profesor nuevo. 
• El programa tendrá que crear un objeto Profesor y meter todos esos datos que el usuario le proporciona. */

package ejercicio23;

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

}
