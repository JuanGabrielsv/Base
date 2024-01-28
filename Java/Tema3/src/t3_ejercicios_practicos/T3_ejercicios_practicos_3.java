/* EJERCICIO 3
Realizar un programa que solicite números al usuario, los almacene y luego los muestre en el
mismo orden en el que fueron indicados. Para ello, en primer lugar, preguntaremos al usuario
cuántos números nos va a decir. Y luego se los iremos solicitando uno a uno. Los iremos
guardando en un array. Al terminar, le mostraremos la lista completa de números. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_3 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		Integer[] arrayNumeros;

		System.out.println("¿Qué cantidad de números vas a introducir? ");
		arrayNumeros = new Integer[sc.nextInt()];

		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.println((i + 1) + " / " + arrayNumeros.length + ": Introduce el número: ");
			entradaUsuario = sc.nextInt();
			arrayNumeros[i] = entradaUsuario;
		}

		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.print(arrayNumeros[i] + " ");
		}
		sc.close();

	}

}
