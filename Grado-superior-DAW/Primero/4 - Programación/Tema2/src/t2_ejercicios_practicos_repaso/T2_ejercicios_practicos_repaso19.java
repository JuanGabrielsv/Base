/* EJERCICIO 19
Realizar un programa que sea un conversor de euros a peseta y viceversa. El programa
funcionará del siguiente modo:
1. Mostrará este menú:
1 - Pasar de Pesetas a Euros
2 - Pasar de Euros a Pesetas
3 - Salir
2. Si selecciona la opción 1 o 2, se solicitará la cantidad, se hará la conversión, se
mostrará el resultado y después se volverá a mostrar el menú del punto 1. Así
continuamente
3. Cuando se selecciona la opción 3, el programa termina. 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso19 {

	public static final double VALORPESETAS = 166.386;

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		Integer entradaUsuario = 0;
		double entradaUsuariopesetas = 0;
		double entradaUsuarioeuros = 0;
		double calculo = 0;
		float calculoFinal = 0;

		do {
			System.out.println("1 - Pasar de Pesetas a Euros");
			System.out.println("2 - Pasar de Euro a Pesetas");
			System.out.println("3 - Salir");
			entradaUsuario = sc.nextInt();

			switch (entradaUsuario) {

			case 1:

				System.out.println("Introduce la cantidad de pesetas que quieres pasar a euros: ");
				entradaUsuariopesetas = sc.nextDouble();

				calculo = entradaUsuariopesetas / VALORPESETAS;
				calculoFinal = (float) calculo;

				System.out.println(calculoFinal);
				break;

			case 2:

				System.out.println("Introduce la cantidad de euros para pasar a pesetas: ");
				entradaUsuarioeuros = sc.nextDouble();

				calculo = entradaUsuarioeuros * VALORPESETAS;
				calculoFinal = (float) calculo;

				System.out.println(calculoFinal);
				break;

			case 3:

				System.out.println("Saliendo del programa...");
				System.out.println("Adios");
				check = false;
				break;

			default:

				System.err.println("ERRROR - Opción incorrecta, vuelva a elegir.");

			}

		} while (check);
		
		sc.close();

	}

}
