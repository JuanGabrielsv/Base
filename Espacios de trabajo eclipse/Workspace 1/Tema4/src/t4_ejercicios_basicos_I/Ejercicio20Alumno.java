/* EJERCICIO 20
Cambia el constructor de la clase para que reciba un parámetro String que sea el dni del
alumno. Es decir, cuando queramos crear un objeto Alumno, habrá que indicar
obligatoriamente su DNI. Modifica el programa que has creado para probar para que funcione
con este nuevo constructor. */

package t4_ejercicios_basicos_I;

public class Ejercicio20Alumno {
	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;

	public Ejercicio20Alumno() {
		this.dni = "";
		this.nombre = "";
		this.edad = 0;
		this.nota = 0.0;
	}

	public Ejercicio20Alumno(String dni, String nombre, Integer edad, Double nota) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.edad = edad;
		this.nota = nota;
	}

	public void aprobar() {
		nota = 5.0; // this.nota = 5.0;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dniNuevo) {
		this.dni = dniNuevo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombreNuevo) {
		this.nombre = nombreNuevo;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edadNuevo) {
		this.edad = edadNuevo;
	}

	public Double getNota() {
		return nota;
	}

	public void setNota(Double notaNuevo) {
		this.nota = notaNuevo;
	}

}
