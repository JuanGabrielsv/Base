/* EJERCICIO 18
Realizar un programa que solicite una palabra al usuario y luego la escriba invertida. Por
ejemplo, si la palabra indicada es “indonesia”, el resultado debería ser “aisenodni”
Cuando te funcione, prueba con un palíndromo ;) */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso18 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String entradaUsuario = "";

		System.out.println("Introduce una palabra: ");
		entradaUsuario = sc.nextLine();

		for (int i = entradaUsuario.length(); i > 0; i--) {
			System.out.print(entradaUsuario.substring(i - 1, i));
		}

		sc.close();

	}

}
