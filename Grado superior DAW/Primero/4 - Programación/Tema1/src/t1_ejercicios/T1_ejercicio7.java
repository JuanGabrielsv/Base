/* EJERCICIO 7
Realizar un programa que calcule el IMC (índice de masa corporal). Para ello:
1. Solicita por consola al usuario cuál es su altura y su peso (en dos pasos)
2. Recoge los datos y calcula el IMC
3. Muestra por consola el resultado del IMC calculado */

package t1_ejercicios;
import java.util.*;

public class T1_ejercicio7 {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner (System.in);
		
		System.out.println("¿Cuál es tu altura?:");
		float altura = scanner.nextFloat();
		System.out.println("¿Cuál es tu peso?:");
		float peso = scanner.nextFloat();
		System.out.println("Vamos calcular tu IMC, que es tu peso " + peso +  " dividido por tu altura " + altura + " al cuadrado: " );
		float resultado = peso / (altura * altura);
		System.out.println(resultado);
	
		scanner.close();
	}

}
