/* EJERCICIO 6
Haz un programa que cambie las notas de la lista del siguiente modo: todas las notas que están
en las posiciones pares del array (la que está en la posición 0, en la 2, en la 4, etc.) tendrá que
multiplicarse por 2. Después, imprime la lista. El resultado tendría que ser:
Lista notas: 14 9 16 4 0 6 6 4 2 7 6 1 18 10 */ 

package t3_ejercicios_repaso;


import java.util.Scanner;

public class T3_ejercicios_repaso_6 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		
		for (int i = 0; i < listaNotas.length; i++) {
			listaNotas[i] = listaNotas[i] * 2;
			i = i + 1;			
			}
		
		System.out.println();
		for (int i = 0; i < listaNotas.length; i++) {
			System.out.print(listaNotas[i] + " ");
		}
		sc.close();
	}
	
}