package Ejercicios_basicos_01.modelo;

import java.time.LocalDate;
import java.util.Objects;
/**
 * Clase que define a un objeto Persona
 * @version 1.0
 * @author Juan Gabriel
 * @since 15/05/2024
 */
public class Persona {

	private String nombre;
	private String apellidos;
	private String dni;
	private LocalDate fechaNacimiento;

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

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	@Override
	public String toString() {
		return "Persona [NOMBRE = " + nombre + ", APELLIDOS = " + apellidos +
				", DNI = " + dni + ", FECHA = " + fechaNacimiento + "]";
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
		Persona other = (Persona) obj;
		return Objects.equals(dni, other.dni);
	}
		

}
