/* EJERCICIO 4
Repite el ejercicio anterior, pero reutilizando (llamando a) los métodos creados en el Ejercicio
1 y 2. */

package ejercicio4;

public class Main {

	public static void main(String[] args) {

		System.out.println(getMayMin(1, " esto es una prueba "));
		System.out.println(getMayMin(2, " ESTO ES UNA PRUEBA "));

	}

	public static String getMayMin(Integer num, String cadena) {

		if (num == 1) {
			cadena = ejercicio1.Main.getMayusculas(cadena);
		} else if (num == 2) {
			cadena = ejercicio2.Main.getMinusculas(cadena);
		}
		return cadena;
	}

}
