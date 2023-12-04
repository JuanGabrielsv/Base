/* EJERCICIO 10
Crea un array de un tamaño que sea indicado por el usuario (lo solicitaremos primero). El
tamaño tendrá que ser mayor a 2.
A continuación, llena el array con la serie de Fibonacci. Las dos primeras posiciones del array
las puedes llenar a mano con un 0 y un 1 respectivamente. El resto de posiciones hasta
completar el tamaño del array, las debes llenar con un bucle que vaya calculando el valor de la
posición i a partir del valor de las posiciones anteriores.
Al terminar, imprime el contenido del array para mostrarlo al usuario. 
*/
package t3_ejercicios_practicos;

import java.util.Scanner;

public class T3_ejercicios_practicos_10 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		// Pedir el tamao de manera continua hasta que no sea menor a 2
		Integer tam = null;
		do {
			System.out.println("Dame el tamao de la serie");
			tam = scanner.nextInt();
		} while (tam < 2);

		// Declaramos array e inicializamos las 2 primeras casillas
		Integer[] fibonacci = new Integer[tam];
		fibonacci[0] = 0;
		fibonacci[1] = 1;

		// Recorrer el array y llenar el resto de posiciones5.

		for (int i = 2; i < fibonacci.length; i++) {
			fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
		}

		// Imprimo el contenido del array
		for (int i = 0; i < fibonacci.length; i++) {
			System.out.print(fibonacci[i] + " ");
		}

		// Cierro scanner
		scanner.close();

	}

}
