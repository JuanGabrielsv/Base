package ejercicio1;

public class Main {

	public static void main(String[] args) {

		String cadena = " que pasa tomasa ";

		System.out.println(getMayusculas(cadena)); 
		
		

	}

	public static String getMayusculas(String cadena) {
		return cadena.trim().toUpperCase(); 
	}

}
