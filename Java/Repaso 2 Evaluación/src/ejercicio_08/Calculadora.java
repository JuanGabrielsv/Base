package ejercicio_08;

public class Calculadora {

	public static final String SUMAR = "ADD";
	public static final String RESTAR = "SUB";
	public static final String MULTIPLICAR = "MUL";
	public static final String DIVIDIR = "DIV";

	public static Integer calcular(String cadena, Integer num1, Integer num2) {

		switch (cadena) {

		case SUMAR:
			return ejercicio_07.Calculadora.sumar(num1, num2);

		case RESTAR:
			return ejercicio_07.Calculadora.restar(num1, num2);

		case MULTIPLICAR:
			return ejercicio_07.Calculadora.multiplicar(num1, num2);

		case DIVIDIR:
			return ejercicio_07.Calculadora.dividir(num1, num2);

		default:
			return null;
		}

	}
}
