/* EJERCICIO 4
Haz un programa que pregunte al usuario qué nota está buscando. Luego, tiene que buscar en
la lista de notas todas las que sean mayores a la indicada y contarlas. Por ejemplo:
¿Qué nota buscas?
5
Hay 7 notas mayores a la indicada */
package t3_ejercicios_repaso;


import java.util.Scanner;

public class T3_ejercicios_repaso_4 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		Integer entradaUsuario;
		Integer contador = 0;
		
		System.out.println("¿Qué nota buscas?: ");
		entradaUsuario = sc.nextInt();
		
		for (int i = 0; i < listaNotas.length; i++) {
			if (listaNotas[i] > entradaUsuario) {
				contador++;
			}
		}
		System.out.println("hay " + contador + " notas mayores a la indicada");
		sc.close();
		
	}

}
