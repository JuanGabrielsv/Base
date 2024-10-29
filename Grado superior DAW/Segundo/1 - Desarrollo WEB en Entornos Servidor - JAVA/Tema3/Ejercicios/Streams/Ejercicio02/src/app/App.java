/*
 2. Dada una lista de 5 nombres, filtrar e imprimir aquellos que comienzan por ‘A’, convertirlos
      a mayúsculas y luego ordenarlo alfabéticamente.
 */
package app;

import java.util.Arrays;
import java.util.List;

public class App {

	public static void main(String[] args) {

		List<String> lNombres = Arrays.asList("Laura", "Amanda", "María", "Adelaida", "Ramona", "Abigail");
		lNombres.stream().filter(nombre -> nombre.startsWith("A")).map(String::toUpperCase).sorted().forEach(System.out::println);

	}

}
