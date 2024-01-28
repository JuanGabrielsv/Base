/* EJERCICIO 29
Crea un método validar() en la clase Alumno que devuelva un Boolean indicando si todos los
datos del alumno son válidos o no. Para que los datos de un alumno sean correctos se deben
dar estas circunstancias:

- El DNI debe ser válido de acuerdo con el método validarDni() que ya tenemos.
- El curso no puede ser null
- El nombre no puede ser null y tiene que tener una longitud mínima de 10 caracteres.
- La edad no puede ser null y tendrá que estar comprendida entre 12 y 65 (ambas inclusive).

Modifica el programa del ejercicio 25 para que al final del todo recorra el array de alumnos y
compruebe uno a uno si son válidos. Si alguno no lo es, avisa al usuario por consola.  
*/
package ejercicios_básicos_ejercicio29;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Alumno extends Persona {

	private String dni;
	private Double nota;
	private Curso curso;
	
public Alumno(String dni) {
		super();
		if (dni !=  null) {
			dni = dni.toUpperCase();
		}
		this.dni = dni;
	}
//MÉTODO PARA VALIDAR DNI
	public Boolean validarDNI() {		
		if (dni == null) {
			return false;
		}
		
		Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
		Matcher match = patron.matcher(dni);
		if (match.matches()) {
			return true;
		} 
		return false;

	}
//MÉTODOS GET Y SET
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		if (dni !=  null) {
			dni = dni.toUpperCase();
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
//MÉTODO TO STRING	
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + ", getNombre()=" + getNombre()
				+ ", getEdad()=" + getEdad() + "]";
	}
//MÉTODO EQUALS	
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
	
/* 
- El DNI debe ser válido de acuerdo con el método validarDni() que ya tenemos.
- El curso no puede ser null
- El nombre no puede ser null y tiene que tener una longitud mínima de 10 caracteres.
- La edad no puede ser null y tendrá que estar comprendida entre 12 y 65 (ambas inclusive).	
*/	
	public Boolean validar() {
		if (curso == null) {
			return false;
		}
		if (getNombre() == null || getNombre().length() < 10) {
			return false;
		}
		if (getEdad() == null || getEdad() < 12 || getEdad() > 65) {
			return false;
		}
		if(!validarDNI()) {
			return false;
		}
		return true;
	}
	
}