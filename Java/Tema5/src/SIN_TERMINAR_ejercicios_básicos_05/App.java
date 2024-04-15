/*
EJERCICIO 5

Añade a tu clase un método que sea division() que devuelva un BigDecimal con el resultado de
dividir el primer número de la lista entre el segundo, y el resultado entre el tercero, y el
resultado entre el cuarto, y así sucesivamente hasta terminar la lista. El resultado de cada
división parcial estará siempre redondeado a 2 decimales con HALF_UP.

Si te encuentras con algún valor que sea 0, la división fallará. Captura la excepción para que en
ese caso el resultado sea igual a cero.

Prueba el nuevo método llamando desde tu programa tras lo hecho en el Ejercicio 4.  
*/
package SIN_TERMINAR_ejercicios_básicos_05;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		Boolean check = true;
		SacoNumeros listaNumeros = new SacoNumeros();

		try {
			do {
				try {
					System.out.println("INTRODUCE UN NÚMERO ENTERO: ");
					entradaUsuario = Integer.parseInt(sc.nextLine());
					if (entradaUsuario.equals(-1)) {
						check = false;
					} else {
						listaNumeros.addNumero(entradaUsuario);
					}
				} catch (NumberFormatException e) {
					System.out.println("Debes introducir un número entero, no valen letras, ni espacios en blanco.");
				}
			} while (check);

			System.out.println(listaNumeros);
			check = true;

			do {
				try {
					Integer entradaUsuario2;
					System.out.println("INTRODUCE UN NÚMERO ENTERO QUE INDICA LA POSICIÓN EN LA LISTA: ");
					entradaUsuario2 = Integer.parseInt(sc.nextLine());
					if (entradaUsuario2 == -1) {
						System.out.println("- SALIENDO DEL PROGRAMA -");
						check = false;
					} else {
						System.out.println(listaNumeros.getNumero(entradaUsuario2));
					}
				} catch (NumberFormatException y) {
					System.err.println("NO SE ADMITE INTRODUCIR UN ESPACIO EN BLANCO o NO INTRODUCIR NADA");
				} catch (IndexOutOfBoundsException e) {
					System.out.println("kjhdf");
					check = false;				
				}
			} while (check);
		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}
		
		System.out.println(listaNumeros.division());

	}

}
