/* EJERCICIO 27
Crea un método validarDNI() en la clase Alumno que devuelva un Boolean indicando si el dni 
que tiene establecido el alumno es correcto o no. Para ello, tendrás que validar lo siguiente:

a) El dni no puede ser null ni vacío
b) El dni tiene que tener una longitud total de 9.

Modifica el programa del ejercicio 25 para validar el DNI de los alumnos que vas creando. Si alguno no es correcto, vuelve a solicitarlo. 
*/
package ejercicio_28;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;

	// CONSTRUCTORES

	public Alumno() {
	}

	public Alumno(String dni) {
		super();

		if (dni != null) {
			this.dni = dni.toUpperCase();
		}

		this.dni = dni;
	}

	// MÉTODOS GET AND SET

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		if (dni != null) {
			this.dni = dni.toUpperCase();
		}
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
	
	public Boolean validarDNI() {
		
		Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
		Matcher match = patron.matcher(this.dni);
		
		if (this.dni == null) {
			return false;
		}		
		
		if(match.matches()) {
		 return true;
		}
		
		return false;
		
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
