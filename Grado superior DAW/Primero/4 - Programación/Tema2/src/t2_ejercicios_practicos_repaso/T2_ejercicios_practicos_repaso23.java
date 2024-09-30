/* 
EJERCICIO 23
Realizar un programa que simule el lanzamiento de un dado durante N veces. En primer lugar,
solicitaremos al usuario cuántas veces quiere que lancemos el dado. A continuación,
imprimiremos por consola el resultado de lanzar de manera aleatoria el dado cada una de las
veces. 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;
import java.util.Random;

public class T2_ejercicios_practicos_repaso23 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		Integer entradaUsuario = 0;
				
		System.out.println("Introduce en número de veces que quieres tirar el dado: ");
		entradaUsuario = sc.nextInt();
		
		for (int i = 1; i <= entradaUsuario ; i++) {
			System.out.println(rd.nextInt(0,11));
			
		}
		sc.close();
		

	}

}
