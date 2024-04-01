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
package SIN_TERMINAR_ejercicios_básicos_03;

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
				System.out.println("INTRODUCE UN NÚMERO ENTERO QUE INDICA LA POSICIÓN EN LA LISTA: ");
				System.out.println(listaNumeros.getNumero(Integer.parseInt(sc.nextLine())));
				
			} while (check);

		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}	

	}

}
