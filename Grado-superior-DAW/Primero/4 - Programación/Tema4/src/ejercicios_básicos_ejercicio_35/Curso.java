/*
EJERCICIO 35
Vuele a hacer el ejercicio 25 utilizando List en lugar de arrays. 
*/
package ejercicios_básicos_ejercicio_35;

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
