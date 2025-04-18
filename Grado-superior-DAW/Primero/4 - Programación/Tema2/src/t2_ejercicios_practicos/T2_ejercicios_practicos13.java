/* EJERCICIO 13
Realizar un programa que solicite un texto por teclado. A continuación, dividir el texto en
trozos de 5 caracteres cada uno que iremos imprimiendo por consola. Por ejemplo, si el texto
indicado es: “Buenos días, mi nombre es Blau Blau.” El resultado tendrá que ser:
Bueno
s día
s, mi
 nomb
re es
 Blau
 Blau
. 
*/
package t2_ejercicios_practicos;

import java.util.Scanner;

public class T2_ejercicios_practicos13 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String entradaUsuario = "";
		Integer inicio = 0;
		Integer fin = 5;
		Integer tamTotal;
		
		System.out.println("Introduce el texto: ");
		entradaUsuario = SC.nextLine();
		
		tamTotal = entradaUsuario.length();
		
		while(fin<=tamTotal) {
			System.out.println(entradaUsuario.substring(inicio,fin));
			inicio = fin;
			fin = fin + 5;
		}

		/*for (int i = 0; i < tamTotal; i++) {
			dividida = entradaUsuario.substring(inicio,fin);
			System.out.println(dividida);
			inicio = fin;
			fin = fin + 5;
			}*/
		
		System.out.println(entradaUsuario.substring(inicio));
		SC.close();


	}

}
