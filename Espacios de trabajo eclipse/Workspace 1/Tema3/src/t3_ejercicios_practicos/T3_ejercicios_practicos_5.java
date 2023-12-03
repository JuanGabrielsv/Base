/* EJERCICIO 5
Mejorar el programa anterior para que, además de mostrar la lista de números, calcule y
muestre cuál es el máximo y el mínimo (y en qué posición están) y calcule la media de todos
los números. Todo esto se debe hacer recorriendo el array. 

EJERCICIO 3
Realizar un programa que solicite números al usuario, los almacene y luego los muestre en el
mismo orden en el que fueron indicados. Para ello, en primer lugar, preguntaremos al usuario
cuántos números nos va a decir. Y luego se los iremos solicitando uno a uno. Los iremos
guardando en un array. Al terminar, le mostraremos la lista completa de números.
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_5 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer[] arrayNumeros;
		Integer posicionMayor = 0;
		Integer posicionMenor = 0;
		Integer suma = 0;
		Integer media = 0;

		System.out.println("Introduce el tamaño que tendrá la Array: ");
		arrayNumeros = new Integer[sc.nextInt()];

		for (int i = 0; i < arrayNumeros.length; i++) {
			System.out.print((i + 1) + " / " + arrayNumeros.length + " Introduce el número: ");
			arrayNumeros[i] = sc.nextInt();
		}

		Integer mayor = arrayNumeros[0];
		Integer menor = arrayNumeros[0];

		for (int i = 0; i <= arrayNumeros.length - 1; i++) {

			if (arrayNumeros[i] > mayor) {
				mayor = arrayNumeros[i];
				posicionMayor = i;

			} else if (arrayNumeros[i] < menor) {
				menor = arrayNumeros[i];
				posicionMenor = i;
			}

			suma += arrayNumeros[i];

		}

		media = suma / arrayNumeros.length;

		System.out.println("Mayor: " + mayor + " Posicion en Array: " + posicionMayor);
		System.out.println("Menor: " + menor + " Posicion en Array: " + posicionMenor);
		System.out.println("Media: " + media);

		sc.close();

	}

}
