/*
EJERCICIO 57

Haz un programa que solicite palabras al usuario y las almacene hasta que escriba FIN.
Después, pide al usuario que te de alguna letra y le muestras todas las palabras almacenadas
que empiecen por esa letra. Así continuamente hasta que el usuario vuelva a escribir FIN.
Por ejemplo, imaginemos que el usuario nos dice estas palabras en la primera parte:
Blas, Sevilla, regadera, Sol, bota, FIN

La segunda parte del programa se ejecutaría así:
Dime una letra: B
Hay 2 palabras que empiezan por B:
	> Blas
	> bota
Dime una letra: T
No hay palabras que empiezan por T.
Dime una letra: R
Hay 1 palabra que empieza por R:
	> regadera
Dime una letra: FIN
¡Gracias por jugar con nosotros! Bye

PISTA: Utiliza un Map donde la clave sea un String (la letra) y el valor sea una List<String> (las
palabras). Es la última pista relativas a Map que te doy… 
*/

package ejercicios_básicos_ejercicio_57;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String entradaUsuario;
		Boolean check = true;
		Map<String, List<String>> mapPalabras = new HashMap<>();

		do {
			System.out.println("INTRODUCE UNA PALABRA: ");
			entradaUsuario = sc.nextLine();
			String minus = entradaUsuario.toLowerCase();
			String key = minus.substring(0, 1);
			List<String> listaPalabras = new ArrayList<>();

			if (entradaUsuario.equalsIgnoreCase("fin")) {
				check = false;
			} else if (!mapPalabras.containsKey(minus.substring(0, 1))) {
				listaPalabras.add(entradaUsuario);
				mapPalabras.put(key, listaPalabras);
			} else if (mapPalabras.containsKey(key)) {
				mapPalabras.get(key).add(entradaUsuario);
			}

		} while (check);

		do {
			System.out.println("INTRODUCE UNA LETRA: ");
			entradaUsuario = sc.nextLine();
			String minus = entradaUsuario.toLowerCase();
			check = true;

			if (entradaUsuario.equalsIgnoreCase("fin")) {
				System.out.println("¡¡GRACIAS POR JUGAR CON NOSOTROS!!");
				check = false;
			} else if (mapPalabras.containsKey(minus)) {
				List<String> nuevaLista = new ArrayList<String>();
				nuevaLista = mapPalabras.get(minus);
				System.out.println("HAY " + mapPalabras.get(minus).size() + " PALABRAS QUE EMPIEZA POR " + minus);
				for (String palabra : nuevaLista) {
					System.out.println("\t > " + palabra);
				}
			} else {
				System.out.println("NO HAY PALABRAS QUE EMPIECE POR " + minus);
			}

		} while (check);
		
		sc.close();

	}

}
