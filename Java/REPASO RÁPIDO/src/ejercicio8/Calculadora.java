/* EJERCICIO 8
Crea un nuevo método en la clase “Calculadora” que sea calcular. Recibirá tres parámetros:

• Una cadena que será “ADD”, “SUB”, “MUL” o “DIV”
• Dos números enteros

En función de la cadena recibida, se tendrá que sumar, restar, multiplicar o dividir los números
recibidos. Reutiliza los métodos ya creados en los ejercicios anteriores.
Declara las cadenas “ADD”, “SUB”, “MUL” o “DIV” como constantes.
Prueba el método nuevo con varias pruebas desde el main (usa las constantes). */
package ejercicio8;

public class Calculadora {

	public static final String SUMAR = "ADD";
	public static final String RESTAR = "SUB";
	public static final String MULTIPLICAR = "MUL";
	public static final String DIVIDIR = "DIV";

	public static Integer calcular(String cadena, Integer num1, Integer num2) {
		if (cadena == SUMAR) {
			Integer resultado = ejercicio6.Calculadora.sumar(num1, num2);
			return resultado;
		} else if (cadena == RESTAR) {
			Integer resultado = ejercicio7.Calculadora.restar(num1, num2);
			return resultado;
		} else if (cadena == MULTIPLICAR) {
			Integer resultado = ejercicio7.Calculadora.multiplicar(num1, num2);
			return resultado;
		} else if (cadena == DIVIDIR) {
			Integer resultado = ejercicio7.Calculadora.dividir(num1, num2);
			return resultado;
		} else {
			return null;
		}

	}

}
