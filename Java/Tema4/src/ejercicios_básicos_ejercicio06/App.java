/*
EJERCICIO 6
Lleva el método realizado en el ejercicio anterior a una nueva clase llamada “Calculadora”.
Prueba su funcionamiento desde el método main con algún test.   
*/
package ejercicios_básicos_ejercicio06;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer num1 = null;
		Integer num2 = null;
		
		System.out.println("Dame un número: ");
		num1 = sc.nextInt();
		System.out.println("Dame otro número: ");
		num2 = sc.nextInt();
		System.out.println(Calculadora.sumar(num1, num2));
		sc.close();
	}	
}
