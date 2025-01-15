/* EJERCICIO 8
Realizar un programa que solicite un texto al usuario. Si el texto comienza por “hola” y termina
con “hastaluego”, le indicaremos que lo hemos entendido, e imprimiremos el mensaje que hay
entre esas dos palabras.
Por ejemplo, si el usuario escribe “hola cómo estás hastaluego”
Debemos decir: Lo he entendido. Mensaje: cómo estás.
Si el texto no cumple estos requisitos, le indicaremos que no lo hemos entendido, y que nos lo
repita otra vez. */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso8 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String entradaUsuario = "";
		Boolean check = true;
		String mensaje = "";
		
		
		do {
			System.out.println("Introduce tu mensaje: ");
			entradaUsuario = SC.nextLine();
			
			if (entradaUsuario.startsWith("hola") && entradaUsuario.endsWith("hasta luego")) {
				
				check = false;				
				mensaje = entradaUsuario.substring(entradaUsuario.indexOf('a') + 1, entradaUsuario.lastIndexOf("hasta luego"));
				System.out.println("Lo he entendido: " + mensaje.trim());				
			}
			else {
				System.out.println("ERROR - Texto mal introducido, repetir de nuevo");
			}
			
		} while (check);
		

	}

}
