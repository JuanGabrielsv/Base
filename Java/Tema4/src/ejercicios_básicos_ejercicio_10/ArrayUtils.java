/*
EJERCICIO 10
En la clase ArrayUtils, crea un método llamado obtenerPalabra que reciba un array de cadenas
y un número N por parámetros. Debe devolver la cadena que está en la posición N del array. Si
N no es una posición válida del array, tendrá que devolver una cadena vacía.
Pruébalo desde el método main con algún test.  
*/
package ejercicios_básicos_ejercicio_10;

public class ArrayUtils {
	
	public static String obtenerPalabra(String array[], Integer num) {
		if (num > array.length + 1 || num < array.length) {
			System.out.println("no data");
		}
		else {
			for (int i = 0; i < array.length; i++) {
				if (i == num) {
					System.out.println(array[i]);
				}
			}						
		}
		return null;
		
	}
}
