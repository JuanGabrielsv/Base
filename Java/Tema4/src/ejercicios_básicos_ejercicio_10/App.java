/*
EJERCICIO 10
En la clase ArrayUtils, crea un método llamado obtenerPalabra que reciba un array de cadenas
y un número N por parámetros. Debe devolver la cadena que está en la posición N del array. Si
N no es una posición válida del array, tendrá que devolver una cadena vacía.
Pruébalo desde el método main con algún test.      
*/
package ejercicios_básicos_ejercicio_10;

public class App {	
	
	public static void main(String[] args) {
		
		String[] array = new String[] {"AB","CD","E","FG","H","I"};
		
		ArrayUtils.obtenerPalabra(array, 6);
		
	}	
}
