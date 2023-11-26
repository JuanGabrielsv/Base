/* EJERCICIO 10
Solicitar al usuario una dirección web que tendrá este formato:
PROTOCOLO://PARTE1.PARTE2.PARTE3
Por ejemplo:
http://www.google.com
Debemos dividir esa dirección e imprimirla por consola de este modo:
http://
www
google
com
Otro ejemplo:
https://w3w.blasblau.es
Debemos imprimir:
https://
w3w
blasblau
es */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso10 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String entradaUsuario = "";
		String entradaUsuariominusculas = "";
		Boolean check = true;
		
		do {
			System.out.println("Introduce una dirección WEB: ");
			entradaUsuario = SC.nextLine();
			entradaUsuariominusculas = entradaUsuario.toLowerCase().trim();
			check = false;
			
			if (entradaUsuariominusculas.startsWith("https://") || entradaUsuariominusculas.startsWith("http://")) {
				
			}
			
		} while (check);
		
		
		
		
		
	

	}

}
