/*EJERCICIO 3
Realizar un programa que trabaje del siguiente modo:
1. Mostrar un mensaje pidiendo la edad del usuario
2. Esperar a que el usuario escriba su edad y almacenarla en una variable
3. Mostrar un nuevo mensaje indicando “Su edad es de xx años”*/ 

package t1_ejercicios;
import java.util.Scanner;

public class T1_ejercicio3 {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner (System.in);
		
		System.out.println("¿Qué edad tienes?");
		Integer edad = scanner.nextInt();
		System.out.println("Su edad es de " + edad + " años");
		
		scanner.close();
		
	}
}
