/* EJERCICIO 11
Realizar un programa que solicite un email. A continuación, debemos validar el formato de ese
email. Si es correcto, terminamos. Si no es correcto, volvemos a solicitarlo.
Para validar el email tendremos que revisar que:
a) Contiene una @
b) Contiene un punto después de la @, pero no inmediatamente después.
c) No puede terminar con el punto */ 

package t2_ejercicios_practicos;

import java.util.Scanner;

public class T2_ejercicios_practicos11 {
	
	public static final Scanner SC = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		String entradaUsuario = "";
		Boolean check = true;
		
		do {
			System.out.println("Introduce tu email: ");
			entradaUsuario = SC.nextLine();
			
			if (!entradaUsuario.contains("@") || entradaUsuario.contains("@.") || entradaUsuario.endsWith(".") || !entradaUsuario.contains(".")) {
				System.out.println("El email debe contener una '@' no puede haber un punto a continuación de la misma y no puede terminar en un punto");
			}
			else {
				break;
			}
			
		} while (check);
		
		System.out.println("email correcto !!!");
		
		SC.close();
		
	}

}
