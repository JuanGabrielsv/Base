/*
EJERCICIO 3

Amplía el programa anterior para que, después de la última parte, solicite al 
usuario los datos de una persona y lo inserte en BBDD.
 
Tendrás que crear en PersonasService un método llamado insertarPersona() que 
reciba una Persona y la inserte. Trata los errores con la BBDD del mismo modo.

Antes de intentar insertar, debes asegurar que todos los datos están completos.
Para ello, crea un método “validar()” en la clase Persona que lance una 
excepción si no es así. 
Por ejemplo, DatosIncompletosException. Si salta la excepción, contrólala y 
vuelve a pedir los datos al usuario.
*/
package Ejercicios_basicos_03.modelo;

import java.time.LocalDate;
import java.util.Objects;

import Ejercicios_basicos_03.servicios.DatosIncompletosException;

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

	/*
	 * Antes de intentar insertar, debes asegurar que todos los datos están
	 * completos. Para ello, crea un método “validar()” en la clase Persona que
	 * lance una excepción si no es así.
	 */

	public Boolean validar() throws DatosIncompletosException {
		if (this.dni.isEmpty() || this.apellidos.isEmpty() || this.nombre.isEmpty() || this.fechaNacimiento == null) {
			throw new DatosIncompletosException();
		}
		return true;
	}

	@Override
	public String toString() {
		return "Persona [NOMBRE = " + nombre + ", APELLIDOS = " + apellidos + ", DNI = " + dni + ", FECHA = "
				+ fechaNacimiento + "]";
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
