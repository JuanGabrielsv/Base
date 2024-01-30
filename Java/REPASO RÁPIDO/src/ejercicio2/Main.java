package ejercicio2;

public class Main {

	public static void main(String[] args) {
		
		String cadena = " que pasa tomasa ";
		String cadena2 = " QUE PASA TOMASA ";
		
		System.out.println(cadena2 + getMinusculas(cadena2));
		System.out.println(getMayusculas(cadena));
		

	}
	
	public static String getMinusculas(String cadena) {
		return cadena.trim().toLowerCase();
	}
	public static String getMayusculas(String cadena) {
		return cadena.trim().toUpperCase();				
	}

}
