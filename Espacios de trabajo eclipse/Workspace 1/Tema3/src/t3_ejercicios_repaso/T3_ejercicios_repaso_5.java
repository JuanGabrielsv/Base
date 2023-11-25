/* EJERCICIO 5
Haz un programa que cambie las notas de la lista del siguiente modo: todos los alumnos que
estén suspensos los vamos a aprobar. Es decir, todas las notas que sean menores a 5, pasarán a
ser un 5. Después, imprime la lista. El resultado tendría que ser:
Lista notas: 7 9 8 5 5 6 5 5 5 7 5 5 9 10 */

package t3_ejercicios_repaso;

import java.util.Scanner;

public class T3_ejercicios_repaso_5 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		
		for (int i = 0; i < listaNotas.length; i++) {
			
			if (listaNotas[i] < 5) {
				listaNotas[i] = 5;
			}
		}
		
		System.out.print("Lista de notas: ");
		for (int i = 0; i < listaNotas.length; i++) {
			System.out.print(listaNotas[i] + " ");
		}
		sc.close();
	}

}
