/*
EJERCICIO 27
Crea un método validarDNI() en la clase Alumno que devuelva un Boolean indicando si el dni
que tiene establecido el alumno es correcto o no. Para ello, tendrás que validar lo siguiente:
a) El dni no puede ser null ni vacío
b) El dni tiene que tener una longitud total de 9.
Modifica el programa del ejercicio 25 para validar el DNI de los alumnos que vas creando. Si
alguno no es correcto, vuelve a solicitarlo. 
*/
package ejercicios_básicos_ejercicio_27;

public class Persona {

	private String nombre;
	private Integer edad;

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
		
}
