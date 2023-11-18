/* EJERCICIO 1
Realizar un programa que pregunte por el año de nacimiento del usuario. Según lo que nos
indique, mostrarle por consola a qué generación pertenece según este cuadro:
Por ejemplo, los nacidos en 1994 serían generación Y o milennials. */

package tema2_ejerciciospracticos1;
import java.util.Scanner;
public class T2_Ejerciciospracticos1 {
	public static void main(String[] args) {
		
		Long año;
		boolean generacionPerdida;
		boolean generacionGrandiosa;
		boolean generacionSilenciosa;
		boolean babyBoomers;
		boolean generacionX;
		boolean generacionY;
		boolean generacionZ;
		boolean generacionAlfa;
		
		Scanner sc = new Scanner (System.in);
		System.out.println("¿En qué año naciste? ");
		año = sc.nextLong();
		
		generacionPerdida = año <= 1900;
		generacionGrandiosa = año <= 1927;
		generacionSilenciosa = año <= 1945;
		babyBoomers = año <= 1964;
		generacionX = año <= 1980;
		generacionY = año <= 1996;
		generacionZ = año <= 2012;
		generacionAlfa = año <= 2020;
		
		if (generacionPerdida) {
			System.out.println("Eres de la generación Perdida");
		}
		else if (generacionGrandiosa) {
			System.out.println("Eres de la Generación Grandiosa");
		}
		else if (generacionSilenciosa) {
			System.out.println("Eres de la Generación Silenciosa");
		}
		else if ( babyBoomers) {
			System.out.println("Eres de la Generación Baby Boomers");
		}
		else if (generacionX) {
			System.out.println("Eres de la Generación X");
		}
		else if (generacionY) {
			System.out.println("Eres de la Generación Y");
		}
		else if (generacionZ) {
			System.out.println("Eres de la Generación Z");
		}
		else if (generacionAlfa) {
			System.out.println("Eres de la generación Alfa");
		}
		else {
			System.out.println("Error en el sistema");
			sc.close();
		}
	}
}
