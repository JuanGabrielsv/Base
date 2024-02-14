/* EJERCICIO 22

• Crea una clase Curso que tenga los atributos privados identificador y descripción. 
• Añade los métodos get y set. 
• Haz que la clase Alumno tenga un atributo de tipo Curso. 
• Recuerda crear su get/set

Adapta el programa que has creado para probar para que también solicite el curso. */

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
