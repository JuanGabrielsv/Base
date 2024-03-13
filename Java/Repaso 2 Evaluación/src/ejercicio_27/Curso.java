/* EJERCICIO 27
Crea un método validarDNI() en la clase Alumno que devuelva un Boolean indicando si el dni 
que tiene establecido el alumno es correcto o no. Para ello, tendrás que validar lo siguiente:

a) El dni no puede ser null ni vacío
b) El dni tiene que tener una longitud total de 9.

Modifica el programa del ejercicio 25 para validar el DNI de los alumnos que vas creando. Si alguno no es correcto, vuelve a solicitarlo. 
*/
package ejercicio_27;

public class Curso {

	private Long identificador;
	private String descripcion;
	
	// MÉTODOS GET AND SET

	public Long getIdentificador() {
		return identificador;
	}

	public void setIdentificador(Long identificador) {
		this.identificador = identificador;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "Curso [identificador=" + identificador + ", descripcion=" + descripcion + "]";
	}
	
	

}
