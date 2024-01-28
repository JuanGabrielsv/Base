/* EJERCICIO 20
Realizar un programa que muestre por pantalla un cuadrado de 5x5 con su diagonal. De este
modo:
* - - - -
- * - - -
- - * - -
- - - * -
- - - - * 
*/
package t2_ejercicios_practicos_repaso;

public class T2_ejercicios_practicos_repaso20 {

	public static void main(String[] args) {

		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 5; j++) {
				if (i == j) {
					System.out.print("* ");
				} else {
					System.out.print("- ");
				}
			}
			
			System.out.println();
			
		}

	}

}
