/* EJERCICIO 9 (avanzado)
Partiendo del ejercicio 3, ordena el array que ya tenemos para que los números aparezcan de
menor a mayor. Luego vuelve a imprimir el contenido del array. 

EJERCICIO 3
Realizar un programa que solicite números al usuario, los almacene y luego los muestre en el
mismo orden en el que fueron indicados. Para ello, en primer lugar, preguntaremos al usuario
cuántos números nos va a decir. Y luego se los iremos solicitando uno a uno. Los iremos
guardando en un array. Al terminar, le mostraremos la lista completa de números. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_9 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		Integer[] arrayNumeros;
		

		System.out.println("¿Qué cantidad de números vas a introducir? ");
		arrayNumeros = new Integer[sc.nextInt()];

		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.print((i + 1) + " / " + arrayNumeros.length + ": Introduce el número: ");
			entradaUsuario = sc.nextInt();
			arrayNumeros[i] = entradaUsuario;
		}

		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.print(arrayNumeros[i] + " ");
		}

		for (int i = 0; i < arrayNumeros.length; i++) {
			Integer menor = arrayNumeros[i];
			for (int j = i; j < arrayNumeros.length; j++) {
				if (arrayNumeros[j] < menor) {
					// Intercambio la posicin i con la j (pongo el menor donde tiene que estar)
					arrayNumeros[i] = arrayNumeros[j];
					arrayNumeros[j] = menor;
					menor = arrayNumeros[i];
				}
			}
			arrayNumeros[i] = menor;
		}
		System.out.println();
		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.print(arrayNumeros[i] + " ");
		}

		sc.close();

	}

}
