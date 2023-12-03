/*
EJERCICIO 2
Realizar un programa que solicite un número al usuario. Después, guardar en un array el
cuadrado de ese número y de los 5 siguientes.
Al terminar, mostrar el contenido del array por consola.
 */
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_2 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		Integer[] arrayCuadrados;
		Integer calculoCuadrado = 0;

		System.out.println("Introduce un número entero: ");
		entradaUsuario = sc.nextInt();

		for (int i = 0; i < 5; i++) {
			calculoCuadrado = (entradaUsuario + i) * (entradaUsuario + i);
			System.out.println(calculoCuadrado);
			arrayCuadrados[i] = new Integer[] {calculoCuadrado};
			
			
		}
		

	}

}
