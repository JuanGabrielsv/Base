/* EJERCICIO 8
Partiendo del ejercicio 3, cambia el orden de todos los datos para darle la vuelta al array. Es
decir, lo que estaba al principio del array tendrá que estar al final, y viceversa. Al terminar,
muestra el contenido del array por consola.
NOTA: El ejercicio es igual al anterior (el ejercicio 7), pero ahora no queremos crear un nuevo
array inverso, queremos invertir el que ya tenemos. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_8 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String[] array1 = new String[3];
		String palabra1 = "";
		String palabra2 = "";

		for (int i = 0; i < array1.length; i++) {
			System.out.println((i + 1) + " / " + array1.length + " Introduce una palabra: ");
			array1[i] = sc.nextLine();
		}

		for (int i = array1.length - 1, j = 0; i >= 0; i--, j++) {
			if (i == array1.length - 1) {
				palabra1 = array1[i];
				palabra2 = array1[j];
			} else if (j == array1.length - 1) {
				array1[j] = palabra2;
				array1[i] = palabra1;
			}

		}

		for (String string : array1) {
			System.out.println(string);
		}

		sc.close();

	}

}
