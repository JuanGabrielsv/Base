package ejercicio_10;

public class Ejercicio10 {

	public static void main(String[] args) {

		String[] array = new String[] { "Tomate", "Pera", "Sandia", "Melón" };

		ArrayUtils.imprimirArray(array);
		
		String palabra = ArrayUtils.obtenerPalabra(array, 2);
		
		System.out.println(palabra);
		

	}

}
