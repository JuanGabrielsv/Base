/* 5.- Dado un número entero y positivo que se introduce por teclado,determinar si es par o impar. (El
numero es par o impar, verificando si el modulo del numero entre 2 es 0 o no ). */
package t2_ejercicios_iniciales;
import java.util.Scanner;

public class T2_ejercicios_iniciales5 {
	
	public static void main(String[]args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Dame un número positivo y sin decimales: ");
		Integer numero = sc.nextInt();
		
		if (numero % 2 == 0) {
			System.out.println("El número es par");
		} 
		else {
			System.out.println("El número es impar");
		}
		
		sc.close();
	}

}
