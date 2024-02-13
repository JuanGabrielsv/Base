/* EJERCICIO 11
En la clase ArrayUtils, crea un método llamado buscarPalabra que reciba un array de cadenas
y una palabra por parámetros. Debe devolver un entero indicando la posición donde se
encuentra esa palabra dentro del array. Si no existe la palabra en el array, devolverá -1.
Pruébalo desde el método main con algún test. */

package ejercicio11;

public class ArrayUtils {

	public static Integer buscarPalabra(String[] array, String palabra) {

		for (int i = 0; i < array.length; i++) {
			if (array[i] == palabra) {
				return i;
			}
		}

		return -1;
	}

}
