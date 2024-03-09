package ejercicio_4;

import ejercicio_1.Ejercicio1;
import ejercicio_2.Ejercicio2;

public class Ejercicio4 {

	public static void main(String[] args) {

		System.out.println(getMayMin(1, " Pasar a Mayúsculas   "));
		System.out.println(getMayMin(2, " PASAR A MINÚSCULASS    "));

	}

	public static String getMayMin(Integer num, String cadena) {

		if (num == 1) {
			cadena = Ejercicio1.getMayusculas(cadena);

		} else if (num == 2) {
			cadena = Ejercicio2.getMinusculas(cadena);

		}
		return cadena;
	}

}
