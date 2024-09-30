/* EJERCICIO 14
Realizar un programa que genere contraseñas del siguiente modo: pedirá al usuario una
palabra de al menos 8 caracteres. Si no tiene esa longitud, volverá a pedir otra hasta que el
usuario indique una de al menos esa longitud. Después, el programa cambiará las letras de esa
palabra por números siguiendo estas reglas:
 a  4
 e  3
 i  1
 o  0
 t  7
El resultado se mostrará por consola. 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso14 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Boolean check = true;
		String entradaUsuario = "";

		do {
			System.out.println("Introduce una palabra o frase de mas de 8 caracteres: ");
			entradaUsuario = sc.nextLine();

			if (entradaUsuario.length() < 8) {
				System.out.println("ERROR - El texto tiene que tener más de 8 caracteres.");
				System.out.println();
			} else {
				check = false;
			}

		} while (check);

		entradaUsuario = entradaUsuario.replaceAll("a", "4").replaceAll("e", "3").replaceAll("i", "1")
				.replaceAll("o", "0").replaceAll("t", "7");

		System.out.println(entradaUsuario);

		sc.close();

	}

}
