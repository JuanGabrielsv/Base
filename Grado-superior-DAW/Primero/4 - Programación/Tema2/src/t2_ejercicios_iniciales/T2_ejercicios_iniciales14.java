/* 14.- Realiza un programa que pida una hora por teclado y que muestre luego buenos días, buenas tardes o
buenas noches según la hora. Se utilizarán los tramos de 6 a 12, de 13 a 20 y de 21 a 5. respectivamente.
Sólo se tienen en cuenta las horas, los minutos no se deben introducir por teclado */

package t2_ejercicios_iniciales;
import java.util.Scanner;

public class T2_ejercicios_iniciales14 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		
		System.out.println("Introduce sólo la hora, no los minutos: ");
		entradaUsuario = sc.nextInt();
		
		if (entradaUsuario >= 6 && entradaUsuario <= 12) {
			System.out.println("Buenos días.");
		}
		else if (entradaUsuario >= 13 && entradaUsuario <= 20) {
			System.out.println("Buenas tardes.");
		}
		else {
			System.out.println("Buenas noches.");
		}
		sc.close();
		

	}

}
