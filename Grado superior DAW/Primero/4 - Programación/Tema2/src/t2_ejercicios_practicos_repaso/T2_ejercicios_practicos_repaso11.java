/* EJERCICIO 11
Realizar un programa que solicite dos números enteros al usuario. Luego mostrar el siguiente
menú:
*** MENÚ ***
1. Sumar
2. Restar
3. Multiplicar
4. Dividir
0. Salir
Hacer con los dos números la operación elegida (el usuario indicará 1, 2, 3 o 4) y mostrar el
resultado. Luego volver a mostrar el menú. Si el usuario escoge la opción 0 (Salir), el programa
termina.
OJO: Si el segundo número es un cero, no se podrán dividir. En ese caso, si elige la opción 4,
tendremos que indicar que la división no es posible. */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso11 {

	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {

		Integer entradaUsuarioOpcion = 0;
		Integer entradaUsuario1 = 0;
		Integer entradaUsuario2 = 0;
		double calculoDouble = 0;
		double usuario1 = 0;
		double usuario2 = 0;
		Boolean check = true;
		Integer calculo = 0;

		do {

			System.out.println("*** MENU ***");
			System.out.println("1. Sumar");
			System.out.println("2. Restar");
			System.out.println("3. Multiplicar");
			System.out.println("4. Dividir");
			System.out.println("0. Salir");
			System.out.println("Elige la opción: ");
			entradaUsuarioOpcion = SC.nextInt();

			switch (entradaUsuarioOpcion) {

			case 0:
				check = false;
				break;
			case 1:
				System.out.println("Has elegido SUMAR: ");
				System.out.println("Introduce el primer número (entero): ");
				entradaUsuario1 = SC.nextInt();
				System.out.println("Introduce el segundo número (entero): ");
				entradaUsuario2 = SC.nextInt();
				calculo = (entradaUsuario1 + entradaUsuario2);

				System.out.println(calculo);
				break;
			case 2:
				System.out.println("Has elegido RESTAR: ");
				System.out.println("Introduce el primer número (entero): ");
				entradaUsuario1 = SC.nextInt();
				System.out.println("Introduce el segundo número (entero): ");
				entradaUsuario2 = SC.nextInt();

				calculo = (entradaUsuario1 - entradaUsuario2);

				System.out.println(calculo);
				break;
			case 3:
				System.out.println("Has elegido MULTIPLICAR: ");
				System.out.println("Introduce el primer número (entero): ");
				entradaUsuario1 = SC.nextInt();
				System.out.println("Introduce el segundo número (entero): ");
				entradaUsuario2 = SC.nextInt();

				calculo = (entradaUsuario1 * entradaUsuario2);

				System.out.println(calculo);
				break;
			case 4:
				System.out.println("Has elegido DIVIDIR: ");
				System.out.println("Introduce el primer número (entero): ");
				entradaUsuario1 = SC.nextInt();
				System.out.println("Introduce el segundo número (entero): ");
				entradaUsuario2 = SC.nextInt();

				if (entradaUsuario1 <= 0 || entradaUsuario2 <= 0) {

					System.out.println("ERROR - Ninguno de los dos número puede ser 0, vuelva a intentarlo.");

				} else {
					usuario1 = entradaUsuario1.doubleValue();
					usuario2 = entradaUsuario2.doubleValue();
					calculoDouble = calculo.doubleValue();

					calculoDouble = (usuario1 / usuario2);

					System.out.println(calculoDouble);
					break;
				}

			default:

			}

		} while (check);

	}

}
