/* EJERCICIO 15
Realiza un programa que sea un juego de adivinanza. El programa generará de manera
aleatoria un número del 0 al 9. Le preguntará al usuario que intente averiguarlo. Si no lo
consigue, seguirá preguntando hasta que lo haga. Cuando el usuario adivine el número, el
programa terminará mostrando la puntuación obtenida. La puntuación se obtiene restando a
10 el número de intentos que el usuario a necesitado. 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Random;
import java.util.Scanner;

public class T2_ejercicios_practicos_repaso15 {

	public static final Integer PUNTOS = 10;

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Random random = new Random();

		Boolean check = true;
		Integer aleatorio = 0;
		Integer entradaUsuario = 0;
		Integer intentos = 1;
		Integer puntuacion = 0;

		do {
			System.out.println("Introduce el número que crees que saldrá, entre 0 y 9: ");
			entradaUsuario = sc.nextInt();

			aleatorio = random.nextInt(0, 10);

			if (entradaUsuario == aleatorio) {
				System.out.println("¡GANASTE!");
				System.out.println("Intentos: " + intentos);
				puntuacion = PUNTOS - intentos;
				System.out.println("Puntuación: " + PUNTOS + " - " + intentos + " = " + puntuacion);
				check = false;
			} else if (intentos == 10) {
				System.out.println("¡HAS PERDIDO!");
				check = false;
			}
			intentos++;

		} while (check);

		sc.close();

	}

}
