/* EJERCICIO 9
Crea un método llamado imprimirArray en una clase llamada ArrayUtils que reciba un array de
cadenas y lo imprima por completo.
Pruébalo desde el método main con algún test. */

package ejercicio9;

public class ArrayUtils {

	public static void imprimirArray(String[] array) {
		for (String string : array) {
			System.out.println(string);
		}
	}

}
