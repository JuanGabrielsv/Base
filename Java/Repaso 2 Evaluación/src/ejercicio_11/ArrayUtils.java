package ejercicio_11;

public class ArrayUtils {

	public static void imprimirArray(String array[]) {
		for (String string : array) {
			System.out.println(string);
		}
	}

	public static String obtenerPalabra(String array[], Integer num) {
		if (num >= 0 && num < array.length) {
			return array[num];
		}
		return "";
	}

	public static Integer buscarPalabra(String array[], String palabra) {
		for (int i = 0; i < array.length; i++) {
			if (palabra == array[i]) {
				return i;
			}
		}
		return -1;
	}

}
