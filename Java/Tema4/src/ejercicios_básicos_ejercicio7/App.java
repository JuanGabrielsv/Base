/*
EJERCICIO 7
Crea un nuevo método en la clase “Calculadora” que sea restar, otro multiplicar y otro dividir.
Todos reciben por parámetro dos enteros y deben devolver un entero con el resultado de la
operación.   
*/
package ejercicios_básicos_ejercicio7;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer num1 = null;
		Integer num2 = null;
		
		System.out.println("Dame un número: ");
		num1 = sc.nextInt();
		System.out.println("Dame un número: ");
		num2 = sc.nextInt();		
		System.out.println("\nDIVISIÓN: " + Calculadora.dividir(num1, num2));
		System.out.println("SUMA: " + Calculadora.sumar(num1, num2));
		System.out.println("MULTIPLICACIÓN: " + Calculadora.multiplicar(num1, num2));
		System.out.println("RESTA: " + Calculadora.restar(num1, num2));		
		sc.close();		
	}	
}
