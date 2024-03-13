package ejercicio_02;

public class Ejercicio2 {

	public static void main(String[] args) {
		
		System.out.println(getMinusculas("HOLA"));
		

	}
	
	public static String getMinusculas(String cadena) {
		String minusculas;
		
		minusculas = cadena.toLowerCase().trim();
		return minusculas;
	}

}
