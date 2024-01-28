/* EJERCICIO 3
Haz un programa que pregunte al usuario qué nota está buscando. Luego, tiene que buscar en
la lista de notas si existe alguna igual a la que el usuario ha indicado. Tendremos que imprimir si
se ha encontrado y en qué posición. Dos ejemplos de resultado:
¿Qué nota buscas?
3
La nota buscada existe y está en la posición 6
¿Qué nota buscas?
2
La nota buscada no existe 
*/
package t3_ejercicios_repaso;


import java.util.Scanner;

public class T3_ejercicios_repaso_3 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		Integer entradaUsuario;
		Integer posicion;
		boolean check = true;
		
		System.out.println("¿Qué nota buscas?: ");
		entradaUsuario = sc.nextInt();
		
		for (int i = 0; i < listaNotas.length; i++) {
			if (listaNotas[i] == entradaUsuario) {
				posicion = i;
				System.out.println("La nota que buscas existe y está en la posición: " + posicion);
				check = false;
			}
		}
		if (check) {
			System.out.println("la nota no existe");
		}
		sc.close();
	}

}
