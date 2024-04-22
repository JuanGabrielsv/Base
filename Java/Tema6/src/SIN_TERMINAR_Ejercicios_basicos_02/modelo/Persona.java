package SIN_TERMINAR_Ejercicios_basicos_02.modelo;

import java.time.LocalDate;

public class Persona {

	private String nombre;
	private String apellidos;
	private String dni;
	private LocalDate fecha;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	@Override
	public String toString() {
		return "Persona [NOMBRE = " + nombre + ", APELLIDOS = " + apellidos + ", DNI = " + dni + ", FECHA = " + fecha + "]";
	}
	
	

}
