/* EJERCICIO 23
• Crea una clase Profesor vacía que herede de Persona. 
• Crea un programa que solicite por pantalla todos los datos de un profesor nuevo. 
• El programa tendrá que crear un objeto Profesor y meter todos esos datos que el usuario le proporciona. */

package ejercicio23;

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

}
