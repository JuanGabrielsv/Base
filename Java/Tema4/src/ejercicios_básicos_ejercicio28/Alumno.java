/* EJERCICIO 28
Buscando en internet, nos encontramos este trozo de código que asegura validar un DNI que
no sea null:

String ejemploDni = "00000000T";
Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
Matcher match = patron.matcher(ejemploDni);
if(match.matches()) {
 System.out.println("El dni es correcto");
}
else {
 System.out.println("El dni es incorrecto");
}

Cambia tu método validarDNI() para que realice la segunda parte de la validación (b) utilizando
el código que hemos encontrado. Tendrás que adaptarlo, ya que nosotros no queremos
imprimir nada. El método tiene que seguir devolviendo un Boolean.  
*/
package ejercicios_básicos_ejercicio28;

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
	
}