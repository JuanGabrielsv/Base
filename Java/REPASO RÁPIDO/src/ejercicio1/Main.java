/* EJERCICIO 1
Crea un método llamado getMayusculas que reciba una cadena por parámetro y devuelva otra
cadena que será el resultado de quitar los espacios en blanco de los extremos de la primera y
de pasarla luego todo a mayúsculas.
Pruébalo desde el método main con algún test. */

package ejercicio1;

public class Main {

	public static void main(String[] args) {

		System.out.println(" esto es una prueba ");
		System.out.println(getMayusculas(" esto es una prueba "));

	}

	public static String getMayusculas(String cadena) {
		return cadena.trim().toUpperCase();
	}

}
