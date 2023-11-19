/* EJERCICIO 2
Completar el ejercicio 7 del tema anterior para mostrar si el usuario tiene o no sobrepeso
siguiente esta guía: */

package tema2_ejerciciospracticos;

import java.util.Scanner;

public class T2_Ejerciciospracticos_2 {
	public static void main(String[]args) {
		
		Scanner scanner = new Scanner (System.in);
		
		System.out.println("¿Cuál es tu altura?:");
		float altura = scanner.nextFloat();
		System.out.println("¿Cuál es tu peso?:");
		float peso = scanner.nextFloat();
		System.out.println("Vamos calcular tu IMC, que es tu peso " + peso +  " dividido por tu altura " + altura + " al cuadrado: " );
		float resultado = peso / (altura * altura);
		System.out.println(resultado);
		
		if (resultado < 18.5) {
			System.out.println("Peso inferior al normal");
		}
		else if (resultado >= 18.5 && resultado <= 24.9) {
			System.out.println("Peso normal");
		}
		else if (resultado >= 25 && resultado <= 29.9) {
			System.out.println("Peso superior al normal");
		}
		else if (resultado > 30) {
			System.out.println("Obesidad");
		}
		else {
			System.out.println("Vuelve a realizar el test");
		}
	
		scanner.close();
		
	}

}
