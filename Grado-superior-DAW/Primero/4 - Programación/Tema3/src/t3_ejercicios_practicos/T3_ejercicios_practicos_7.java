/* EJERCICIO 7
Partiendo del ejercicio 3, construye otro array que sea el mismo que ya tienes, pero con todos
los datos en orden inverso. Muestra por consola el contenido de este segundo array. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_7 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String[] array1 = new String[3];
		String[] arrayInversa = new String[3];

		for (int i = 0; i < array1.length; i++) {
			System.out.println(i + 1 + " / " + array1.length + " Introduce una palabra: ");
			array1[i] = sc.nextLine();
		}
		for (int i = array1.length - 1, j = 0; i >= 0; i--, j++) {
			arrayInversa[j] = array1[i];
			System.out.print(arrayInversa[j]);
		}

		sc.close();

	}

}
