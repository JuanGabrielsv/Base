/*
EJERCICIO 2
Crea un método llamado getMinusculas que reciba una cadena por parámetro y devuelva otra
cadena que será el resultado de quitar los espacios en blanco de los extremos de la primera y
de pasarla luego todo a minúsculas.
Pruébalo desde el método main con algún test. 
*/
package ejercicios_básicos_ejercicio2;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
//FORMA 1: Pedimos los datos al usuario y directamente imprimimos pasándole el método.
/*		
		Scanner sc = new Scanner(System.in);
				
		System.out.println("Dame una frase: ");
		System.out.println(getMinusculas(sc.nextLine()));
		sc.close();
*/
		
//FORMA 2: Pedimos los datos al usuario, guardamos en variable y directamente le pasamos el método.
/*		
		Scanner sc = new Scanner(System.in);
		String resultado = null;
		
		System.out.println("Dame una frase: ");
		resultado = getMinusculas(sc.nextLine());
		System.out.println(resultado);
		sc.close();
*/

//FORMA 3: Pedimos los datos al usuario y lo guardamos en una variable, después le aplicamos el método.
/*		
		Scanner sc = new Scanner(System.in);
		String entradaUsuario = null;
		String resultado = null;
		
		System.out.println("Dame una frase: ");
		entradaUsuario = sc.nextLine();
		resultado = getMinusculas(entradaUsuario);
		System.out.println(resultado);
		sc.close();
*/		

//FORMA 4: Le pasamos el método directamente a una cadena (frase, palabra) e imprimimos a la vez;
/*		
		System.out.println(getMinusculas(" QUE PASA TOMASASSA "));
*/

//FORMA 5: Le pasamos el método a una cadena (frase, palabra) y la guardamos en una variable e imprimimos.		
/*		
		String resultado = null;
		
		resultado = getMinusculas(" QUE PASA TOMASASS ");
		System.out.println(resultado);
*/
	}
	
	public static String getMinusculas(String cadena) {
		return cadena.trim().toLowerCase();
	}
}
