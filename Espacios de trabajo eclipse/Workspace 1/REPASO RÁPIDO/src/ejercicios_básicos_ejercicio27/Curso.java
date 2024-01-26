/*
EJERCICIO 26
Modifica el método setDni() y el constructor de la clase Alumno() para que cada vez que se
establezca un DNI al alumno este se registre siempre en mayúsculas. 
*/
package ejercicios_básicos_ejercicio27;

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
