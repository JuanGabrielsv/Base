/*
EJERCICIO 26
Modifica el método setDni() y el constructor de la clase Alumno() para que cada vez que se
establezca un DNI al alumno este se registre siempre en mayúsculas. 
*/
package ejercicios_básicos_ejercicio_26;

import java.util.Objects;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni.toUpperCase();
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
	
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + ", getNombre()=" + getNombre()
				+ ", getEdad()=" + getEdad() + "]";
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alumno other = (Alumno) obj;
		return Objects.equals(dni, other.dni);
	}
	
}