/* EJERCICIO 2
Crea un método llamado getMinusculas que reciba una cadena por parámetro y devuelva otra
cadena que será el resultado de quitar los espacios en blanco de los extremos de la primera y
de pasarla luego todo a minúsculas.
Pruébalo desde el método main con algún test. */
package ejercicio2;

public class Main {

	public static void main(String[] args) {

		System.out.println(" ESTO ES UNA PRUEBA ");
		System.out.println(getMinusculas(" ESTO ES UNA PRUEBA "));

	}

	public static String getMinusculas(String cadena) {
		return cadena.trim().toLowerCase();
	}

}
