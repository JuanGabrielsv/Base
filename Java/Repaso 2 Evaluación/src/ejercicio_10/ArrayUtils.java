package ejercicio_10;

public class ArrayUtils {
	
	public static void imprimirArray(String array[]) {
		
		for (String string : array) {
			System.out.println(string);
		}
		
	}
	
	public static String obtenerPalabra(String array[], Integer num) { 
		
		if (num >= 0 || num < array.length) {
			return array[num];
		}
		return "";
		
	}

}
