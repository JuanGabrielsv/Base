/* EJERCICIO 3
Crea un método llamado getMayMin que reciba una cadena por parámetro:
• Un número que podrá ser 1 o 2
• Una cadena
Tendrá que devolver la cadena recibida, quitando espacios en blanco del principio y del final. Luego, si el
número recibido es 1, devolverá esa cadena en mayúsculas. Si el número recibido es 2, devolverá esa cadena
en minúsculas.
Pruébalo desde el método main con algún test. */
package t4_ejercicios_basicos_I;

import java.util.Random;

public class Ejercicio3 {

	public static void main(String[] args) {
		
		Random random = new Random();		
		Integer num = random.nextInt(1,3);
		
		String resultado = getMayMin(num, "hola");
		System.out.println(resultado);
		
	}

	private static String getMayMin(Integer num, String texto) {
		
		if (num == 1) {
			texto = texto.trim().toUpperCase();
		}
		else {
			texto = texto.trim().toLowerCase();
		}		
		return texto;
	}

}
