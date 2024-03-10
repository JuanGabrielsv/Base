package ejercicio_11;

public class Ejercicio11 {

	public static void main(String[] args) {

		String[] array = new String[] { "Tomate", "Pera", "Sandia", "Melón" };

		ArrayUtils.imprimirArray(array);
		System.out.println();

		System.out.println(ArrayUtils.obtenerPalabra(array, 1));
		System.out.println();

		System.out.println(ArrayUtils.buscarPalabra(array, "Tomate"));
		System.out.println(ArrayUtils.buscarPalabra(array, "Pera"));
		System.out.println(ArrayUtils.buscarPalabra(array, "Sandia"));
		System.out.println(ArrayUtils.buscarPalabra(array, "Melón"));
	}
}
