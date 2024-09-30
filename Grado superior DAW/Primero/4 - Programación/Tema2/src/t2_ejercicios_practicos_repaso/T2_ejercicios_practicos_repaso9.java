/* EJERCICIO 9
Mejorar el ejercicio anterior para que cuando entendamos el mensaje, volvamos a pedir otro
nuevo continuamente. Lo haremos hasta que el mensaje, en lugar de terminar en
“hastaluego”, termine en “adiós” */ 

package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso9 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String entradaUsuario = "";
		Boolean check = true;
		String mensaje = "";
		
		do {
			System.out.println("Introduce tu mensaje: ");
			entradaUsuario = SC.nextLine();
			
			if (entradaUsuario.startsWith("hola") && entradaUsuario.endsWith("hasta luego")) {
				mensaje = entradaUsuario.substring(entradaUsuario.indexOf("a") + 1, entradaUsuario.lastIndexOf("hasta luego"));
				System.out.println("He entendido el mensaje: " + mensaje.trim());
			}
			else if (entradaUsuario.startsWith("hola") && entradaUsuario.endsWith("adios")) {
				check = false;
				mensaje = entradaUsuario.substring(entradaUsuario.indexOf("a") + 1, entradaUsuario.lastIndexOf("adios"));
				System.out.println("He entendido el mensaje: " + mensaje.trim());				
			}
			else {
				System.out.println("ERROR - Texto incorrecto, volver a repetir.");
			}
		} while (check);		

	}

}
