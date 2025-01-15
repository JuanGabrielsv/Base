/*
EJERCICIO 3
• Amplia el programa anterior creando una clase que sea SacoNumeros que tenga como atributo una lista de Integer. 
• Haz que tu aplicación use esta clase en lugar de tenerlo todo “apiñado”.
• La clase SacoNumeros tendrá que tener un método addNumero() que te permita ir añadiendo
  dichos números y otro método toString() que imprima todos los números.
• Una vez que lo tengas modificado, añade otro método que sea getNumero() que recibe un
  Integer que será la posición y devuelve el número que está en dicha posición.
• Haz que tu programa pregunte al usuario qué números quiere ver solicitando posiciones y se
  los muestre. Hasta que el usuario indique la posición -1. En tal caso, dejarás de preguntarle. 
*/
package ejercicios_básicos_03;

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
				} catch (IndexOutOfBoundsException e) {
					System.err.println("ERROR: EL NÚMERO INTRODUCIDO NO ES VÁLIDO PARA LA POSICIÓN DE LA LISTA");
					System.out.println("TAMAÑO DE LA LISTA = " + listaNumeros.getListaNumeros().size());
					System.out.println("POSICIONES VÁLIDAS: Desde el 0 hasta la posición "
							+ (listaNumeros.getListaNumeros().size() - 1));
				} catch (NumberFormatException y) {
					System.err.println("NO SE ADMITE INTRODUCIR UN ESPACIO EN BLANCO o NO INTRODUCIR NADA");
				}
			} while (check);
		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}

	}

}
