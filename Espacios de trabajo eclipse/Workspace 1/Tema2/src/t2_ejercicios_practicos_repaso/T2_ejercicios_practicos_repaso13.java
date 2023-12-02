/* EJERCICIO 13
Realizar un programa que de manera continua vaya pidiendo frases al usuario. El programa
deberá ir guardando todas las frases en una variable. Cuando el usuario escriba la frase “FIN”,
el programa terminará y mostrará por consola todo el texto que ha ido almacenando.
La palabra “FIN” se podrá escribir de cualquier forma. Por ejemplo “Fin” o “fin”, etc. 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso13 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		String entradaUsuario = "";
		String mensajeCompleto = "";

		do {
			System.out.println("Introduce una frase: ");
			entradaUsuario = sc.nextLine();

			if (entradaUsuario.equalsIgnoreCase("fin")) {
				check = false;
			} else {
				mensajeCompleto += entradaUsuario + " ";

			}

		} while (check);

		System.out.println(mensajeCompleto);

		System.out.println("Adios");
		sc.close();

	}

}
