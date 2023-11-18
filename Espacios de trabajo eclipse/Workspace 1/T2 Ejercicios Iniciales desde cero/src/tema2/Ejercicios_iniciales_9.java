/* 9.- Dado un número que se introduce por teclado, si es positivo verificar si se encuentra en el intervalo
abierto 60 – 90, de lo contrario emitir un mensaje de error. */
package tema2;
import java.util.Scanner;
public class Ejercicios_iniciales_9 {
public static void main(String[]args) {
	Scanner sc = new Scanner (System.in);
	System.out.println("Dame un número entero: ");
	int numero = sc.nextInt();
		
		if (numero > 0 & numero > 60 & numero < 90) {
			System.out.println("afirmativo");			
		}
		else {
			System.out.println("mensaje de error");
		}
	
	sc.close();
}
}
