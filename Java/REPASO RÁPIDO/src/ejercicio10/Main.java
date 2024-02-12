/* EJERCICIO 10
En la clase ArrayUtils, crea un método llamado obtenerPalabra que reciba un array de cadenas
y un número N por parámetros. Debe devolver la cadena que está en la posición N del array. Si
N no es una posición válida del array, tendrá que devolver una cadena vacía.
Pruébalo desde el método main con algún test. */

package ejercicio10;

public class Main {

	public static void main(String[] args) {

		String[] arrayCadenas = new String[] { "Tomate", "Pera", "Sandía", "Melón", "Cacao" };

		String v = ArrayUtils.obtenerPalabra(arrayCadenas, 1);
		System.out.println(v);
		v = ArrayUtils.obtenerPalabra(arrayCadenas, 3);
		System.out.println(v);
		v = ArrayUtils.obtenerPalabra(arrayCadenas, 2);
		System.out.println(v);
		v = ArrayUtils.obtenerPalabra(arrayCadenas, 4);
		System.out.println(v);
		v = ArrayUtils.obtenerPalabra(arrayCadenas, 0);
		System.out.println(v);

	}

}
