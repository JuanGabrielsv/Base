/* EJERCICIO 21
Mejorar el ejercicio anterior para que el cuadrado sea de NxN. Es decir, solicitar al usuario un
número (tendrá que ser mayor a 0, si no lo es, volver a solicitarlo) y dibujar el cuadrado con
ese número de filas y columnas. */

/* Realizar un programa que muestre por pantalla un cuadrado de 5x5 con su diagonal. De este
modo:
* - - - -
- * - - -
- - * - -
- - - * -
- - - - *
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso21 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		Boolean check = true;

		do {
			System.out.println("Introduce un número entero: ");
			entradaUsuario = sc.nextInt();

			if (entradaUsuario <= 0) {
				System.err.println("ERROR - El número debe ser entero y mayor que 0");
			} else {
				check = false;
			}

		} while (check);

		for (int i = 0; i < entradaUsuario; i++) {
			for (int j = 0; j < entradaUsuario; j++) {
				if (i == j) {
					System.out.print("* ");
				} else {
					System.out.print("- ");
				}
			}
			System.out.println();
		}

		sc.close();

	}

}
