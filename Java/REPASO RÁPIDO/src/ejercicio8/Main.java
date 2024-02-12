/* EJERCICIO 8
Crea un nuevo método en la clase “Calculadora” que sea calcular. Recibirá tres parámetros:

• Una cadena que será “ADD”, “SUB”, “MUL” o “DIV”
• Dos números enteros

En función de la cadena recibida, se tendrá que sumar, restar, multiplicar o dividir los números
recibidos. Reutiliza los métodos ya creados en los ejercicios anteriores.
Declara las cadenas “ADD”, “SUB”, “MUL” o “DIV” como constantes.
Prueba el método nuevo con varias pruebas desde el main (usa las constantes). */
package ejercicio8;

public class Main {

	public static void main(String[] args) {
		
		System.out.println("SUMAR = " + Calculadora.calcular(Calculadora.SUMAR, 2, 5));
		System.out.println("MULTIPLICAR = " + Calculadora.calcular(Calculadora.MULTIPLICAR, 2, 5));
		System.out.println("RESTAR = " + Calculadora.calcular(Calculadora.RESTAR, 10, 8));
		System.out.println("DIVIDIR = " + Calculadora.calcular(Calculadora.DIVIDIR, 10, 2));
		
	}

}
