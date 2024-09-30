/*
EJERCICIO 11
En la clase ArrayUtils, crea un método llamado buscarPalabra que reciba un array de cadenas
y una palabra por parámetros. Debe devolver un entero indicando la posición donde se
encuentra esa palabra dentro del array. Si no existe la palabra en el array, devolverá -1.
Pruébalo desde el método main con algún test.  
*/
package ejercicios_básicos_ejercicio_11;

public class ArrayUtils {
	
	public static Integer buscarPalabra(String[] array, String palabra) {

//FORMA 1

		boolean check = true;
		
		for (int i = 0; i < array.length; i++) {
			if (palabra.equals(array[i])) {
				System.out.println(i);
				check = false;
			}			
		}				
		
		if (check) {
			System.out.println(-1);
		}
		return null; 

		
//FORMA 2 ESTA FORMA DEVUELVE SÓLO UNA VEZ LA PRIMERA POSICIÓN DE LA PALABRA, SI SE REPITE, NO TE DA LA SIGUIENTE.
/*
		for (int i = 0; i < array.length; i++) {
			if (array[i].equals(palabra)) {
				return i;
			}
		}
		return -1;
*/
	}
}
