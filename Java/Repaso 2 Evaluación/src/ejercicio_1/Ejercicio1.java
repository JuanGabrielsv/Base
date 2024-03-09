package ejercicio_1;

public class Ejercicio1 {

	public static void main(String[] args) {

		System.out.println(getMayusculas(" hola "));

	}

	public static String getMayusculas(String cadena) {
		String sinEspacio;
		sinEspacio = cadena.trim();
		return sinEspacio;
	}

}
