/* EJERCICIO 19
Añade a la clase del ejercicio anterior un método público aprobar() que establecerá la nota en
un 5. Úsalo desde el programa que has creado para aprobar. */

package ejercicio19;

public class Alumno {

	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;

	public void aprobar() {
		this.nota = 5.0;
	}

/////////////////////////// GET AND SET ////////////////////////////////
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
/////////////////////////// FIN GET AND SET ////////////////////////////////

}
