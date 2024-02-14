/* EJERCICIO 22

• Crea una clase Curso que tenga los atributos privados identificador y descripción. 
• Añade los métodos get y set. 
• Haz que la clase Alumno tenga un atributo de tipo Curso. 
• Recuerda crear su get/set

Adapta el programa que has creado para probar para que también solicite el curso. */

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
