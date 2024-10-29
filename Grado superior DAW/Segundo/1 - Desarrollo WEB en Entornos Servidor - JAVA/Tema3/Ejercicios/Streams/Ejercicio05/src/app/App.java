/*
 5. Dado un array de 5 palabras, devolver aquellas palabras que tengan más de 5 caracteres. 
 */
package app;

import java.util.Arrays;

public class App {

	public static void main(String[] args) {

		String[] aNombre = { "Laura", "Amanda", "María", "Adelaida", "Ramona", "Abigail" };
		Arrays.stream(aNombre).filter(nombre -> nombre.length() > 5).forEach(System.out::println);

	}

}
