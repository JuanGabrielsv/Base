/* EJERCICIO 6
Realizar un programa que solicite 3 palabras al usuario y las guarde cada una en un array.
Después, recorrer el array y concatenar todas las palabras para mostrarlas por consola. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_6 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String entradaUsuario = "";
		String[] array1 = new String[1];
		String[] array2 = new String[1];
		String[] array3 = new String[1];

		System.out.println("Tines que introducir 3 palabras: ");
		System.out.println("Primera palabra: ");
		array1[0] = sc.nextLine();

		System.out.println("Segunda palabra: ");
		array2[0] = sc.nextLine();

		System.out.println("Tercera palabra: ");
		array3[0] = sc.nextLine();

		for (int i = 0; i < array3.length; i++) {
			System.out.println(array1[i] + array2[i] + array3[i]);

		}

	}

}
