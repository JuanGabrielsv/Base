package Ejercicio1;
import java.util.Scanner;

public class ejercicio1 {
	
	
	public static void main (String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indica un texto por favor");
		String mensaje = scanner.nextLine();
		System.out.println("Indica un número por favor");
		Integer numero = scanner.nextInt();
		System.out.println("He leido esto: " + mensaje + " y esto " + numero);
		
		scanner.close();
		
	}

}
