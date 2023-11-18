/* 6.- Dado un número entero que se introduce por teclado, determinar si es positivo, negativo o nulo. */
package tema2;
import java.util.Scanner;

public class Ejercicios_iniciales_6 {
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner (System.in);
		System.out.println("Dame un número entero, que no sea decimal: ");
		Integer numero = sc.nextInt();
		
		if (numero > 0) {
			System.out.println("positivo");
		}
		else if (numero < 0) {
			System.out.println("negativo");
		}
		else {
			System.out.println("nulo");
		}
		
		sc.close();
		
	}

}
