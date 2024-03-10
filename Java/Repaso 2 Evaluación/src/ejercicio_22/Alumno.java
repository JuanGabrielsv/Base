package ejercicio_22;

public class Alumno extends Persona {

	private String dni;
	private Double nota;

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

	public void aprobar() {
		this.nota = 5.0;
	}
}
