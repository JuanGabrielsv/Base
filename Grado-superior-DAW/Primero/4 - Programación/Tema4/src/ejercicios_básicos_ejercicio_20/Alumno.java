/* 
EJERCICIO 20
Cambia el constructor de la clase para que reciba un parámetro String que sea el dni del
alumno. Es decir, cuando queramos crear un objeto Alumno, habrá que indicar
obligatoriamente su DNI. Modifica el programa que has creado para probar para que funcione
con este nuevo constructor.  
*/
package ejercicios_básicos_ejercicio_20;

public class Alumno {

	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;
	
	public Alumno(String dni) {
		this.dni = dni;
	}
	
	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public Double getNota() {
		return nota;
	}

	public void setNota(Double nota) {
		this.nota = nota;
	}

}