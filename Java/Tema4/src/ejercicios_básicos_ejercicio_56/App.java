/*
EJERCICIO 56
Haz un programa que solicite números enteros al usuario hasta que nos indique el 0.

El programa tendrá que ir contando cuántas veces nos ha indicado cada número. Por ejemplo,
imaginemos que el usuario nos va diciendo estos números:

3, 6, 8, 3, 2, 3, 4, 6, 3, 8, 0

El programa, al terminar, tendrá que imprimir algo así:
Total números indicados: 10
Distribución:
	> Número 3: 4 veces
	> Número 4: 1 vez
	> Número 6: 2 veces
	> Número 8: 2 veces
	> Numero 2: 1 vez

PISTA: Utiliza un Map donde las keys son los números que nos van indicando y los values son la
suma acumulada de ese número.
*/

package ejercicios_básicos_ejercicio_56;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Map<Integer, Integer> mapNumeros = new HashMap<Integer, Integer>();
		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		Integer entradaUsuario;

		System.out.println("Introduce un '0' para terminar.");

		do {

			System.out.println("INTRODUCE UN NÚMERO ENTERO: \n");
			entradaUsuario = sc.nextInt();

			if (entradaUsuario != 0 && !mapNumeros.containsKey(entradaUsuario)) {
				mapNumeros.put(entradaUsuario, 1);
			} else if (entradaUsuario != 0 && mapNumeros.containsKey(entradaUsuario)) {
				mapNumeros.put(entradaUsuario, mapNumeros.get(entradaUsuario) + 1);
			} else if (entradaUsuario == 0) {
				check = false;
			}

		} while (check);
		
		System.out.println(mapNumeros.size());

		System.out.println(mapNumeros);

		sc.close();

	}

	
	/* El programa, al terminar, tendrá que imprimir algo así:
	Total números indicados: 10
	Distribución:
		> Número 3: 4 veces
		> Número 4: 1 vez
		> Número 6: 2 veces
		> Número 8: 2 veces
		> Numero 2: 1 vez */
	
	@Override
	public String toString() {
		
		Integer totalNumerosIdicados = 0;
		
		Collection<Integer> valores = mapNumeros.values();
		
		return "App []";
	}
	

}
