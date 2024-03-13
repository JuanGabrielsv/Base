/*
EJERCICIO 8
Crea un nuevo método en la clase “Calculadora” que sea calcular. Recibirá tres parámetros:
- Una cadena que será “ADD”, “SUB”, “MUL” o “DIV”
- Dos números enteros
En función de la cadena recibida, se tendrá que sumar, restar, multiplicar o dividir los números
recibidos. Reutiliza los métodos ya creados en los ejercicios anteriores.
Declara las cadenas “ADD”, “SUB”, “MUL” o “DIV” como constantes.
Prueba el método nuevo con varias pruebas desde el main (usa las constantes).    
*/
package ejercicios_básicos_ejercicio_08;

public class Calculadora {
	
	public static final String SUMAR = "ADD";
	public static final String RESTAR = "SUB";
	public static final String MULTIPLICAR = "MUL";
	public static final String DIVIDIR = "DIV";
	
	public static Integer calcular(String operacion, Integer num1, Integer num2) {
		if (operacion == SUMAR) {
			return sumar(num1,num2);
		}
		else if (operacion == RESTAR) {
			return restar(num1,num2);
		}
		else if (operacion == MULTIPLICAR) {
			return multiplicar(num1,num2);
		}
		else if (operacion == DIVIDIR) {
			return dividir(num1,num2);
		}
		else {
			return null;
		}
		
	}
	
	public static Integer sumar(Integer num1, Integer num2) {
		return num1 + num2;
	}
	
	public static Integer restar(Integer num1, Integer num2) {
		return num1 - num2;
	}
	
	public static Integer multiplicar(Integer num1, Integer num2) {		
		return num1 * num2;
	}
	
	public static Integer dividir(Integer num1, Integer num2) {
		return num1 / num2;
	}
	
}
