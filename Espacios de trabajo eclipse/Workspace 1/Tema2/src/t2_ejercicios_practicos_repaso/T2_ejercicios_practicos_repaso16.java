/* EJERCICIO 16
Realizar un programa que solicite al usuario una palabra por consola. A continuación, mostrar
por consola las diferentes letras de esa palabra en cada línea. Por ejemplo, si la palabra
indicada por el usuario es “indonesia” el resultado debería ser:
i
n
d
o
n
e
s
i
a 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso16 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		String entradaUsuario = "";
		Integer contador = 0;

		System.out.println("Introduce tu palabra: ");
		entradaUsuario = sc.nextLine();

		/*
		 * while (contador < entradaUsuario.length()) {
		 * System.out.println(entradaUsuario.substring(contador, contador + 1));
		 * contador++; }
		 */

		for (int i = 0; i < entradaUsuario.length(); i++) {
			System.out.println(entradaUsuario.substring(i, i +1));

		}

	}

}
