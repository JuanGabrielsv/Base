/* EJERCICIO 4
Repite el ejercicio anterior, pero reutilizando (llamando a) los métodos creados en el Ejercicio 1 y 2. */

package t4_ejercicios_basicos_I;

import java.util.Random;

public class Ejercicio4 {

	public static void main(String[] args) {

		Random random = new Random();
		Integer num = random.nextInt(1, 3);

		String resultado = getMayMin(num, "hola");
		System.out.println(resultado);

	}

	public static String getMayMin(Integer num, String cadena) {

		if (num == 1) {
			cadena = Ejercicio1.getMayusculas(cadena);
		} else {
			cadena = Ejercicio2.getMinusculas(cadena);
		}

		return cadena;
	}

}
