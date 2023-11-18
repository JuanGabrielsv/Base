/* 7.- Dado un número entero que se introduce por teclado, determinar si se encuentra en el intervalo
cerrado 51-100. */
package tema2;
import java.util.Scanner;

public class Ejercicios_iniciales_7 {
	
	public static void main(String[]args) {
		
		Scanner sc = new Scanner (System.in);
		
		System.out.println("Dame un número entero: ");
		int numero = sc.nextInt();
		
		if (numero >=51 & numero <= 100) {
			System.out.println("Si");
		}
		else {
			System.out.println("No");
		}
		
		sc.close();
		
	}

}
