/*
EJERCICIO 4
En el programa anterior, cuando te han indicado una posición que no existe en la lista, salta
una excepción y el programa termina. Captura dicha excepción para que en tal caso el número
devuelto sea null. 
*/
package ejercicios_básicos_04;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		Boolean check = true;
		SacoNumeros listaNumeros = new SacoNumeros();

		try {
			do {
				try {
					System.out.println("INTRODUCE UN NÚMERO ENTERO: ");
					entradaUsuario = Integer.parseInt(sc.nextLine());
					if (entradaUsuario.equals(-1)) {
						check = false;
					} else {
						listaNumeros.addNumero(entradaUsuario);
					}
				} catch (NumberFormatException e) {
					System.out.println("Debes introducir un número entero, no valen letras, ni espacios en blanco.");
				}
			} while (check);

			System.out.println(listaNumeros);
			check = true;

			do {
				try {
					Integer entradaUsuario2;
					System.out.println("INTRODUCE UN NÚMERO ENTERO QUE INDICA LA POSICIÓN EN LA LISTA: ");
					entradaUsuario2 = Integer.parseInt(sc.nextLine());
					if (entradaUsuario2 == -1) {
						System.out.println("- SALIENDO DEL PROGRAMA -");
						check = false;
					} else {
						System.out.println(listaNumeros.getNumero(entradaUsuario2));
					}
				} catch (NumberFormatException y) {
					System.err.println("NO SE ADMITE INTRODUCIR UN ESPACIO EN BLANCO o NO INTRODUCIR NADA");
				} 
			} while (check);
		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}

	}

}
