/*
EJERCICIO 11
En la clase ArrayUtils, crea un método llamado buscarPalabra que reciba un array de cadenas
y una palabra por parámetros. Debe devolver un entero indicando la posición donde se
encuentra esa palabra dentro del array. Si no existe la palabra en el array, devolverá -1.
Pruébalo desde el método main con algún test.       
*/
package ejercicios_básicos_ejercicio11;

public class App {	
	
	public static void main(String[] args) {
		
//FORMA 1

		String[] array = new String[]{"hola","caracola","coche","oceano","coche"};
		
		ArrayUtils.buscarPalabra(array, "coche");

		
//FORMA 2 ESTA FORMA DEVUELVE SÓLO UNA VEZ LA PRIMERA POSICIÓN DE LA PALABRA, SI SE REPITE, NO TE DA LA SIGUIENTE.
/*
		String[] array = new String[]{"hola","caracola","coche","oceano","coche"};
		
		String palabra = "coche";
		Integer posicion = ArrayUtils.buscarPalabra(array, palabra);
		
		System.out.println(posicion);
*/
	}	
}
