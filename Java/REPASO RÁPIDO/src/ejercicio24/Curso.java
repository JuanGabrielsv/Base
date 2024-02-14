/* EJERCICIO 24
Crea métodos toString() para las clases que has creado. Úsalos en tus programas para imprimir
al final el objeto que has creado (tanto el profesor como el alumno) */

package ejercicio24;

public class Curso {

	private Long indentificador;
	private String descripcion;

/////////////////////////// GET AND SET ////////////////////////////////
	public Long getIndentificador() {
		return indentificador;
	}

	public void setIndentificador(Long indentificador) {
		this.indentificador = indentificador;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
/////////////////////////// FIN GET AND SET ////////////////////////////////

	@Override
	public String toString() {
		return "Curso [indentificador=" + indentificador + ", descripcion=" + descripcion + "]";
	}
	
	

}
