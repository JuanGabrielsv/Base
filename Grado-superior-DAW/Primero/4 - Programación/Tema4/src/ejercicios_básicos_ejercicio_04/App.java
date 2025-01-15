/*
EJERCICIO 4
Repite el ejercicio anterior, pero reutilizando (llamando a) los métodos creados en el Ejercicio
1 y 2. 
*/
package ejercicios_básicos_ejercicio_04;
import java.util.Random;

public class App {

	public static void main(String[] args) {
		
		Random random = new Random();
		Integer rd = random.nextInt(1,3);
		
		System.out.println(rd);
		System.out.println(getMinMay(rd, " QUE pasa TOMASA prueba "));		
	}
	
	public static String getMinMay(Integer num, String cadena) {
		if (num == 1) {
			cadena = ejercicios_básicos_ejercicio_01.App.getMayusculas(cadena);
		}
		else if (num == 2) {
			cadena = ejercicios_básicos_ejercicio_02.App.getMinusculas(cadena);
		}
		return cadena;
	}
}
