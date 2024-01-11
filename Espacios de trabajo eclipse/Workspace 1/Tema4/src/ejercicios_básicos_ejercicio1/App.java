/* EJERCICIO 1
Crea un método llamado getMayusculas que reciba una cadena por parámetro y devuelva otra
cadena que será el resultado de quitar los espacios en blanco de los extremos de la primera y
de pasarla luego todo a mayúsculas.
Pruébalo desde el método main con algún test. */
package ejercicios_básicos_ejercicio1;
import java.util.Scanner;

public class App {
	
//Declaramos el método fuera de la clase main.	
	
		public static String getMayusculas(String cadena) {
			return cadena.trim().toUpperCase();
		}
	
	public static void main(String[] args) {

//FORMA 1: Pedimos los datos al usuario y directamente le pasamos el método.
/*
		String resultado = "";
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Dame una frase: ");		
		resultado = getMayusculas(sc.nextLine());		
		System.out.println(resultado);
		sc.close();
*/

//FORMA 2: Pedimos los datos al usuario y lo guardamos en una variable, después le aplicamos el método.
/*
		String resultado = null;
		String entradaUsuario = null;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Dame una frase: ");
		entradaUsuario = sc.nextLine();		
		resultado = getMayusculas(entradaUsuario);		
		System.out.println(resultado);
		sc.close();
*/
		
//FORMA 3: Le pasamos el método directamente a una cadena (frase, palabra) e imprimimos;
/*		
		System.out.println(getMayusculas(" que pasa tomasaa "));
*/

//FORMA 4: Le pasamos el método a una cadena (frase, palabra) y la guardamos en una variable e imprimimos.
/*
		String resultado = null;		
		resultado = getMayusculas(" que pasa tomasas ");		
		System.out.println(resultado);
*/
	}
}
