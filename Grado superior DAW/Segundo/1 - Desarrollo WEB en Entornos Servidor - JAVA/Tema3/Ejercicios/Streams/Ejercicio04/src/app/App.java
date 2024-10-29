/*
 4. Dado un array de 5 palabras, devuelve una lista con la longitud de cada palabra. Imprime la
    lista.
 */
package app;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class App {

	public static void main(String[] args) {

		String[] aNombre = { "Laura", "Amanda", "María", "Adelaida", "Ramona", "Abigail" };
		List<Integer> lTamanoNombre = Arrays.stream(aNombre).map(nombre -> nombre.length())
				.collect(Collectors.toList());

		lTamanoNombre.forEach(System.out::println);
	}

}
