/*
EJERCICIO 1
Crea un programa que solicite números enteros al usuario y los meta en una lista. Cuando
indique el número -1, parará de meter números. Al final, imprime la lista.
Una vez que tengas el programa, ¿cómo podrías asegurarte de que el scanner se cierre
siempre, aunque haya algún error que pare la ejecución? 
*/
package ejercicios_básicos_01;

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
				System.out.println("INTRODUCE UN NÚMERO ENTERO: ");
				entradaUsuario = Integer.parseInt(sc.nextLine());

				if (entradaUsuario == -1) {
					check = false;
				} else {
					listaNumeros.add(entradaUsuario);
				}

			} while (check);

			System.out.println(listaNumeros);

		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}

	}

}
