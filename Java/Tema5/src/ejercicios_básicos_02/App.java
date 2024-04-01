/*
EJERCICIO 2
En el programa anterior, si te fijas, cuando en lugar de un número el usuario introduce letras,
salta un error y el programa termina. Captura dicha excepción para que el programa no
termine, sino que simplemente muestre un error al usuario indicando que no puede introducir
letras.
PISTA: después de mostrar el mensaje tendrás que hacer un nextLine() para consumir el salto
de línea. 
*/
package ejercicios_básicos_02;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		Boolean check = true;
		List<Integer> listaNumeros = new ArrayList<>();

		try {
			do {
				try {

					System.out.println("INTRODUCE UN NÚMERO ENTERO: ");
					entradaUsuario = Integer.parseInt(sc.nextLine());

					if (entradaUsuario.equals(-1)) {
						check = false;
					} else {
						listaNumeros.add(entradaUsuario);
					}
				} catch (NumberFormatException e) {
					System.out.println("Debes introducir un número entero, no valen letras");
				}

			} while (check);

			System.out.println(listaNumeros);

		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}

	}

}
