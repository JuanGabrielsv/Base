/* EJERCICIO 1
Crea un método llamado getMayusculas que reciba una cadena por parámetro y devuelva otra cadena que
será el resultado de quitar los espacios en blanco de los extremos de la primera y de pasarla luego todo a
mayúsculas.
Pruébalo desde el método main con algún test. */

package t4_ejercicios_basicos_I;

public class Ejercicio1{

	public static void main(String[] args) {
		
		String frase = " hola que pasa ";
		
		String frase2 = getMayusculas(frase);		
		System.out.println(frase2);
	}
	
	public static String getMayusculas (String sinEspacio) {		
		return sinEspacio.trim().toUpperCase();
	}

}
