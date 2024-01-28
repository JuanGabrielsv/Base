/*EJERCICIO 12
Realizar un programa que imprima un tablero de ajedrez de N x N casillas. Para ello, le
pediremos al usuario un número mayor que cero. Y luego imprimiremos por consola el tablero
como se muestra en los siguientes ejemplos:
Tablero de 4x4:
 ___________
|__|__|__|__|
|__|__|__|__|
|__|__|__|__|
|__|__|__|__|
Tablero de 7x7:
 ____________________
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
|__|__|__|__|__|__|__|
Tablero de 1x1:
 __
|__|
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso12 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;

		System.out.println("Introduce un número entero mayor que 0:");
		entradaUsuario = sc.nextInt();

		for (int i = 0; i < entradaUsuario; i++) {
			if (i == 0) {
				System.out.print(" __");
			} else {
				System.out.print("___");
			}
		}

		System.out.println();

		for (int fila = 0; fila < entradaUsuario; fila++) {
			for (int columna = 0; columna < entradaUsuario; columna++) {
				System.out.print("|__");
			}
			System.out.println("|");
		}

		sc.close();

	}

}
