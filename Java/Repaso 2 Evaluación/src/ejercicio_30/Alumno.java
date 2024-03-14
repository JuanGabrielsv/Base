/*
EJERCICIO 30

• Añade a la clase Curso un atributo llamado “alumnos” que sea un array de Alumno. 
• Debe ser privado. 
• En el constructor de la clase Curso, haz que se reciba el número de alumnos totales
  que va a tener, de ese modo podrás inicializar el array de alumnos en el Constructor.
• Añade un método get() para el nuevo atributo, pero no un set().
• Añade además otro método que sea addAlumno() que recibe por parámetro un alumno. 
• El método debe añadir el alumno al array en la siguiente posición libre.
• Modifica el programa del ejercicio 25 para añadir todos los alumnos del array a la clase Curso. 
*/
package ejercicio_30;

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
	
	public Boolean validar() {
		
		if (validarDNI() && this.getCurso() != null && this.getNombre() != null && this.getNombre().length() > 10 
				&& this.getEdad() != null && this.getEdad() >= 12 && this.getEdad() < 65) {
			
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
