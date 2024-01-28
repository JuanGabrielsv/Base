/*
EJERCICIO 34
Crea un programa que solicite al usuario 5 cadenas y las meta en una lista (Hazlo con un bucle).
Luego imprime la lista usando el método toString(). A continuación, haz lo siguiente:
1. Pon todas las cadenas de la lista en mayúsculas. Imprime la lista de nuevo.
2. Comprueba si la lista contiene alguna cadena vacía. En tal caso, escribe un mensaje por
consola indicándolo. (No lo hagas con un bucle)
3. Borra todas las cadenas de la lista que tengan una longitud menor a 6 caracteres. 
*/
package ejercicios_básicos_ejercicio34;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		List<String> listaCadenas = new ArrayList<>();

		for (int i = 0; i < 5; i++) {
			System.out.println("Introduce la cadena para la posición " + i + " de la lista");
			listaCadenas.add(sc.nextLine());
		}

		sc.close();

//FORMAS DE IMPRIMIR UNA LISTA

		for (int i = 0; i < listaCadenas.size(); i++) {
			System.out.println(listaCadenas.get(i));
		}

		System.out.println(listaCadenas);

		System.out.println(listaCadenas.toString());

//1. Pon todas las cadenas de la lista en mayúsculas. Imprime la lista de nuevo.

		for (int i = 0; i < listaCadenas.size(); i++) {
			listaCadenas.set(i, listaCadenas.get(i).toUpperCase());
		}

//IMPRIMIR LA LISTA CON LOS ELEMENTOS EN MAYÚSCULA

		System.out.println(listaCadenas);

//2. Comprueba si la lista contiene alguna cadena vacía. En tal caso, escribe un mensaje por consola indicándolo. (No lo hagas con un bucle)

		if (listaCadenas.contains("")) {
			System.out.println("La lista tiene espacios vacios");
		} else {
			System.out.println("La lista no contiene espacios vacios");
		}

//3. Borra todas las cadenas de la lista que tengan una longitud menor a 6 caracteres.

		Iterator<String> iterator = listaCadenas.iterator();
		while (iterator.hasNext()) {

			if (iterator.next().length() < 6) {
				iterator.remove();
			}
		}

		System.out.println(listaCadenas);

	}

}
