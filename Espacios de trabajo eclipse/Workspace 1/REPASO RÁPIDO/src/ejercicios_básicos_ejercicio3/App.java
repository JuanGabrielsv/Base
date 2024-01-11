/*
EJERCICIO 3
Crea un método llamado getMayMin que reciba dos parámetros:
- Un número que podrá ser 1 o 2
- Una cadena
Tendrá que coger la cadena recibida y quitarle los espacios en blanco del principio y del final.
Luego, si el número recibido es 1, devolverá esa cadena en mayúsculas. Si el número recibido
es 2, devolverá esa cadena en minúsculas.
Pruébalo desde el método main con algún test. 
*/
package ejercicios_básicos_ejercicio3;

import java.util.Random;

public class App {

	public static void main(String[] args) {
	
//FORMA 1: Imprimimos directamente la cadena pasándole el método.
/*		
		Random random = new Random();
		Integer rd = random.nextInt(1,3);		
		
		System.out.println(rd);
		System.out.println(getMayMin(rd, " ESTO es UNA prueba "));
*/
		
//FORMA 2: Pasamos el resultado del método a una variable y después la imprimimos.
/*		
		Random random = new Random();
		Integer rd = random.nextInt(1,3);
		String resultado = null;
		
		System.out.println(rd);
		resultado = getMayMin(rd, " ESTO es UNA prueba ");
		System.out.println(resultado);
*/
	}

// Creamos el método getMayMin fuera de la clase main.
	
	public static String getMayMin (Integer num, String cadena) {
		if (num == 1) {
			cadena = cadena.trim().toUpperCase();
		}
		else if (num == 2) {
			cadena = cadena.trim().toLowerCase();
		}		
		return cadena;
	}
}
