/*
 3. Dado un array de 5 palabras, imprimir la primera letra de cada palabra.
 */
package app;

import java.util.Arrays;
import java.util.stream.Stream;

public class App {

	public static void main(String[] args) {

		String[] aNombre = { "Laura", "Amanda", "María", "Adelaida", "Ramona", "Abigail" };
		Stream<String> sNombre = Arrays.stream(aNombre);

		sNombre.map(nombre -> nombre.length()).forEach(System.out::println);

	}

}
