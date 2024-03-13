package ejercicio_08;

public class Ejercicio8 {

	public static void main(String[] args) {

		System.out.println(ejercicio_07.Calculadora.sumar(4, 5));
		System.out.println(ejercicio_07.Calculadora.restar(5, 3));
		System.out.println(ejercicio_07.Calculadora.multiplicar(2, 5));
		System.out.println(ejercicio_07.Calculadora.dividir(10, 2));
		
		Integer calculo1 = Calculadora.calcular(Calculadora.DIVIDIR, 10, 2);
		Integer calculo2 = Calculadora.calcular(Calculadora.MULTIPLICAR, 10, 2);
		Integer calculo3 = Calculadora.calcular(Calculadora.RESTAR, 10, 2);
		Integer calculo4 = Calculadora.calcular(Calculadora.SUMAR, 10, 2);
		
		System.out.println(calculo1);
		System.out.println(calculo2);
		System.out.println(calculo3);
		System.out.println(calculo4);		

	}
}
