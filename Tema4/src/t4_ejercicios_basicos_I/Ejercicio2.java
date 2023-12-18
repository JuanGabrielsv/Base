/* EJERCICIO 2
Crea un método llamado getMinusculas que reciba una cadena por parámetro y devuelva otra cadena que
será el resultado de quitar los espacios en blanco de los extremos de la primera y de pasarla luego todo a
minúsculas.
Pruébalo desde el método main con algún test */
package t4_ejercicios_basicos_I;

public class Ejercicio2 {
	
	public static void main(String[]args) {
		
		String frase = getMinusculas(" HOLA QUE PASA ");		
		System.out.println(frase);
		
	}

	private static String getMinusculas(String resultado) {		
		return resultado.trim().toLowerCase();		
		
	}
	
}
