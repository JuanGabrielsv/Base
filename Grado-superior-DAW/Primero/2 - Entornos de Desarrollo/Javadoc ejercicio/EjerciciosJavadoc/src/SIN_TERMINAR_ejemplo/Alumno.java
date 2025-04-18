package SIN_TERMINAR_ejemplo;


/** Esta clase representa a un alumno.
 * @author TECH
 * @version 1.0
 * @since 05/04/2024	 
 */
public class Alumno extends Persona {
	
	
	private String dni;
	private Double nota;

	public Alumno(String dni) {
		super();
		this.dni = dni;		
	}
	/**
	 * 
	 * @return .
	 * 
	 */
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
	
	
	/**
	 * 
	 */
	public void aprobar() {
		nota = 5.0;
	}	
}
