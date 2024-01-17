/*
EJERCICIO 22
Crea una clase Curso que tenga los atributos privados identificador y descripción. Añade los
métodos get y set. Haz que la clase Alumno tenga un atributo de tipo Curso. Recuerda crear su
get/set
Adapta el programa que has creado para probar para que también solicite el curso.
*/
package ejercicios_básicos_ejercicio22;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;
	

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
	
	public Curso getIdentificador() {
		return curso;
	}
	public void setIdentificador(Curso curso) {
		this.curso = curso;
	}	
	
	/*public Curso getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(Curso descripcion) {
		this.descripcion = descripcion;
	}*/

}