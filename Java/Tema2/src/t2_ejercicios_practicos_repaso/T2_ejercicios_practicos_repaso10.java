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
	public static final String PUNTO = ".";
	public static final String BARRAS = "://";

	public static void main(String[] args) {
		
		String entradaUsuario = "";
		String entradaUsuariominusculas = "";
				
		System.out.println("Introduce una dirección WEB: ");
		entradaUsuario = SC.nextLine();
		entradaUsuariominusculas = entradaUsuario.toLowerCase().trim();
		
		Integer indiceProtocolo = entradaUsuariominusculas.indexOf(BARRAS);
		Integer indicePPunto = entradaUsuariominusculas.indexOf(PUNTO);
		Integer indiceUPunto = entradaUsuariominusculas.lastIndexOf(PUNTO);
		
		if (indiceProtocolo != -1 && indicePPunto != -1 && indiceUPunto != indicePPunto) {
			
			System.out.println(entradaUsuariominusculas.substring(0, indiceProtocolo +3));
			System.out.println(entradaUsuariominusculas.substring(indiceProtocolo +3, indicePPunto));
			System.out.println(entradaUsuariominusculas.substring(indicePPunto +1, indiceUPunto));
			System.out.println(entradaUsuariominusculas.substring(indiceUPunto +1));
		}
		else {
			System.out.println("El formato no es el correcto: ");
		}
		SC.close();
	}

}
