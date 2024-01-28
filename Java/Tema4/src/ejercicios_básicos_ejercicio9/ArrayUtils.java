/*
EJERCICIO 9
Crea un método llamado imprimirArray en una clase llamada ArrayUtils que reciba un array de
cadenas y lo imprima por completo.
Pruébalo desde el método main con algún test. 
*/
package ejercicios_básicos_ejercicio9;

public class ArrayUtils {
	
	public static void imprimirArray(String[] array) {
		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " ");
		}
				
	}
}
