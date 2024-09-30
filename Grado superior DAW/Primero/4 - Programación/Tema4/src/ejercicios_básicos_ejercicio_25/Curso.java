/*
EJERCICIO 25
Crea método equals() en la clase Alumno para definir que un alumno será igual a otro si tienen
el mismo DNI.
Desde tu programa, crea un array de 3 Alumnos. Todos los alumnos pertenecen al curso con
identificador = 1 y descripción “DAM-DAW”. El resto de datos de cada alumno, debes
solicitarlos al usuario.
Cuando tengas el array completo, comprueba si hay alumnos repetidos dentro del array (ten
en cuenta que dos alumnos estarán repetidos en función de lo que se haya implementado en
el método equals). Si hay alumnos repetidos, muestra un mensaje de error al usuario.
*/
package ejercicios_básicos_ejercicio_25;

public class Curso {

	private Integer identificador;
	private String descripcion;
	
	public Curso(Integer identificador, String descripcion) {
		this.identificador = identificador;
		this.descripcion = descripcion;		
	}

	public Integer getIdentificador() {
		return identificador;
	}
	public void setIdentificador(Integer identificador) {
		this.identificador = identificador;
	}

	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String toString() {
		return "Curso [identificador=" + identificador + ", descripcion=" + descripcion + "]";
	}
	
}
