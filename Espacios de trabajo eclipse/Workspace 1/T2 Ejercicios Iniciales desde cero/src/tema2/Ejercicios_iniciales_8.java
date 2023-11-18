/* 8.- Dado un número entero que se introduce por teclado, determinar si es negativo o superior a 100. */
package tema2;
import java.util.Scanner;

public class Ejercicios_iniciales_8 {
public static void main(String[]args) {
	
	Scanner sc = new Scanner (System.in);
	System.out.println("Dame un número entero: ");
	int numero = sc.nextInt();
	
		if (numero < 0) {
			System.out.println("Es negativo");
		}
		else if (numero > 100) {
			System.out.println("Es superior a 100");
		}
		else {
			System.out.println("nulo");
		}
		
	sc.close();
	
}
}
