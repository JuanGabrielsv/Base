/*
EJERCICIO 25
Crea método equals() en la clase Alumno para definir que un alumno será igual a otro si tienen
el mismo DNI.
Desde tu programa, crea un array de 3 Alumnos. Todos los alumnos pertenecen al curso con
identificador = 1 y descripción “DAM-DAW”. El resto de datos de cada alumno, debes
solicitarlos al usuario.
Cuando tengas el array completo, comprueba si hay alumnos repetidos dentro del array (ten
en cuenta que dos alumnos estarán repetidos en función de lo que se haya implementado en
el método equals). Si hay alumnos repetidos, muestra un mensaje de error al usuario.
*/
package ejercicios_básicos_ejercicio26;

import java.util.Objects;

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