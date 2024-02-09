/* EJERCICIO 7
Crea un nuevo método en la clase “Calculadora” que sea restar, otro multiplicar y otro dividir.
Todos reciben por parámetro dos enteros y deben devolver un entero con el resultado de la
operación. */ 
package ejercicio7;

public class Calculadora {
	
	public static Integer restar(Integer num1, Integer num2) {
		Integer resta = num1 - num2;
		return resta;
	}
	
	public static Integer multiplicar(Integer num1, Integer num2) {
		Integer multiplicar = num1 * num2;
		return multiplicar;
	}
	
	public static Integer dividir(Integer num1, Integer num2) {
		Integer dividir = num1 / num2;
		return dividir;
	}

}
