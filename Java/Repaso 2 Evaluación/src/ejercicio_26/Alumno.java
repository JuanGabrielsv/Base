package ejercicio_26;

import java.util.Objects;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;

	// CONSTRUCTORES

	public Alumno() {
	}

	public Alumno(String dni) {
		super();
		this.dni = dni;
	}

	// MÉTODOS GET AND SET

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

	// MÉTODOS

	public void aprobar() {
		this.nota = 5.0;
	}

	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + ", getNombre()=" + getNombre()
				+ ", getEdad()=" + getEdad() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(dni);
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
