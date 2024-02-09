/* EJERCICIO 3
Crea un método llamado getMayMin que reciba dos parámetros:

	• Un número que podrá ser 1 o 2
	• Una cadena
	
Tendrá que coger la cadena recibida y quitarle los espacios en blanco del principio y del final.
Luego, si el número recibido es 1, devolverá esa cadena en mayúsculas. Si el número recibido
es 2, devolverá esa cadena en minúsculas.
Pruébalo desde el método main con algún test. */

package ejercicio3;

public class Main {

	public static void main(String[] args) {

		System.out.println(getMayMin(1, " Texto de prueba "));
		System.out.println(getMayMin(2, " TEXTO DE PRUEBA "));

	}

	public static String getMayMin(Integer num, String cadena) {

		if (num == 1) {
			return cadena.toUpperCase().trim();
		} else if (num == 2) {
			return cadena.toLowerCase().trim();
		}
		return cadena;

	}

}
