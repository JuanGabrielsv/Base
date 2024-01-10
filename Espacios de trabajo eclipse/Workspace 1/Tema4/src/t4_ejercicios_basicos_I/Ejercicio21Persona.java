/* EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas? */ 

package t4_ejercicios_basicos_I;

public class Ejercicio21Persona {
	private String nombre;
	private Integer edad;
	
// Métodos get y set de nombre:
	public String getNombre() {
		return nombre; 
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
// Métodos get y set de edad:
	public Integer getEdad() {
		return edad;
	}
	public void setEdad(Integer edad) {
		this.edad = edad;
	}
}
