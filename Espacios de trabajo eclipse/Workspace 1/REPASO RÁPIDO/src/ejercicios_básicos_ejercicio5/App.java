/*
EJERCICIO 5
Crea un método llamado sumar que reciba dos números enteros y devuelva el resultado de la
suma. Pruébalo desde el método main con algún test.  
*/
package ejercicios_básicos_ejercicio5;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer num1 = null;
		Integer num2 = null;
		
		System.out.println("Dame un número: ");
		num1 = sc.nextInt();
		System.out.println("Dame un segundo número: ");
		num2 = sc.nextInt();
		System.out.println(sumar(num1, num2));
		sc.close();				
	}
	
	public static Integer sumar(Integer num1, Integer num2) {
		return num1 + num2;
	}
}
