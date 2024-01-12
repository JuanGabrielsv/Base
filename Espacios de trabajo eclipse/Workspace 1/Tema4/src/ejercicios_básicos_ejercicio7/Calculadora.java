/*
EJERCICIO 7
Crea un nuevo método en la clase “Calculadora” que sea restar, otro multiplicar y otro dividir.
Todos reciben por parámetro dos enteros y deben devolver un entero con el resultado de la
operación.   
*/
package ejercicios_básicos_ejercicio7;

public class Calculadora {
	
	public static Integer restar(Integer num1, Integer num2) {
		
		Integer resultado = null;
		
		resultado = num1 - num2;
		return resultado;
	}
	
	public static Integer multiplicar(Integer num1, Integer num2) {
		
		Integer resultado = null;
		
		resultado = num1 * num2;
		return resultado;
	}
	
	public static Integer dividir(Integer num1, Integer num2) {
		
		Integer resultado = null;
		//Double division = null;
		//Double dnum1 = null;
		//Double dnum2 = null;
		
		//dnum1 = num1.doubleValue();
		//dnum2 = num2.doubleValue();
		
		//division = dnum1 / dnum2;
		
		//resultado = division.intValue();
		resultado = num1 / num2;
		return resultado;		 
	}
	
	public static Integer sumar(Integer num1, Integer num2) {
		return num1 + num2;
	}
	
	
}
